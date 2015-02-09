## Construct a plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

## read the data from the dates 2007-02-01 and 2007-02-02
EletricData <- read.table("household_power_consumption.txt", sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings = "?", skip = 66637, nrows = 2880)

## create the plot
hist(EletricData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## copy my plot to a png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()