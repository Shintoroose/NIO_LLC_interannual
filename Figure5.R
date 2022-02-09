setwd("./LLC_Part2")
system("mkdir -p Figures")
system("mkdir -p junk")

#library(clusterSim)
library(ncdf4)
library(ggplot2)  
library(formattable)
library(kableExtra)
library(dplyr)
library(tidyverse)
library("ggpubr")
require("ggrepel")
#------------------ 
 

#---------------------------------SST------------------------------------------------
Year<-seq(1979,2020)
#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./LLC_Part2/NIO_LLC_parameters/U10_V10_SST_ONDmean_1979_2020_NIO.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_Clim      <-sst-273.15
#---------------------Clim


system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./LLC_Part2/ENSO_composite/New/ElNino/SST/U10_V10_SST_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_ElNino       <-sst-273.15

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./LLC_Part2/ENSO_composite/New/LaNina/SST/U10_V10_SST_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_LaNina       <-sst-273.15

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/PIOD/SST/U10_V10_SST_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_PIOD       <-sst-273.15

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/NIOD/SST/U10_V10_SST_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_NIOD       <-sst-273.15
#---------------------------------SST HLC------------------------------------------------
Year<-seq(1979,2020)
#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./NIO_LLC_parameters/U10_V10_SST_ONDmean_1979_2020_NIO.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_Clim_HLC      <-sst-273.15
#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/ElNino/SST/U10_V10_SST_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_ElNino_HLC      <-sst-273.15

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/LaNina/SST/U10_V10_SST_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_LaNina_HLC       <-sst-273.15

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/PIOD/SST/U10_V10_SST_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_PIOD_HLC       <-sst-273.15

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/NIOD/SST/U10_V10_SST_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/SST.nc")
nc <- nc_open("./junk/SST.nc")
sst<-ncvar_get(nc, "sst")
SST_NIOD_HLC       <-sst-273.15
#---------------------------------RH------------------------------------------------
Year<-seq(1979,2020)

#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./NIO_LLC_parameters/RH_ONDmean_1979_2020_NIO.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_Clim       <-rh
#---------------------Clim


system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./ENSO_composite/New/ElNino/RH/RH700_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_ElNino       <-rh

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./ENSO_composite/New/LaNina/RH/RH700_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_LaNina       <-rh

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/PIOD/RH/RH700_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_PIOD       <-rh

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/NIOD/RH/RH700_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_NIOD       <-rh
#---------------------------------RH HLC------------------------------------------------
Year<-seq(1979,2020)

#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./NIO_LLC_parameters/RH_ONDmean_1979_2020_NIO.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_Clim_HLC       <-rh
#---------------------Clim

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/ElNino/RH/RH700_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_ElNino_HLC       <-rh

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/LaNina/RH/RH700_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_LaNina_HLC       <-rh

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/PIOD/RH/RH700_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_PIOD_HLC       <-rh

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/NIOD/RH/RH700_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RH.nc")
nc <- nc_open("./junk/RH.nc")
rh<-ncvar_get(nc, "r")
RH_NIOD_HLC       <-rh
#---------------------------------VSHEAR------------------------------------------------
Year<-seq(1979,2020)

#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./NIO_LLC_parameters/VSHEAR_ONDmean_1979_2020_NIO.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_Clim       <-vshear
#---------------------Clim

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./ENSO_composite/New/ElNino/VSHEAR/VSHEAR_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_ElNino       <-vshear

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./ENSO_composite/New/LaNina/VSHEAR/VSHEAR_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_LaNina       <-vshear

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/PIOD/VSHEAR/VSHEAR_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_PIOD       <-vshear

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/NIOD/VSHEAR/VSHEAR_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_NIOD       <-vshear
#---------------------------------VSHEAR HLC------------------------------------------------
Year<-seq(1979,2020)

