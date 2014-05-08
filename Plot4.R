##=============================================================================
##                               Plot3.png
##=============================================================================


# Determine column class
cols = c("character", "character", rep("numeric", times = 7))

# Read data
data <- read.table("household_power_consumption.txt",
                   colClasses = cols, sep = ";", header = T, na.strings = "?")

# Create DateTime variable
data$DateTime <- strptime(paste(data$Date, data$Time,
                                sep = " "), "%d/%m/%Y %H:%M:%S")

# Create subset for February 1-2, 2007
startData <- strptime("2007-02-01", "%Y-%m-%d")
endData <- strptime("2007-02-03", "%Y-%m-%d")
finalData <- data[data$DateTime >= startData &
                          data$DateTime < endData,]


## ============================================================================
##                Create plot as png file
##=============================================================================

## Start multiple plot
png(file="Plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot 1
plot(finalData$DateTime, finalData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)", 
     cex.axis=0.5, cex.lab=0.5)
#plot 2
plot(finalData$DateTime, finalData$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage",
      cex.axis=0.5, cex.lab=0.5)
#plot3
plot(finalData$DateTime, finalData$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub metering", cex.axis=0.5, cex.lab=0.5)
     
lines(finalData$DateTime, finalData$Sub_metering_1, col = "black")
lines(finalData$DateTime, finalData$Sub_metering_2, col = "red")
lines(finalData$DateTime, finalData$Sub_metering_3, col = "blue")

legend("topright", cex=0.5, bty="o", col= c("black", "red", "blue"), lty="solid",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot4
plot(finalData$DateTime, finalData$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global reactive power",
     cex.axis=0.5, cex.lab=0.5)
dev.off()
