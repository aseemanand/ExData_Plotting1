# read the Individual household electric power consumption Data Set
powerTable <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings='?')

# format the date to yyyy-mm-dd format
powerTable$Date <- as.Date(powerTable$Date, format = "%d/%m/%Y")

# create subset using data from the dates 2007-02-01 and 2007-02-02
powerSub <- subset(powerTable, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# converting dates
datetime <- paste(as.Date(powerSub$Date), powerSub$Time)
powerSub$Datetime <- as.POSIXct(datetime)

# open png device (width of 480 pixels and a height of 480 pixels) for saving the plot
png(filename='plot3.png',width=480,height=480,units='px')

## generating Plot 3
with(powerSub, {
  plot(powerSub$Datetime,powerSub$Sub_metering_1,  
       xlab = "", ylab = "Global Active Power (kilowatts)",type = "l")
  lines(powerSub$Datetime,powerSub$Sub_metering_2, col = "Red")
  lines(powerSub$Datetime,powerSub$Sub_metering_3, col = "Blue")
})

legend("topright", col = c("black", "red", "blue"),lty = 1,lwd = 2,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Turn off device
dev.off()
