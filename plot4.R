## Construct a plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

## read the data from the dates 2007-02-01 and 2007-02-02
EletricData <- read.table("household_power_consumption.txt", sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings = "?", skip = 66637, nrows = 2880)
## paste the column Date with the Time date
EletricData <- mutate(EletricData, Date_time = paste(Date, Time))
## convert the Date_time variable to  POSIXct
EletricData$Date_time <- as.POSIXct(EletricData$Date_time, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")


par(mfrow = c(2,2), pin = c(3,3))
with(EletricData, {
    plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(Date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Date_time, Sub_metering_2, col ="red")
    lines(Date_time, Sub_metering_3, col= "blue")
    legend("topright", y=1.5, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Date_time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

## copy my plot to a png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()