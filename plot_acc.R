
library(ggplot2)

plot_acc <- function(whichx, whichy) {
  
  myx = paste("yaw", whichx, sep="_")
  myy = paste("total_accel", whichy, sep="_")
  
  ggplot(aes(x=win.train[,myx], win.train[,myy]),data=win.train)+
    labs(x=paste("Yaw:",whichx),
         y=paste("Total Acceleration:",whichy))+
    geom_point(aes(col=classe))
  
}