#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./NIO_LLC_parameters/VSHEAR_ONDmean_1979_2020_NIO.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_Clim_HLC       <-vshear
#---------------------Clim

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/ElNino/VSHEAR/VSHEAR_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_ElNino_HLC       <-vshear

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/LaNina/VSHEAR/VSHEAR_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_LaNina_HLC       <-vshear

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/PIOD/VSHEAR/VSHEAR_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_PIOD_HLC       <-vshear

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/NIOD/VSHEAR/VSHEAR_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/VSHEAR.nc")
nc <- nc_open("./junk/VSHEAR.nc")
vshear<-ncvar_get(nc, "VSHEAR")
VSHEAR_NIOD_HLC       <-vshear
#---------------------------------RVORT------------------------------------------------
Year<-seq(1979,2020)

#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./NIO_LLC_parameters/RVORT_ONDmean_1979_2020_NIO.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_Clim       <-rvort*10^5
#---------------------Clim


system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./ENSO_composite/New/LaNina/RVORT/RVORT_850_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_LaNina       <-rvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/PIOD/RVORT/RVORT_850_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_PIOD       <-rvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/NIOD/RVORT/RVORT_850_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_NIOD       <-rvort*10^5
#---------------------------------RVORT HLC------------------------------------------------
Year<-seq(1979,2020)

#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./NIO_LLC_parameters/RVORT_ONDmean_1979_2020_NIO.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_Clim_HLC       <-rvort*10^5
#---------------------Clim

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/ElNino/RVORT/RVORT_850_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_ElNino_HLC       <-rvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/LaNina/RVORT/RVORT_850_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_LaNina_HLC       <-rvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/PIOD/RVORT/RVORT_850_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_PIOD_HLC       <-rvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/NIOD/RVORT/RVORT_850_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/RVORT.nc")
nc <- nc_open("./junk/RVORT.nc")
rvort<-ncvar_get(nc, "vo")
RVORT_NIOD_HLC       <-rvort*10^5
#---------------------------------ABSVORT------------------------------------------------
Year<-seq(1979,2020)

#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./NIO_LLC_parameters/eta_ONDmean_1979_2020_NIO.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_Clim       <-absvort*10^5
#---------------------Clim

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./ENSO_composite/New/ElNino/ABSVORT/ABSVORT_850_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_ElNino       <-absvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./ENSO_composite/New/LaNina/ABSVORT/ABSVORT_850_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_LaNina       <-absvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/PIOD/ABSVORT/ABSVORT_850_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_PIOD       <-absvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,5,10 ./IOD_composite/New/NIOD/ABSVORT/ABSVORT_850_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_NIOD       <-absvort*10^5
#---------------------------------ABSVORT HLC------------------------------------------------
Year<-seq(1979,2020)

#---------------------Clim
system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./NIO_LLC_parameters/eta_ONDmean_1979_2020_NIO.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_Clim_HLC  <-absvort*10^5
#---------------------Clim

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/ElNino/ABSVORT/ABSVORT_850_ELNINO_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_ElNino_HLC       <-absvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./ENSO_composite/New/LaNina/ABSVORT/ABSVORT_850_LANINA_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_LaNina_HLC       <-absvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/PIOD/ABSVORT/ABSVORT_850_PIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_PIOD_HLC       <-absvort*10^5

system("cdo timmean -fldmean -sellonlatbox,83,95,10,20 ./IOD_composite/New/NIOD/ABSVORT/ABSVORT_850_NIOD_YEARS_1979_2020_ERA5_ONDmean.nc ./junk/ABSVORT.nc")
nc <- nc_open("./junk/ABSVORT.nc")
absvort<-ncvar_get(nc, "ETA")
ABSVORT_NIOD_HLC       <-absvort*10^5

#---------------------------------Planetary Vorticity------------------------------------------------
OMEGA       = 2*3.14159/86400    #The angular velocity of the earth  (2 Pi rad /day)
C           = 3.14159/180        #Conversion factor -- radians/degree
2*OMEGA*sin(1)*C *10^5

Lat <- c(0:25)
CoriolisParam<-data.frame(Latitude=Lat)
for (i in Lat) {CoriolisParam$f[i+1]=2*OMEGA*sin(i*C)}
CoriolisParam

mean(CoriolisParam$f[12:21])
mean(CoriolisParam$f[6:11])
 

