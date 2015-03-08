# read the Individual household electric power consumption Data Set
powerTable <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings='?')

# format the date to yyyy-mm-dd format
powerTable$Date <- as.Date(powerTable$Date, format = "%d/%m/%Y")

# create subset using data from the dates 2007-02-01 and 2007-02-02
powerSub <- subset(powerTable, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# converting dates
datetime <- paste(as.Date(powerSub$Date), powerSub$Time)
powerSub$Datetime <- as.POSIXct(datetime)

# open png device (width of 480 pixels and a height of 480 pixels) for saving the plots
png(filename='plot4.png',width=480,height=480,units='px')

# make 4 plots
par(mfrow=c(2,2))

# plot on top left (1,1)

plot(powerSub$Datetime, powerSub$Global_active_power, xlab = "", ylab = "Global Active Power",type = "l" )

# plot on top right (1,2)

plot(powerSub$Datetime,powerSub$Voltage,xlab="datetime",ylab="Voltage",type="l")

# plot on bottom left (2,1)

with(powerSub, {
  plot(powerSub$Datetime,powerSub$Sub_metering_1,  
       xlab = "", ylab = "Global Active Power (kilowatts)",type = "l")
  lines(powerSub$Datetime,powerSub$Sub_metering_2, col = 'Red')
  lines(powerSub$Datetime,powerSub$Sub_metering_3, col = 'Blue')
})

# plot on bottom right (2,2)

plot(powerSub$Datetime,powerSub$Global_active_power,xlab="datetime",ylab="Global_reactive_power",type="l")

# Turn off device
dev.off()
 