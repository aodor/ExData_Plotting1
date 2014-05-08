##=============================================================================
##                               Plot1.png
##=============================================================================


## Initialize sqldf library
require("sqldf")

## Localize Data File
myFile <- "D:/Google Drive/_RProjects/powerConsumption/household_power_consumption.txt"

## Create data frame with headers and ";" as delimiter
dataFrame <- read.table(myFile, header=T, sep=";")

## Subsetting only data from 21/2007 and 2/2/2007 with an SQL funtion
finalData <- sqldf("SELECT * from dataFrame WHERE Date = '2/1/2007' OR Date = '2/2/2007'")


##=============================================================================
##                              Plot Creation
##=============================================================================

## Converting column to numeric data
finalData$Global_active_power = as.double(finalData$Global_active_power)

dev.copy(png,file="plot1.png",width=480,height=480)
hist(finalData$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")
dev.off()

