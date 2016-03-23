
library(ggplot2)

plotit <- function(x){ # x is one of c("pitch", "roll", "yaw")
  
#construct a data.frame for c("belt", "arm", "forearm", "dumbbell")
df=data.frame(X=rep(training$X,4),
              classe = rep(training$classe, 4),
              which=rep(c("belt", "arm", "forearm", "dumbbell"),each=nrow(training)),
              val=c(training[,paste(x,"belt",sep="_")],
                    training[,paste(x,"arm",sep="_")],
                    training[,paste(x,"forearm",sep="_")],
                    training[,paste(x,"dumbbell",sep="_")])
              )

ggplot(aes(x=X, y=val),data=df)+
  facet_grid(which~., scales="y_free")+
  labs(x=paste("Total Acceleration:",whichx),
       y=paste("Total Acceleration:",whichy))+
  geom_point(aes(col=classe))

}