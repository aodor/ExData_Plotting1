##=============================================================================
###                               Plot2.png
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

# Create plot as png file
dev.copy(png,file="Plot2.png",width=480,height=480)
plot(finalData$DateTime, finalData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
