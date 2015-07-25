# The "ReadData.R" file reads the raw data frame into "df_Storm"
# Run only when necessary
# source("ReadData.R")

EV_LVS <- levels(df_Storm$EVTYPE)
tidy_aux <- data.frame(lev= EV_LVS, lab = rep(0,length(EV_LVS)))
index <- read.csv("Desasters.csv")