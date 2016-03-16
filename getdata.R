netpath <- "https://d396qusza40orc.cloudfront.net/predmachlearn"

f <- "pml-training.csv"
download.file(paste(netpath,f,sep = "/"),destfile = f)

training <- read.csv("pml-training.csv", na.strings = c("NA","#DIV/0!",""))

# str(training)
# dim(training)
# head(training)