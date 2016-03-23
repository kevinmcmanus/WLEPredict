
locs = c("arm", "belt", "forearm","dumbbell") # sensor locations
meas = c("pitch","roll", "yaw", "total_accel" ) # sensor summary measures

## create list of column names, measures by location
vnames = paste( rep(meas,length(locs)), rep(locs, each=length(meas)), sep="_")

##build up a formula to pass to subsequent train invocations
fmla <- as.formula(paste("classe ~ ", paste(vnames, collapse= " + ")))


modfit=train(fmla, data=win.train, method="rf")

print(modfit)

predictions=predict(modfit, newdata=win.val)
print(confusionMatrix(predictions, win.val$classe))