SST    =c(SST_ElNino,SST_PIOD, SST_LaNina,SST_NIOD,SST_ElNino_HLC,SST_PIOD_HLC, SST_LaNina_HLC,SST_NIOD_HLC)
RH     =c(RH_ElNino,RH_PIOD, RH_LaNina,RH_NIOD,RH_ElNino_HLC,RH_PIOD_HLC, RH_LaNina_HLC,RH_NIOD_HLC)
VSHEAR =c(VSHEAR_ElNino,VSHEAR_PIOD, VSHEAR_LaNina,VSHEAR_NIOD,VSHEAR_ElNino_HLC,VSHEAR_PIOD_HLC, VSHEAR_LaNina_HLC,VSHEAR_NIOD_HLC)
RVORT  =c(RVORT_ElNino,RVORT_PIOD, RVORT_LaNina,RVORT_NIOD,RVORT_ElNino_HLC,RVORT_PIOD_HLC, RVORT_LaNina_HLC,RVORT_NIOD_HLC)
ABSVORT  =c(ABSVORT_ElNino,ABSVORT_PIOD, ABSVORT_LaNina,ABSVORT_NIOD,ABSVORT_ElNino_HLC,ABSVORT_PIOD_HLC, ABSVORT_LaNina_HLC,ABSVORT_NIOD_HLC)

MeanValues<-c(SST_LL=SST_Clim,SST_HL=SST_Clim_HLC,RH_LL=RH_Clim,RH_HL=RH_Clim_HLC,VSHEAR_LL=VSHEAR_Clim,VSHEAR_HL=VSHEAR_Clim_HLC)
MeanValues

df_SST    <-data.frame(parameter=SST,Phases=rep(c("a", "b", "c","d","e","f","g","h"), each=1))
df_RH     <-data.frame(parameter=RH,Phases=rep(c("a", "b", "c","d","e","f","g","h"), each=1))
df_VSHEAR <-data.frame(parameter=VSHEAR,Phases=rep(c("a", "b", "c","d","e","f","g","h"), each=1))  
df_RVORT  <-data.frame(parameter=RVORT,Phases=rep(c("a", "b", "c","d","e","f","g","h"), each=1))
df_AVORT  <-data.frame(parameter=ABSVORT,Phases=rep(c("a", "b", "c","d","e","f","g","h"), each=1))

rect1 <- data.frame (xmin=-Inf, xmax=4.5, ymin=-Inf, ymax=Inf)
rect2 <- data.frame (xmin=4.5, xmax=Inf, ymin=-Inf, ymax=Inf)

