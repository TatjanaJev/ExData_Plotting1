# Reading the data. Data file in a working directory

allhpc <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings="?", dec = ".")
Date <- as.Date(strptime(allhpc$Date, format="%d/%m/%Y"))

# Making a subset for February 1, 2007 and February 2, 2007 data

Feb <- allhpc[(Date=="2007-02-01" | Date=="2007-02-02" ), ]

#Format Date and Time

x <- paste(Feb$Date, Feb$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Plot data

png("plot4.png", width = 480, height = 480, units = "px")

## Matrix of plots 2 by 2
par(mfrow=c(2,2))

plot(x, Feb$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(x, Feb$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
plot(x, Feb$Sub_metering_1, t="l", ylab="Energy sub metering", xlab="")
lines(x,Feb$Sub_metering_2, col="red")
lines(x,Feb$Sub_metering_3, col="blue")
legend ( "topright", legend = c ( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c ( "black", "red", "blue" ), box.lty = 0, inset=.02)
plot(x, Feb$Global_reactive_power, type="l", xlab = "datetime",ylab="Global_reactive_power")
dev.off()

#Please note that I use LT locale on my computer, therefore week days on a X axis are kt, pn, ðt, what corresponds to English Thu, Fri, Sat
