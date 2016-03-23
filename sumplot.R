library(ggplot2)
library(dplyr)

sum.plot <- function(who, where){
  
df <- filter(win.means, user_name == who)
n <- nrow(df)
c <- paste(c("roll","pitch","yaw"),where,sep="_")
df2 <- data.frame(val=c(df[,c[1]], df[,c[2]], df[,c[3]]),
                  which = rep(c("Roll", "Pitch", "Yaw"), each=n),
                  classe = rep(df$classe,3))

ggplot(data=df2, aes(y=val,x=classe, fill=classe))+
  facet_grid(which~., scales="free_y")+
  labs(title=paste(where, "Pitch, Roll & Yaw for",who))+
  geom_boxplot()
  
}