p1<-ggplot(data=df_SST, aes(x=Phases, y=parameter)) +
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.3, colour = "black")+
  geom_rect(data=rect2, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="green", alpha=0.1, inherit.aes = FALSE)+
  geom_rect(data=rect1, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="red", alpha=0.1, inherit.aes = FALSE)+
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.3, colour = "black")+
  #scale_color_manual(values = c('ERSST' = 'royalblue4', 'HadISST' = 'orange')) +
  #labs(color = '')+
  #geom_point(color = "royalblue4", size = 2)+ 
  
  geom_segment(aes(x = 4.4, y = 29, xend = 0.5, yend = 29, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 8.5, y = 29, xend = 4.6, yend = 29, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 0.5, y = 29, xend = 4.4, yend = 29, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 4.6, y = 29, xend = 8.5, yend = 29, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_label(data=df_SST, aes(x=2.5, y=29, label = "Region:5°-10°N, 83°-95°E"),size=5,color = "royalblue4", family="Times New Roman") +
  geom_label(data=df_SST, aes(x=6.5, y=29, label = "Region:10°-20°N, 83°-95°E"),size=5,color = "royalblue4", family="Times New Roman") +
  
  geom_segment(aes(x = 4.4, y = SST_Clim, xend = 0.5, yend = SST_Clim, colour = "segment"), lineend = "round", linejoin = "round", color="red", lty = 2) +
  geom_segment(aes(x = 8.5, y = SST_Clim_HLC, xend = 4.6, yend = SST_Clim_HLC, colour = "segment"), lineend = "round", linejoin = "round", color="red", lty = 2) +

  
  geom_vline(xintercept = 4.5, lty = 2, color = "royalblue4") +
  coord_cartesian(ylim = c(28, 29)) +
  scale_x_discrete(name = "Climate mode", label = c("El Niño",  "PIOD", "La Niña", "NIOD","El Niño",  "PIOD", "La Niña", "NIOD"))+
  scale_y_continuous(name = expression(paste("SST (°C)")))+
  ggtitle("(a) Sea Surface Temperature") +
  #xlab("Longitude") + ylab(expression(paste("SST (°C)")))+
  theme(legend.position = c(0.3, 0.9),
        legend.direction = "horizontal",
        
        legend.title = element_text(color = "black", size = 16),
        legend.text = element_text(color = "black", size = 16),
        
        axis.text.x = element_text(family="Times New Roman"
                                   ,size=20
                                   #,face="bold"
                                   ,color="black"),
        axis.text.y = element_text(family="Times New Roman"
                                   ,size=20
                                   #,face="bold"
                                   ,color="royalblue4"),
        axis.title.y = element_text(family="Times New Roman"
                                    ,size=20
                                    #,face="bold"
                                    ,color="black"),
        axis.title.x = element_text(family="Times New Roman"
                                    ,size=20
                                    #,face="bold"
                                    ,color="black"),
        plot.title = element_text(hjust = 0.5, color="black", 
                                  #       face="bold"
                                  #       family="Comic Sans MS",
                                  #       family="CM Roman",
                                  family="Times New Roman",
                                  #       family="Sans",
                                  #       family="Serif",
                                  size=20, angle=0))

p1
ggsave("./Figures/SST_LowLatBoB.png", width = 23, height = 14, units = "cm", dpi = 300)


p2<-ggplot(data=df_RH, aes(x=Phases, y=parameter)) +
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.3, colour = "black")+
  geom_rect(data=rect2, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="green", alpha=0.1, inherit.aes = FALSE)+
  geom_rect(data=rect1, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="red", alpha=0.1, inherit.aes = FALSE)+
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.3, colour = "black")+
  geom_vline(xintercept = 4.5, lty = 2, color = "royalblue4") +
  coord_cartesian(ylim = c(40,70)) +
  scale_x_discrete(name = "Climate mode", label = c("El Niño",  "PIOD", "La Niña", "NIOD","El Niño",  "PIOD", "La Niña", "NIOD"))+
  scale_y_continuous(name = expression(paste("RH(%)")))+
  
  geom_segment(aes(x = 4.4, y = 70, xend = 0.5, yend = 70, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 8.5, y = 70, xend = 4.6, yend = 70, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 0.5, y = 70, xend = 4.4, yend = 70, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 4.6, y = 70, xend = 8.5, yend = 70, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_label(data=df_RH, aes(x=2.5, y=70, label = "Region:5°-10°N, 83°-95°E"),size=5,color = "royalblue4", family="Times New Roman") +
  geom_label(data=df_RH, aes(x=6.5, y=70, label = "Region:10°-20°N, 83°-95°E"),size=5,color = "royalblue4", family="Times New Roman") +
  
  geom_segment(aes(x = 4.4, y = RH_Clim, xend = 0.5, yend = RH_Clim, colour = "segment"), lineend = "round", linejoin = "round", color="red", lty = 2) +
  geom_segment(aes(x = 8.5, y = RH_Clim_HLC, xend = 4.6, yend = RH_Clim_HLC, colour = "segment"), lineend = "round", linejoin = "round", color="red", lty = 2) +
  
  
  ggtitle("(b) Relative Humidity (700 hPa)") +
  #xlab("Longitude") + ylab("Latitude")+
  theme(legend.position = c(0.3, 0.85),
        legend.direction = "horizontal",
        
        legend.title = element_text(color = "black", size = 16),
        legend.text = element_text(color = "black", size = 16),
        
        axis.text.x = element_text(family="Times New Roman"
                                   ,size=20
                                   #,face="bold"
                                   ,color="black"),
        axis.text.y = element_text(family="Times New Roman"
                                   ,size=20
                                   #,face="bold"
                                   ,color="royalblue4"),
        axis.title.y = element_text(family="Times New Roman"
                                    ,size=20
                                    #,face="bold"
                                    ,color="black"),
        axis.title.x = element_text(family="Times New Roman"
                                    ,size=20
                                    #,face="bold"
                                    ,color="black"),
        plot.title = element_text(hjust = 0.5, color="black", 
                                  #       face="bold"
                                  #       family="Comic Sans MS",
                                  #       family="CM Roman",
                                  family="Times New Roman",
                                  #       family="Sans",
                                  #       family="Serif",
                                  size=20, angle=0))
#----------------------------------------------------------
p2
ggsave("./Figures/RH_LowLatBoB.png", width = 23, height = 14, units = "cm", dpi = 300)
#-----------------------------------------------------------------------------------------------------

p3<-ggplot(data=df_VSHEAR, aes(x=Phases, y=parameter)) +
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.3, colour = "black")+
  geom_rect(data=rect2, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="green", alpha=0.1, inherit.aes = FALSE)+
  geom_rect(data=rect1, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="red", alpha=0.1, inherit.aes = FALSE)+
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.3, colour = "black")+
  geom_vline(xintercept = 4.5, lty = 2, color = "royalblue4") +
  coord_cartesian(ylim = c(2.5,13)) +
  scale_x_discrete(name = "Climate mode", label = c("El Niño",  "PIOD", "La Niña", "NIOD", "El Niño",  "PIOD", "La Niña", "NIOD"))+
  scale_y_continuous(name = expression(paste("Wind Shear (200hPa-850hPa)")))+
  ggtitle("(c) Vertical wind shear") +
  
  
  geom_segment(aes(x = 4.4, y = 13, xend = 0.5, yend = 13, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 8.5, y = 13, xend = 4.6, yend = 13, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 0.5, y = 13, xend = 4.4, yend = 13, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 4.6, y = 13, xend = 8.5, yend = 13, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_label(data=df_SST, aes(x=2.5, y=13, label = "Region:5°-10°N, 83°-95°E"),size=5,color = "royalblue4", family="Times New Roman") +
  geom_label(data=df_SST, aes(x=6.5, y=13, label = "Region:10°-20°N, 83°-95°E"),size=5,color = "royalblue4", family="Times New Roman") +
  
  geom_segment(aes(x = 4.4, y = VSHEAR_Clim, xend = 0.5, yend = VSHEAR_Clim, colour = "segment"), lineend = "round", linejoin = "round", color="red", lty = 2) +
  geom_segment(aes(x = 8.5, y = VSHEAR_Clim_HLC, xend = 4.6, yend = VSHEAR_Clim_HLC, colour = "segment"), lineend = "round", linejoin = "round", color="red", lty = 2) +
  

  #xlab("Longitude") + ylab("Latitude")+
  theme(legend.position = c(0.3, 0.85),
        legend.direction = "horizontal",
        
        legend.title = element_text(color = "black", size = 16),
        legend.text = element_text(color = "black", size = 16),
        
        axis.text.x = element_text(family="Times New Roman"
                                   ,size=20
                                   #,face="bold"
                                   ,color="black"),
        axis.text.y = element_text(family="Times New Roman"
                                   ,size=20
                                   #,face="bold"
                                   ,color="royalblue4"),
        axis.title.y = element_text(family="Times New Roman"
                                    ,size=20
                                    #,face="bold"
                                    ,color="black"),
        axis.title.x = element_text(family="Times New Roman"
                                    ,size=20
                                    #,face="bold"
                                    ,color="black"),
        plot.title = element_text(hjust = 0.5, color="black", 
                                  #       face="bold"
                                  #       family="Comic Sans MS",
                                  #       family="CM Roman",
                                  family="Times New Roman",
                                  #       family="Sans",
                                  #       family="Serif",
                                  size=20, angle=0))
#----------------------------------------------------------
p3
ggsave("./Figures/VSHEAR_LowLatBoB.png", width = 23, height = 14, units = "cm", dpi = 300)
#-----------------------------------------------------------------------------------------------------

p4<-ggplot(data=df_AVORT, aes(x=Phases, y=parameter)) +
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.3, colour = "black")+
  geom_rect(data=rect2, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="green", alpha=0.1, inherit.aes = FALSE)+
  geom_rect(data=rect1, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="red", alpha=0.1, inherit.aes = FALSE)+
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.3, colour = "black")+
  geom_vline(xintercept = 4.5, lty = 2, color = "royalblue4") +
  #coord_cartesian(ylim = c( -1,1)) +
  coord_cartesian(ylim = c( 2,3.8)) +
  scale_x_discrete(name = "Climate mode", label = c("El Niño",  "PIOD", "La Niña", "NIOD", "El Niño",  "PIOD", "La Niña", "NIOD"))+
  scale_y_continuous(name = expression(paste("Absolute vorticity ( x 10"^"-5","sec"^"-1",")")))+
  #ggtitle("(d) Relative vorticity (850 hPa)") +
  ggtitle("(d) Absolute vorticity (850 hPa)") +
  
  geom_label(data=df_RH, aes(x=2.5, y=2, label = "f=1.89758e-05"),size=5,color = "royalblue4", family="Times New Roman") +
  geom_label(data=df_RH, aes(x=6.5, y=2, label = "f=3.881936e-05"),size=5,color = "royalblue4", family="Times New Roman") +
  
  
  geom_segment(aes(x = 4.4, y = 3.8, xend = 0.5, yend = 3.8, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 8.5, y = 3.8, xend = 4.6, yend = 3.8, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 0.5, y = 3.8, xend = 4.4, yend = 3.8, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_segment(aes(x = 4.6, y = 3.8, xend = 8.5, yend = 3.8, colour = "segment"), lineend = "round", linejoin = "round", color="black", arrow = arrow(length = unit(0.03, "npc"))) +
  geom_label(data=df_SST, aes(x=2.5, y=3.8, label = "Region:5°-10°N, 83°-95°E"),size=5,color = "royalblue4", family="Times New Roman") +
  geom_label(data=df_SST, aes(x=6.5, y=3.8, label = "Region:10°-20°N, 83°-95°E"),size=5,color = "royalblue4", family="Times New Roman") +
  
  geom_segment(aes(x = 4.4, y = ABSVORT_Clim, xend = 0.5, yend = ABSVORT_Clim, colour = "segment"), lineend = "round", linejoin = "round", color="red", lty = 2) +
  geom_segment(aes(x = 8.5, y = ABSVORT_Clim_HLC, xend = 4.6, yend = ABSVORT_Clim_HLC, colour = "segment"), lineend = "round", linejoin = "round", color="red", lty = 2) +
  
  #xlab("Longitude") + ylab("Latitude")+
  theme(legend.position = c(0.3, 0.85),
        legend.direction = "horizontal",
        
        legend.title = element_text(color = "black", size = 16),
        legend.text = element_text(color = "black", size = 16),
        
        axis.text.x = element_text(family="Times New Roman"
                                   ,size=20
                                   #,face="bold"
                                   ,color="black"),
        axis.text.y = element_text(family="Times New Roman"
                                   ,size=20
                                   #,face="bold"
                                   ,color="royalblue4"),
        axis.title.y = element_text(family="Times New Roman"
                                    ,size=20
                                    #,face="bold"
                                    ,color="black"),
        axis.title.x = element_text(family="Times New Roman"
                                    ,size=20
                                    #,face="bold"
                                    ,color="black"),
        plot.title = element_text(hjust = 0.5, color="black", 
                                  #       face="bold"
                                  #       family="Comic Sans MS",
                                  #       family="CM Roman",
                                  family="Times New Roman",
                                  #       family="Sans",
                                  #       family="Serif",
                                  size=20, angle=0))
#----------------------------------------------------------
p4
ggsave("./Figures/RVORT_LowLatBoB.png", width = 23, height = 14, units = "cm", dpi = 300)
#-----------------------------------------------------------------------------------------------------

system("montage -mode concatenate -tile 2x ./Figures/SST_LowLatBoB.png ./Figures/RH_LowLatBoB.png ./Figures/Top.png")
system("montage -mode concatenate -tile 2x ./Figures/VSHEAR_LowLatBoB.png ./Figures/RVORT_LowLatBoB.png ./Figures/Bottom.png")
system("montage -mode concatenate -tile 1x ./Figures/Top.png ./Figures/Bottom.png ./Figures/FourParam_LowLatBoB.png")


