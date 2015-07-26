# The "ReadData.R" file reads the raw data frame into "df_Storm"
# Run only when necessary
# source("ReadData.R")

EV_LVS <- levels(df_Storm$EVTYPE)
tidy_aux <- data.frame(lev= EV_LVS, lab = rep(0,length(EV_LVS)))
index <- read.csv("Desasters.csv")

tidy_aux$lab[grep("summary",EV_LVS,ignore.case = TRUE)] <- -1

tidy_aux$lab[grep("low tide",EV_LVS,ignore.case = TRUE)] <- index[1,1] # Astronomical Low Tide 
tidy_aux$lab[c(18,19)] <- index[2,1] # Avalanche, excluding HEAVY SNOW/BLIZZARD/AVALANCHE

tidy_aux$lab[grep("FREEZING RAIN",EV_LVS,ignore.case = TRUE)] <- index[48,1] # Freezing rain as WINTER WEATHER

tidy_aux$lab[grep("blizzar",EV_LVS,ignore.case = TRUE)] <- index[3,1] # BLIZZARD

tidy_aux$lab[grep("coastal",EV_LVS,ignore.case = TRUE)] <- index[4,1] # COASTAL FLOOD
tidy_aux$lab[grep("erosi",EV_LVS,ignore.case = TRUE)] <- index[4,1] # COASTAL FLOOD
tidy_aux$lab[grep("blow-out",EV_LVS,ignore.case = TRUE)] <- index[4,1] # COASTAL FLOOD

tidy_aux$lab[grep("CSTL",EV_LVS,ignore.case = TRUE)] <- index[4,1]
tidy_aux$lab[grep("BEACH FLOOD",EV_LVS,ignore.case = TRUE)] <- index[4,1]

tidy_aux$lab[grep("wind chil",EV_LVS,ignore.case = TRUE)] <- index[5,1] 
# COLD/WIND CHILL (including also "EXTREME COLD WIND CHILL")
tidy_aux$lab[grep("low te",EV_LVS,ignore.case = TRUE)] <- index[5,1] 
tidy_aux$lab[c(80,146,147,414:416,880,881:883)] <- index[5,1] 
# COLD/WIND CHILL (including also "EXTREME COLD WIND CHILL")
tidy_aux$lab[c(65,66,72:77,129:140,148,
               535,536,548:550,569,603,896)] <- index[5,1] 

# No "DEBRIS FLOW" 6
tidy_aux$lab[grep("fog",EV_LVS,ignore.case = TRUE)] <- index[7,1] # DENSE FROG (temporarily containing freezing fog)
tidy_aux$lab[grep("smoke",EV_LVS,ignore.case = TRUE)] <- index[8,1] # DENSE SMOKE

tidy_aux$lab[grep("droug",EV_LVS,ignore.case = TRUE)] <- index[9,1] # DROUGHT, COVERING DROUGHT OF HEAT AND SNOW
tidy_aux$lab[grep("dry micro",EV_LVS,ignore.case = TRUE)] <- index[9,1] # DROUGHT, COVERING DROUGHT OF HEAT AND SNOW
tidy_aux$lab[c(11,98:100,109:112,137,397,401,495,497,554,555,884,888,922)] <- index[9,1] 
# DROUGHT, COVERING DROUGHT OF HEAT AND SNOW

tidy_aux$lab[c(25)] <- index[9,1] # BELOW NORMAL PRECIPITATION as DROUGHT

tidy_aux$lab[grep("dust de",EV_LVS,ignore.case = TRUE)] <- index[10,1] # DUST DEVIL
tidy_aux$lab[447] <- index[10,1] # DUST DEVIL

tidy_aux$lab[grep("dustst",EV_LVS,ignore.case = TRUE)] <- index[11,1] # DUST STORM
tidy_aux$lab[grep("dust st",EV_LVS,ignore.case = TRUE)] <- index[11,1] # DUST STORM
tidy_aux$lab[grep("blowing dust",EV_LVS,ignore.case = TRUE)] <- index[11,1] # DUST STORM
tidy_aux$lab[grep("SAHARAN",EV_LVS,ignore.case = TRUE)] <- index[11,1] # DUST STORM

tidy_aux$lab[c(130,142,282,580)] <- index[12,1] # EXCESSIVE HEAT, covering EXTREME HEAT and HEAT BURST, yielding to DROUGHT
tidy_aux$lab[c(14,26,27,45,46,47,78,79,86,87,120,
               141,143,144,145,191:196,273,482,963)] <- index[13,1] # EXTREME COLD/WIND CHILL

tidy_aux$lab[grep("FLASH FLOO",EV_LVS,ignore.case = TRUE)] <- index[14,1] # FLASH FLOOD
tidy_aux$lab[grep("FLOOD FL",EV_LVS,ignore.case = TRUE)] <- index[14,1] # FLASH FLOOD
tidy_aux$lab[grep("SNOWMELT FLOOD",EV_LVS,ignore.case = TRUE)] <- index[14,1] 
tidy_aux$lab[grep("STREET FLOOD",EV_LVS,ignore.case = TRUE)] <- index[14,1] 

