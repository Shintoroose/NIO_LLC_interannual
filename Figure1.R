setwd("./LLC_Part2/EAtlas_IMD/BOB_80_100E")
library(ncdf4)
library(ggplot2) # package for plotting
library(png)

circle <- readPNG("/Users/shintoroose/Documents/worldcoastalShape/circle-512-4.png")
#df2 <- data.frame(Category=rep(c("LLC", "LLC intensified into SCS","LLC intensified into SCS with in 10°N"), each=2),
#                  epochs=rep(c("Epoch-1", "Epoch-2"),3),
 #                 LLC=c(46,26,34,19,12,8))
rect1 <- data.frame (xmin=-Inf, xmax=3.5, ymin=-Inf, ymax=Inf)
rect2 <- data.frame (xmin=3.5, xmax=Inf, ymin=-Inf, ymax=Inf)

df2 <- data.frame(Category=rep(c("CS+SCS", "SCS"), each=2),
                  epochs=rep(c("a", "b"),2),
                 TC=c(33,44,24,24))
df2
head(df2)
#---------------------------------------------------------------------------------------------
rect1 <- data.frame (xmin=-Inf, xmax=1.5, ymin=-Inf, ymax=Inf)
rect2 <- data.frame (xmin=1.5, xmax=Inf, ymin=-Inf, ymax=Inf)
theme_set(theme_light() )
p<-ggplot(data=df2, aes(x=epochs, y=TC, fill=Category)) +
  geom_bar(stat="identity", position=position_dodge(), width = 1.2*0.5)+
  geom_vline(xintercept = 1.5, lty = 2, color = "royalblue4") +
  geom_text(aes(label=TC), vjust=1.6, color="white",
            position = position_dodge(0.5),size=9,family="Times New Roman")+
  #scale_fill_brewer(palette="Paired")+
  #geom_rect(data=rect1, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="green", alpha=0.1, inherit.aes = FALSE) +
  #geom_rect(data=rect2, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax), fill="red", alpha=0.1, inherit.aes = FALSE) +
  #scale_fill_manual(values = c("yellow", "orange","red")) +
  scale_fill_manual(values = c("#0072B2","red")) +
  scale_x_discrete(name = "Latitudinal domain", labels=c("LLC","HLC"))+
  # limit the vertical space to 1 to 50, but keep the data
  coord_cartesian(ylim = c(2, 50)) +
  scale_y_continuous(name = "Number of cyclones", breaks = seq(0,50,5), limits = c(0,50))+
  annotate("text", x = c(1.17,2.17), y = c(26,26), label = c("72.7%","54.5%"),family="Times New Roman",size=7) +
  ggtitle("") +
  theme(legend.position = c(0.85, 0.9),
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
ggsave("LLC_HLC_BOB.png", width = 20, height = 20, units = "cm", dpi = 300)
#----------------------------------------------------------------------------------------------------- 

