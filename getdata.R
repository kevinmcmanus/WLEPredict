library(dplyr)
library(caret)

netpath <- "https://d396qusza40orc.cloudfront.net/predmachlearn"

f <- "pml-training.csv"
download.file(paste(netpath,f,sep = "/"),destfile = f)

training <- read.csv(f, na.strings = c("NA","#DIV/0!",""))

#summarize the data within the windows
win.means = aggregate(data=training,
                      cbind(roll_dumbbell, pitch_dumbbell, yaw_dumbbell, total_accel_dumbbell,
                            roll_belt,     pitch_belt,     yaw_belt,     total_accel_belt,
                            roll_arm,      pitch_arm,      yaw_arm,      total_accel_arm,
                            roll_forearm,  pitch_forearm,  yaw_forearm,  total_accel_forearm)~user_name+classe + num_window,
                      FUN=mean)

set.seed(1234)
#save off some of the training data for use in validation
inTrain <- createDataPartition(y=win.means$classe, p=0.8, list=FALSE)
win.train <- win.means[inTrain,]
win.val <- win.means[-inTrain,]
