library(ggplot2)

plothist <- function(where){
  n = nrow(win.train)
  
  df = data.frame(which = rep(c("Pitch", "Roll", "Yaw", "Total_Accel"), each=n),
      val=c(win.train[,paste("pitch",where, sep="_")],
            win.train[,paste("roll",where, sep="_")],
            win.train[,paste("yaw",where, sep="_")],
            win.train[,paste("total_accel",where, sep="_")]))

ggplot( aes(val),data=df)+facet_grid(which~.,scales="free_x")+
  geom_histogram()
  
}