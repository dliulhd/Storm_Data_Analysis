#url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
#download.file(url,"storm_data.csv.bz2",method = "curl")

df_Storm <- read.csv("storm_data.csv.bz2")
EV_LVS <- levels(df_Storm$EVTYPE)
tidy_aux <- data.frame(lev= EV_LVS, lab = rep(0,length(EV_LVS)))
index <- data.frame(ind=1:48, names =vector("character",48))