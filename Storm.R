# The "ReadData.R" file reads the raw data frame into "df_Storm"
# Run only when necessary
# source("ReadData.R")

EV_LVS <- levels(df_Storm$EVTYPE)
tidy_aux <- data.frame(lev= EV_LVS, lab = rep(0,length(EV_LVS)))
index <- read.csv("Desasters.csv")

tidy_aux$lab[grep("low tide",EV_LVS,ignore.case = TRUE)] <- index[1,1] # Astronomical Low Tide
tidy_aux$lab[c(18,19)] <- index[2,1] # Avalanche, excluding HEAVY SNOW/BLIZZARD/AVALANCHE
tidy_aux$lab[grep("blizzar",EV_LVS,ignore.case = TRUE)] <- index[3,1] # BLIZZARD
tidy_aux$lab[grep("coastal",EV_LVS,ignore.case = TRUE)] <- index[4,1] # COASTAL FLOOD
tidy_aux$lab[grep("wind chil",EV_LVS,ignore.case = TRUE)] <- index[5,1] 
# COLD/WIND CHILL (temporarily including also "EXTREME COLD WIND CHILL")
# No "DEBRIS FLOW"
tidy_fog$lev[grep("fog",EV_LVS,ignore.case = TRUE)] <- index[7,1] # DENSE FROG (temporarily containing freezing fog)

