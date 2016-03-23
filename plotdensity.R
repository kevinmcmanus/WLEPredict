library(ggplot2)

plothist <- function(){
  
  df = data.frame(where = rep(c("Belt","Dumbbell","Forearm","Arm"), each=nrow(win.train)),
                  classe = rep(win.train$classe, 4),
                  val = c(win.train$total_accel_belt, win.train$total_accel_dumbbell,
                          win.train$total_accel_forearm, win.train$total_accel_arm))
  ggplot(aes(val, fill=classe), data=df) +
    facet_grid(.~where, scales="free")+
    geom_density(alpha=0.3) +
    labs(x="Total Acceleration",title="Figure 1: Acceleration Density Plot at Four Sensor Locations")
}