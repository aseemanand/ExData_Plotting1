
# read the Individual household electric power consumption Data Set
powerTable <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings='?')

# create subset using data from the dates 1/2/2007 and 2/2/2007
powerSub <- subset(powerTable, powerTable$Date == '1/2/2007' | powerTable$Date == '2/2/2007')

# open png device (width of 480 pixels and a height of 480 pixels) for saving the histogram
png(filename='plot1.png',width=480,height=480,units='px')

# plot the histogram to show how household energy usage varies over 2 days period in February, 2007
hist(as.numeric(powerSub$Global_active_power), main = paste("Global Active Power"),xlab = "Global Active Power (kilowatts)",col = "red")

# Turn off device
dev.off()