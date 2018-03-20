setwd("/Users/maulikchaudhary/Desktop/R/Coursera/Reproducible research/Week 4/")
url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(url, destfile = "StormData.csv.bz2", method = "curl")

stormData <- read.csv("StormData.csv.bz2")
few <- tail(stormData)
str(few)        
str(stormData)
levels(stormData$PROPDMGEXP)

populationHealth <- stormData[,c("EVTYPE", "FATALITIES", "INJURIES")]

eventWiseFatalities <- as.data.frame(as.table(with(populationHealth, tapply(FATALITIES, EVTYPE, sum))))
eventWiseFatalities <- eventWiseFatalities[order(eventWiseFatalities$Freq, decreasing = TRUE),]

eventWiseInjuries <- as.data.frame(as.table(with(populationHealth, tapply(INJURIES, EVTYPE, sum))))
eventWiseInjuries <- eventWiseInjuries[order(eventWiseInjuries$Freq, decreasing = TRUE),]


mergedInjFatSumByEvtype <- merge(eventWiseFatalities, eventWiseInjuries, by = "Var1")
names(mergedInjFatSumByEvtype) <- c("event type", "fatalities", "injuries")
mergedInjFatSumByEvtype <- mergedInjFatSumByEvtype[order(mergedInjFatSumByEvtype$fatalities, 
                                                         mergedInjFatSumByEvtype$injuries, decreasing = TRUE),]
rownames(mergedInjFatSumByEvtype) <- NULL


# 2 
few <- tail(stormData)
str(few)
stormData[,c()]