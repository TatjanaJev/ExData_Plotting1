# Reading the data. Data file in a working directory

allhpc <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings="?", dec = ".")
Date <- as.Date(strptime(allhpc$Date, format="%d/%m/%Y"))

# Making a subset for February 1, 2007 and February 2, 2007 data

Feb <- allhpc[(Date=="2007-02-01" | Date=="2007-02-02" ), ]

#Format Date and Time

x <- paste(Feb$Date, Feb$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Plot data

png("plot2.png", width = 480, height = 480, units = "px")
plot(x, Feb$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

#Please note that I use LT locale on my computer, therefore weekdays on a X axis are kt, pn, ðt, what corresponds to English Thu, Fri, Sat
