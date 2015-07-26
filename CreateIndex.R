
disasters <- c("Astronomical Low Tide","Avalanche","Blizzard","Costal Flood","Cold/Wind Chill","Debris Flow",
               "Dense Fog","Dense Smoke","Drought","Dust Devil","Dust Storm","Excessive Heat","Extreme Cold/Wind Chill",
               "Flash Flood","Flood","Freezing Fog","Frost/Freeze", "Funnel Cloud","Hail","Heat","Heavy Rain","Heavy Snow",
               "High Surf","High Wind","Hurricane/Typhoon","Ice Storm","Lakeshore Flood","Lake-Effect Snow",
               "Lightning","Marine Hail","Marine High Wind","Marine Strong Wind","Marine Thunderstorm Wind",
               "Rip Current","Seiche","Sleet","Storm Tide","Strong Wind","Thunderstorm Wind","Tornado",
               "Tropical Depression","Tropical Storm","Tsunami","Volcanic Ash","Waterspout","Wildfire",
               "Winter Storm","Winter Weather")
designators <- c("Z","Z","Z","Z","Z","C","Z","Z","Z","C","Z","Z","Z","C","C","Z","C","Z","C","Z","C","Z","Z","Z",
           "Z","Z","Z","Z","C","M","M","M","M","Z","Z","Z","Z","Z","C","C","Z","Z","Z","Z","M","Z","Z","Z")


index <- data.frame(ind=1:48, names = disasters, designators = designators)

write.csv(index,"Desasters.csv")