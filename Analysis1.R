IND_DF <- read.csv("Indicators.csv")

IND_VEC <- IND_DF[,2]

IND_IND_VEC <- IND_VEC!=0 & IND_VEC!=-1

df_Storm2 <- cbind(df_Storm[IND_IND_VEC,],ST_EVTYPE = IND_VEC[IND_IND_VEC])

# write.csv(df_Storm2,"Cleaned_DF.csv")