setwd("./LLC_Part2")
system("mkdir -p Figures")
system("mkdir -p junk")

#library(clusterSim)
library(ncdf4)
library(ggplot2)  
library(formattable)
library(kableExtra)
library(dplyr)
library("ggpubr")
require("ggrepel")
#------------------
#---------------------------------------------------------------------------------VWS
system("cdo -fldmean -sellonlatbox,83,95,5,10 ./LLC_Part2/NIO_LLC_parameters/VSHEAR_ONDmean_1979_2020_NIO.nc ./junk/LL_VWS_Vort.nc")
nc <- nc_open("./junk/LL_VWS_Vort.nc")
vws<-ncvar_get(nc, "VSHEAR")
vws_anom<-vws-mean(vws)
vws_norm_anom<- (vws - mean(vws)) / sd(vws) 
Year<-seq(1979,2020)
vws_ANOM<-vws_anom*10^5
VWS_ANOM<-data.frame(Year, vws_ANOM, vws_norm_anom)
#---------------------------------------------------------------------------------Absolute Vorticity
#system("cdo -fldmean -sellonlatbox,83,95,5,10 /Volumes/PRELATE/PostDocResearch/LLC_Part2/AbsVort_925/eta_1979_2020_925hPa_ONDmean.nc ./junk/LL_absVort.nc")
system("cdo -fldmean -sellonlatbox,83,95,5,10 ./LLC_Part2/NIO_LLC_parameters/eta_ONDmean_1979_2020_NIO.nc ./junk/LL_absVort.nc")

nc <- nc_open("./junk/LL_absVort.nc")
eta<-ncvar_get(nc, "ETA")
eta_anom<-eta-mean(eta)
eta_norm_anom<- (eta - mean(eta)) / sd(eta) 
Year<-seq(1979,2020)
eta_ANOM<-eta_anom*10^5
ETA_ANOM<-data.frame(Year, eta_ANOM, eta_norm_anom)

#---------------------------------EQuatorial Wind------------------------------------------------
Year<-seq(1979,2020)
#system("cdo -fldmean -sellonlatbox,83,95,-2.5,2.5 -yearmean -selmon,10/12 /Volumes/PRELATE/DATASETS/ERA5/Monthly/925UV/UWND_1979_2020_ERA5_925hPa.nc ./junk/eqwin.nc")
system("cdo -fldmean -sellonlatbox,83,95,-2.5,2.5 -yearmean -selmon,10/12 -sellevel,850 /DATASETS/ERA5/Monthly/UV_850_200_1979_2020.nc ./junk/eqwin.nc")
nc <- nc_open("./junk/eqwin.nc")
eqwin<-ncvar_get(nc, "u")
eqwin_anom<-eqwin-mean(eqwin)
eqwin_norm_anom<- (eqwin - mean(eqwin)) / sd(eqwin) 

EQWIN       <-data.frame(Year, eqwin_anom, eqwin_norm_anom)
EQWIN$EQWIN_Phase <- ifelse(EQWIN$eqwin_anom < 0, "Easterly","Westerly")
#---------------------------------------ENSO------------------------------------------------
#Criteria: values greater than or equal to 0.5 C for a minimum of four consecutive overlapping seasons (ASO -> NDJ)
oni <- readLines("./Documents/indices/ONI/Oceanic_Nino_Index_ONI_ERSST_v5_SST.txt")
ONI = read.table(text = oni,header=T)
Period <- seq(1:length(ONI$Year))

for (i in Period) {
  # Create multiple condition statement
  Phases<-c("El Niño","La Niña","Neutral")
  
  if (ONI$ASO[i] >= 0.5 & ONI$SON[i] >= 0.5 & ONI$OND[i] >= 0.5 & ONI$NDJ[i] >= 0.5) {
    ONI$ENSO_Phase[i] <-Phases[1]
  } else if (ONI$ASO[i] <= -0.5 & ONI$SON[i] <= -0.5 & ONI$OND[i] <= -0.5 & ONI$NDJ[i] <= -0.5) {
    ONI$ENSO_Phase[i] <-Phases[2]
  } else {
    ONI$ENSO_Phase[i] <-Phases[3]
  }
  
}

ELNINO<-ONI %>% filter(ENSO_Phase == "El Niño")
LANINA<-ONI %>% filter(ENSO_Phase == "La Niña")
NeutralENSO<-ONI %>% filter(ENSO_Phase == "Neutral")

max_length <- max(c(length(ELNINO$Year), length(LANINA$Year)))    # Find out maximum length
ENSO_years <- data.frame(ElNino = c(ELNINO$Year,                  # Create data frame with unequal vectors
                                    rep("", max_length - length(ELNINO$Year))),
                         LaNina = c(LANINA$Year,
                                    rep("", max_length - length(LANINA$Year))))