tidy_aux$lab[grep("MINOR FLOOD",EV_LVS,ignore.case = TRUE)] <- index[15,1] # FLOOD
tidy_aux$lab[grep("MAJOR FLOOD",EV_LVS,ignore.case = TRUE)] <- index[15,1] # FLOOD
tidy_aux$lab[grep("LOCAL FLOOD",EV_LVS,ignore.case = TRUE)] <- index[15,1] # FLOOD
tidy_aux$lab[grep("RIVER FLOOD",EV_LVS,ignore.case = TRUE)] <- index[15,1] # FLOOD
tidy_aux$lab[grep("RURAL FLOOD",EV_LVS,ignore.case = TRUE)] <- index[15,1] # FLOOD
tidy_aux$lab[grep("RURAL FLOOD",EV_LVS,ignore.case = TRUE)] <- index[15,1] # FLOOD
tidy_aux$lab[grep("BREAKUP FLOODING",EV_LVS,ignore.case = TRUE)] <- index[15,1] # FLOOD
tidy_aux$lab[grep("TIDAL FLOOD",EV_LVS,ignore.case = TRUE)] <- index[15,1] # FLOOD
tidy_aux$lab[c(169,170,174,182,184,185,186,187,393,422,423,439,
               441:444,513,514,516:521,547,593)] <- index[15,1] # FLOOD

tidy_aux$lab[c(173,175,179,180,396,901,902,911,913,915,916,917)] <- index[14,1] 
#URBAN SMALL STREAM FLOOD considered as FLASH FLOOD

tidy_aux$lab[grep("FROST",EV_LVS,ignore.case = TRUE)] <- index[17,1] # FROST/FREEZE

tidy_aux$lab[c(67,68,214,215,216,217,219,220,448,595,931,932)] <- index[18,1] # FUNNEL CLOUD

tidy_aux$lab[grep("hail",EV_LVS,ignore.case = TRUE)] <- index[19,1] 
# HAIL, temporarily covering THUNDERSTORM and MARINE HAIL

tidy_aux$lab[c(275,277,278,280,413,556,557,558,885)] <- index[20,1] # HEAT, covering HEAT WAVE
tidy_aux$lab[grep("warm",EV_LVS,ignore.case = TRUE)] <- index[20,1]
tidy_aux$lab[grep("HIGH TEM",EV_LVS,ignore.case = TRUE)] <- index[20,1]

tidy_aux$lab[grep("high surf",EV_LVS,ignore.case = TRUE)] <- index[23,1] # HIGH SURF
tidy_aux$lab[grep("high wa",EV_LVS,ignore.case = TRUE)] <- index[23,1] # HIGH SURF
tidy_aux$lab[grep("swells",EV_LVS,ignore.case = TRUE)] <- index[23,1] # HIGH SURF
tidy_aux$lab[grep("surge",EV_LVS,ignore.case = TRUE)] <- index[23,1] # HIGH SURF
tidy_aux$lab[c(16,274,307,338:340,348,355,594,596,597)] <- index[23,1] # ROUGH SEA and HEAVY SURF as HIGH SURF

tidy_aux$lab[grep("high wind",EV_LVS,ignore.case = TRUE)] <- index[24,1] # HIGH WIND
tidy_aux$lab[c(8,107,108,181,225:228,233,236,237,241:243,347,494,526,
               640,669,952,953,959:962,965:968,970,985)]<- index[24,1] # GUSTY WIND, WIND DAMAGE, WHIRLWIND

tidy_aux$lab[grep("heavy rain",EV_LVS,ignore.case = TRUE)] <- index[21,1] # HEAVY RAIN covering HIGH WIND and HIHG SURF
tidy_aux$lab[grep("URBAN FLOOD",EV_LVS,ignore.case = TRUE)] <- index[21,1] 
# URBAN FLOOD, considered as HEAVY RAIN, temporarily covering THUNDERSTORM
tidy_aux$lab[grep("STREAM FLOOD",EV_LVS,ignore.case = TRUE)] <- index[21,1] # HEAVY RAIN
tidy_aux$lab[grep("STREAM  FLOOD",EV_LVS,ignore.case = TRUE)] <- index[21,1] # HEAVY RAIN
tidy_aux$lab[grep("SML STREAM FLD",EV_LVS,ignore.case = TRUE)] <- index[21,1] # HEAVY RAIN
tidy_aux$lab[grep("urban small",EV_LVS,ignore.case = TRUE)] <- index[21,1] # HEAVY RAIN
tidy_aux$lab[grep("urban/small",EV_LVS,ignore.case = TRUE)] <- index[21,1] # HEAVY RAIN
tidy_aux$lab[grep("urban and small",EV_LVS,ignore.case = TRUE)] <- index[21,1] # HEAVY RAIN


tidy_aux$lab[c(132:134,225,239,240,285:287,308,309
               ,412,539:544,546,567,581,845,846)] <- index[21,1]

tidy_aux$lab[grep("sleet",EV_LVS,ignore.case = TRUE)] <- index[36,1] # SLEET
tidy_aux$lab[c(207,284,461,501:503,659)] <- index[36,1] # MIXED PRECIPITATION as SLEET

