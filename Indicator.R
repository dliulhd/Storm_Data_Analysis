IND_VEC <- vector("numeric",dim(df_Storm)[1])

for(i in 1:length(IND_VEC)){
  indicator <- which(tidy_aux$lev == df_Storm$EVTYPE[i])
  IND_VEC[i] <- tidy_aux$lab[indicator]
}

write.csv(IND_VEC,"Indicators.csv")