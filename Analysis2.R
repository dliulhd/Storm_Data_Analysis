# This file computes the mean/total fatality, injuries, property damages and crop damages of each type of event
# The goal is to check which event is the most harmful on the cumulative basis 
# and which is the most destructive when regarded individually

##### source "Analysis1.R" first!!  ######
# source("Analysis1.R")
##### source "Analysis1.R" first!!  ######


df_Storm2 <- cbind(df_Storm[IND_IND_VEC,],ST_EVTYPE = IND_VEC[IND_IND_VEC])

EV_Count <- Ave_Fatal <- Tot_Fatal <- Ave_Inj <- Tot_Inj <- Ave_PropDam <- Tot_PropDam <- Ave_CropDam <- Tot_CropDam <- vector("numeric",48)


for(i in 1:48) {
  temp_indicator <- df_Storm2$ST_EVTYPE==i
  temp_fat <- df_Storm2$FATALITIES[temp_indicator]
  temp_inj <- df_Storm2$INJURIES[temp_indicator]
  temp_PropDam <- df_Storm2$PROPDMG[temp_indicator]
  temp_CropDam <- df_Storm2$CROPDMG[temp_indicator]
  Ave_Fatal[i] <- mean(temp_fat)
  Tot_Fatal[i] <- sum(temp_fat)
  Ave_Inj[i] <- mean(temp_inj)
  Tot_Inj[i] <- sum(temp_inj)
  Ave_PropDam[i] <- mean(temp_PropDam)
  Tot_PropDam[i] <- sum(temp_PropDam)
  Ave_CropDam[i] <- mean(temp_CropDam)
  Tot_CropDam[i] <- sum(temp_CropDam)
  EV_Count[i] <- length(temp_fat)
}

Final_DF <- data.frame(EVInd = 1:48, EVTYPE = index[,3], Ave_Fatal = Ave_Fatal, Tot_Fatal = Tot_Fatal, 
                       Ave_Inj = Ave_Inj, Tot_Inj = Tot_Inj, 
                       Ave_PropDam = Ave_PropDam, Tot_PropDam = Tot_PropDam, 
                       Ave_CropDam = Ave_CropDam, Tot_CropDam = Tot_CropDam, Event_Count = EV_Count)