tidy_aux$lab[grep("heavy snow",EV_LVS,ignore.case = TRUE)] <- index[22,1] 
# HEAVY SNOW covering HIGH WIND temporarily covering SLEET
tidy_aux$lab[grep("snow squ",EV_LVS,ignore.case = TRUE)] <- index[22,1] 
tidy_aux$lab[c(13,42:44,135,150,283,344,418,430,431,537,628:633
               ,635,636,643,650:653,657,664,665,667,751,752)] <- index[22,1] 

tidy_aux$lab[grep("hurric",EV_LVS,ignore.case = TRUE)] <- index[25,1] # HURRICANE/TYPHOON
tidy_aux$lab[c(223,226,879)] <- index[25,1] # HURRICANE/TYPHOON
tidy_aux$lab[grep("ice st",EV_LVS,ignore.case = TRUE)] <- index[26,1] #ICE STORM covering FLASH FLOOD

tidy_aux$lab[c(439,441)] <- index[27,1] #LAKESHORE FLOOD

tidy_aux$lab[grep("effect snow",EV_LVS,ignore.case = TRUE)] <- index[28,1] #LAKE-EFFECT SNOW

tidy_aux$lab[c(4,463:465,468,469,470,471,474)] <- index[29,1] #LIGHTNING

tidy_aux$lab[grep("marine hail",EV_LVS,ignore.case = TRUE)] <- index[30,1] # MARINE HAIL

tidy_aux$lab[grep("marine high",EV_LVS,ignore.case = TRUE)] <- index[31,1] # MARINE HIGH WIND
tidy_aux$lab[grep("marine strong",EV_LVS,ignore.case = TRUE)] <- index[32,1] # MARINE STRONG WIND

tidy_aux$lab[grep("tstm",EV_LVS,ignore.case = TRUE)] <- index[39,1] 
tidy_aux$lab[grep("thunderst",EV_LVS,ignore.case = TRUE)] <- index[39,1] 
tidy_aux$lab[grep("m wind",EV_LVS,ignore.case = TRUE)] <- index[39,1] 
# THUNDER STORM, temporarily covering MARINE THUNDERSTORM WIND
tidy_aux$lab[grep("microburst",EV_LVS,ignore.case = TRUE)] <- index[39,1]
tidy_aux$lab[grep("micoburst",EV_LVS,ignore.case = TRUE)] <- index[39,1]
tidy_aux$lab[grep("downburst",EV_LVS,ignore.case = TRUE)] <- index[39,1]

tidy_aux$lab[c(486,489,490)] <- index[33,1] # MARINE THUNDERSTORM WIND

tidy_aux$lab[grep("rip cur",EV_LVS,ignore.case = TRUE)] <- index[34,1]  # RIP CURRENT

tidy_aux$lab[grep("seich",EV_LVS,ignore.case = TRUE)] <- index[35,1]  # SEICH

tidy_aux$lab[c(432,675:680)] <- index[38,1]  # STRONG WIND

tidy_aux$lab[834:839] <- index[40,1]  # TORNADO
tidy_aux$lab[c(69,841,843,844)] <- index[40,1]  # TORNADO


tidy_aux$lab[grep("tropical dep",EV_LVS,ignore.case = TRUE)] <- index[41,1]  # TROPICAL DEPRESSION
tidy_aux$lab[grep("tropical st",EV_LVS,ignore.case = TRUE)] <- index[42,1]  # TROPICAL STORM

tidy_aux$lab[877] <- index[43,1]  # TSUNAMI

tidy_aux$lab[grep("volc",EV_LVS,ignore.case = TRUE)] <- index[44,1]

tidy_aux$lab[grep("water sp",EV_LVS,ignore.case = TRUE)] <- index[45,1]  # WATERSPOUT
tidy_aux$lab[936:945] <- index[45,1]  # WATERSPOUT
tidy_aux$lab[c(7,840,849)] <- index[45,1]  # WATERSPOUT

tidy_aux$lab[grep("wild",EV_LVS,ignore.case = TRUE)] <- index[46,1]  # WILD FIRE
tidy_aux$lab[grep("brush fi",EV_LVS,ignore.case = TRUE)] <- index[46,1] # brush fire counted as WILD FIRE
tidy_aux$lab[c(190,229,583)] <- index[46,1] # grass fire and forest fires counted as WILD FIRE

tidy_aux$lab[c(972,976)] <- index[47,1] # winter storm

tidy_aux$lab[grep("winter w",EV_LVS,ignore.case = TRUE)] <- index[48,1] # WINTER WEATHER
tidy_aux$lab[grep("wintry mix",EV_LVS,ignore.case = TRUE)] <- index[48,1] # WINTER WEATHER
tidy_aux$lab[grep("wintery mix",EV_LVS,ignore.case = TRUE)] <- index[48,1] # WINTER WEATHER
tidy_aux$lab[grep("winter mix",EV_LVS,ignore.case = TRUE)] <- index[48,1] # WINTER WEATHER
tidy_aux$lab[c(579)] <- index[48,1] # WINTER WEATHER


