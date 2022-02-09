setwd("./BOB_80_100E/ENSO_IOD")
library(ncdf4)
library(ggplot2) # package for plotting
library(png)
library(ggrepel)
circle <- readPNG("/Users/shintoroose/Documents/worldcoastalShape/circle-512-4.png")
#df2 <- data.frame(Category=rep(c("LLC", "LLC intensified into SCS","LLC intensified into SCS with in 10°N"), each=2),
#                  epochs=rep(c("Epoch-1", "Epoch-2"),3),
 #                 LLC=c(46,26,34,19,12,8))
rect1 <- data.frame (xmin=-Inf, xmax=3.5, ymin=-Inf, ymax=Inf)
rect2 <- data.frame (xmin=3.5, xmax=Inf, ymin=-Inf, ymax=Inf)


LLC_elnino_cs=4
LLC_lanina_cs=12
LLC_piod_cs=5
LLC_niod_cs=10

HLC_elnino_cs=12
HLC_lanina_cs=12  
HLC_piod_cs=11  
HLC_niod_cs=13  

LLC_elnino_scs=3
LLC_lanina_scs=10
LLC_piod_scs=4
LLC_niod_scs=7

HLC_elnino_scs=6
HLC_lanina_scs=8
HLC_piod_scs=7 
HLC_niod_scs=7  

TC=c(LLC_lanina_cs,LLC_niod_cs,LLC_elnino_cs,LLC_piod_cs,
     HLC_lanina_cs,HLC_niod_cs,HLC_elnino_cs,HLC_piod_cs,
     LLC_lanina_scs,LLC_niod_scs,LLC_elnino_scs,LLC_piod_scs,
     HLC_lanina_scs,HLC_niod_scs,HLC_elnino_scs,HLC_piod_scs)

df2 <- data.frame(Category=rep(c("CS+SCS", "SCS"), each=8),
                  epochs=rep(c("a", "b","c", "d","e", "f","g", "h"),2),
                  TC)

df2
head(df2)

(df2$TC[9]/df2$TC[1])*100  #LLC lanina
(df2$TC[10]/df2$TC[2])*100 #LLC niod
(df2$TC[11]/df2$TC[3])*100 #LLC elnino
(df2$TC[12]/df2$TC[4])*100 #LLC piod


(df2$TC[13]/df2$TC[5])*100 #HLC lanina
(df2$TC[14]/df2$TC[6])*100 #HLC niod
(df2$TC[15]/df2$TC[7])*100 #HLC elnino
(df2$TC[16]/df2$TC[8])*100 #HLC piod

df2$SCS_percentage <- c("","","","","","","","","83%","70%","75%","80%","67%","54%","50%","64%")

#---------------------------------------------------------------------------------------------
rect1 <- data.frame (xmin=-Inf, xmax=4.5, ymin=-Inf, ymax=Inf)
rect2 <- data.frame (xmin=4.5, xmax=Inf, ymin=-Inf, ymax=Inf)
theme_set(theme_light() )
p<-ggplot(data=df2, aes(x=epochs, y=TC, fill=Category)) +
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.5)+
  #scale_fill_brewer(palette="Paired")+
  geom_rect(data=rect1, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="red", alpha=0.1, inherit.aes = FALSE) +
  geom_rect(data=rect2, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="green", alpha=0.1, inherit.aes = FALSE) +
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.5)+
  geom_vline(xintercept = 4.5, lty = 2, color = "royalblue4") +
  geom_text(aes(label=TC), vjust=1.6, color="white",
            position = position_dodge(0.5),size=8,family="Times New Roman")+
  #scale_fill_manual(values = c("yellow", "orange","red")) +
  scale_fill_manual(values = c("#0072B2","red")) +
  scale_x_discrete(name = "Climate mode",labels=c("La Niña","NIOD","El Niño","PIOD","La Niña","NIOD","El Niño","PIOD"))+
  # limit the vertical space to 1 to 50, but keep the data
  geom_segment(aes(x = 0.5, y = 13.5, xend = 4.5, yend =13.5),arrow = arrow(length = unit(0.2, "cm")), color = "blue")+
  geom_segment(aes(x = 4.5, y = 13.5, xend = 0.5, yend =13.5),arrow = arrow(length = unit(0.2, "cm")), color = "blue")+
  annotate("text", x = 2.5, y = 14, label = "LLC", family="Times New Roman",size=8,color="black")+
  geom_segment(aes(x = 4.5, y = 13.5, xend = 8.5, yend =13.5),arrow = arrow(length = unit(0.2, "cm")), color = "blue")+
  geom_segment(aes(x = 8.5, y = 13.5, xend = 4.5, yend =13.5),arrow = arrow(length = unit(0.2, "cm")), color = "blue")+
  annotate("text", x = 6.5, y = 14, label = "HLC", family="Times New Roman",size=8,color="black")+
  coord_cartesian(ylim = c(2, 16.5)) +
  scale_y_continuous(name = "Number of cyclones", breaks = seq(0,50,5), limits = c(0,50))+
  geom_text_repel(aes(label = SCS_percentage),size = 5, show_guide = F,family="Times New Roman",                  
                  point.padding = 0.2,
                  nudge_x = .16,
                  nudge_y = 0.8,
                  segment.linetype = 1,
                  segment.curvature = -1e-10) +
  #annotate("text", x = c(1.18,2.18,3.18,4.18,5.18,6.18,7.18,8.18), y = c(10.5,7.5,3.5,4.5,8.5,7.5,6.5,7.5), label = c("83%","70%","75%","80%","67%","54%","50%","64%"),family="Times New Roman",size=6) + #,3.18,4.18,5.18,6.18,7.18,8.18
  ggtitle("") +
  theme(legend.position = c(0.91, 0.91),
        legend.key = element_rect(colour = "transparent", fill = "white"),
        legend.title=element_text(size=18,family="Times New Roman"),
        legend.text=element_text(size=18,family="Times New Roman"),
        axis.text.x = element_text(family="Times New Roman"
                                   ,size=22
                                   #,face="bold"
                                   ,color="black"),
        axis.text.y = element_text(family="Times New Roman"
                                   ,size=22
                                   #,face="bold"
                                   ,color="black"),
        axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)
                                    ,family="Times New Roman"
                                    ,size=22
                                    #,face="bold"
                                    ,color="black"),
        axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)
                                    ,family="Times New Roman"
                                    ,size=22
                                    #,face="bold"
                                    ,color="black"),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        plot.title = element_text(hjust = 0.5, color="black", 
                                  #       face="bold"
                                  #       family="Comic Sans MS",
                                  #       family="CM Roman",
                                  family="Times New Roman",
                                  #       family="Sans",
                                  #       family="Serif",
                                  size=22, angle=0))

p
#------------------------------------------------------------
ggsave("LLC_HLC_BOB.png", width = 30, height = 20, units = "cm", dpi = 300)
#----------------------------------------------------------------------------------------------------- 