#----------------------------------------DMI----------------------------------- 
#DMI <- readLines("https://psl.noaa.gov/gcos_wgsp/Timeseries/Data/dmi.had.long.data")
dmi <- readLines("./Documents/indices/DMI/dmi.had.long.data.txt")
DMI_1870_2021 = read.table(text = dmi,  
                           col.names=c("Year","JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"),
                           header=F, 
                           skip = 1, nrows = length(dmi) - 9)

DMI_1870_2021$SON <- round(rowMeans(DMI_1870_2021[,10:12]),1)
DMI_1870_2021$SON <- round(rowMeans(DMI_1870_2021[,10:12]),1)
DMI_1870_2021$JJASON <- round(rowMeans(DMI_1870_2021[,7:12]),1)
DMI_1870_2021$ANN <- round(rowMeans(DMI_1870_2021[,2:13]),1)
DMI_1870_2021$SOND <- round(rowMeans(DMI_1870_2021[,10:13]),1)
DMI_1870_2021$OND <- round(rowMeans(DMI_1870_2021[,11:13]),1)



DMI<-DMI_1870_2021 %>% filter(Year >= 1950)

sd(DMI$ANN[30:71])

Period <- seq(1:length(DMI$Year))

for (i in Period) {
  # Create multiple condition statement
  Phases_brac<-c("(PIOD)","(NIOD)","")
  Phases<-c("PIOD","NIOD","Neutral")
  
  if (DMI$SON[i] > 0.2489583) {
    DMI$DMI_Phase[i] <-Phases[1]
    DMI$DMI_PhaseBrac[i] <-Phases_brac[1]
  } else if (DMI$SON[i] < -0.2489583) {
    DMI$DMI_Phase[i] <-Phases[2]
    DMI$DMI_PhaseBrac[i] <-Phases_brac[2]
  } else {
    DMI$DMI_Phase[i] <-Phases[3]
    DMI$DMI_PhaseBrac[i] <-Phases_brac[3]
  }
  
}
PIOD<-DMI %>% filter(DMI_Phase == "PIOD")
NIOD<-DMI %>% filter(DMI_Phase == "NIOD")
NEUTRAL_IOD<-DMI %>% filter(DMI_Phase == "Neutral")

max_length <- max(c(length(PIOD$Year), length(NIOD$Year)))    # Find out maximum length
IOD_years <- data.frame(PIOD = c(PIOD$Year,                  # Create data frame with unequal vectors
                                 rep("", max_length - length(PIOD$Year))),
                        NIOD = c(NIOD$Year,
                                 rep("", max_length - length(NIOD$Year))))

#---------------------------------------------------------------------------------BoB TC
TC <- readLines("./LLC_Part2/EAtlas_IMD/BoB_TropicalCyclone_OND_1979_2020.csv")

colname<-c("Year","5-6N",">6-7N",">7-8N",">8-9N",">9-10N",
           ">10-11N",">11-12N",">12-13N",">13-14N",">14-15N",
           ">15-16N",">16-17N",">17-18N",">18-19N",">19-20N",
           ">20-21N",">21N","Total")


TC_1979_2020 = read.table(text = TC,  
                          col.names = colname,
                          header=F, 
                          sep = ",",
                          skip = 1, nrows = length(TC) - 2)



TC_1979_2020$LLC<-rowSums(TC_1979_2020[2:6])  
TC_1979_2020$HLC<-rowSums(TC_1979_2020[7:18])  
TC_1979_2020$BOB<-rowSums(TC_1979_2020[2:18])  

TC_1979_2020$ENSO<-ONI$ENSO_Phase[30:71]
TC_1979_2020$IOD<-DMI$DMI_Phase[30:71]
TC_1979_2020$EQWIN<-round(EQWIN$eqwin_norm_anom,2)

#knitr::kable(TC_1979_2020, caption = "Tropical Cyclones BOB OND 1979-2020")

#------------------------------------------------ 

df<-data.frame(AbsVo_norm=ETA_ANOM$eta_norm_anom,
               VWS_norm=VWS_ANOM$vws_norm_anom,
               Eqwin_norm=EQWIN$eqwin_norm_anom,
               Year=seq(1979,2020),
               ENSO=ONI$ENSO_Phase[30:71],
               IOD=DMI$DMI_Phase[30:71],
               DMI=DMI$SON[30:71],      
               ONI=ONI$NDJ[30:71],    
               IOD_Brac=DMI$DMI_PhaseBrac[30:71],
               EQWIN=EQWIN$EQWIN_Phase,
               BOB=TC_1979_2020$BOB,
               LLC=TC_1979_2020$LLC,
               HLC=TC_1979_2020$HLC)
df$IODYear<-paste0(df$Year,df$IOD_Brac)

Period <- seq(1:length(df$LLC))

for (i in Period) {
  
  if (df$LLC[i] > 0) {
    df$LLC_DMI[i] <-df$IOD[i]
  } else {
    df$LLC_DMI[i] <-""
  }
  
}
#----------------------------------------------------------
cor.test(df$ONI,df$LLC)
cor.test(df$ONI,df$HLC)

cor.test(df$DMI,df$LLC)
cor.test(df$DMI,df$HLC)
#------------------------------------------------
ELNINO_LLC<-df %>% filter(ENSO == "El Niño")
LANINA_LLC<-df %>% filter(ENSO == "La Niña")
ENSO_LLC <- rbind(ELNINO_LLC,LANINA_LLC)

Westerly_LLC<-df %>% filter(EQWIN == "Easterly")
Easterly_LLC<-df %>% filter(EQWIN == "Westerly")
EQWIN_LLC <- rbind(Westerly_LLC,Easterly_LLC)
#----------------------------------------------------------
LLC_EQWIN_ENSO_IOD<-ggplot(df, aes(x=Eqwin_norm, y=LLC, colour=ENSO)) +
  geom_vline(xintercept = 0, lty = 2, color = "black") +
  geom_hline(yintercept = 1, lty = 2, color = "black") +
  geom_point() + 
  #geom_smooth(method = "lm", color = "orange", size = 1, level=0.95, se = T) +

  
  #geom_bar(stat="identity", width = 0.05, position = position_dodge(width=2.8)) +
  #geom_text_repel(aes(label = IODYear),size = 3, show_guide = F, color= "Black",family="Times New Roman", 
  #                arrow = arrow(length = unit(0.015, "npc")), 
  #                point.padding = 0.2,
  #                nudge_x = .15,
  #                nudge_y = .5,
  #                segment.linetype = 6,
  #                segment.curvature = -1e-20) +
  geom_text_repel(aes(label = IODYear),size = 3, show_guide = F,family="Times New Roman",
                  arrow = arrow(length = unit(0.015, "npc")), 
                  point.padding = 0.2,
                  nudge_x = .15,
                  nudge_y = .5,
                  segment.linetype = 1,
                  segment.curvature = -1e-10) +
  
  scale_fill_manual(values=c('red', '#56B4E9','#999999'))+ ##E69F00
  scale_color_manual(values=c('red', '#56B4E9','#999999'))+ ##E69F00
  ylim(-0.5, 2.5) +
  scale_y_continuous(name="Number of LLC",limits = c(-0.5, 2.5)) +
  scale_x_continuous(name="Normalized anomaly of equatorial wind (850 hPa)",limits = c(-3.1, 3.1), breaks = seq(-3,3,1)) +
  geom_segment(aes(x = 0, y = -0.5, xend = -Inf, yend = -0.5, colour = "segment"), 
               lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 0, y = -0.5, xend = Inf, yend = -0.5, colour = "segment"), 
               lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  #geom_segment(aes(x = 0, y = -Inf, xend = 0, yend = 0.1, colour = "segment"), lineend = "round", linejoin = "round", color="black") +
  geom_label(data=df, aes(x=-2, y=-0.5, label = "Easterly Phase"),size=5,color = "royalblue4", family="Times New Roman", fill="white") +
  geom_label(data=df, aes(x=2, y=-0.5, label = "Westerly Phase"),size=5,color = "royalblue4", family="Times New Roman", fill="white") +
  ggtitle("(b)                                                                                                     ")+
  theme(#legend.position=c(.90,.80),
        legend.position=c(.85,.2),
        legend.title=element_text(size=12,family="Times New Roman"), 
        legend.text=element_text(size=12,family="Times New Roman"),
        axis.text.x = element_text(family="Times New Roman",size=16,color="black"),
        axis.text.y = element_text(family="Times New Roman",size=16 ,color="royalblue4"),
        axis.title.y = element_text(family="Times New Roman",size=14,color="black"),
        axis.title.x = element_text(family="Times New Roman",size=14,color="black"),
        plot.title = element_text(hjust = 0.5, color="black",family="Times New Roman",size=20, angle=0))
LLC_EQWIN_ENSO_IOD
ggsave("./Figures/LLC_5_10_EQWIN_ENSO_IOD_new.png", width = 18, height = 15, units = "cm", dpi = 300) 

#----------------------------------------------------------
system(" montage -mode concatenate -tile 2x ./Figures/EQWIN_ETA_5N10N_new.png ./Figures/LLC_5_10_EQWIN_ENSO_IOD_new.png ./Figures/LLC_ENSO_IOD_EQWIN_new.png")

