# Reading the data. Data file in a working directory

allhpc <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings="?", dec = ".")
Date <- as.Date(strptime(allhpc$Date, format="%d/%m/%Y"))

# Making a subset for February 1, 2007 and February 2, 2007 data

Feb <- allhpc[(Date=="2007-02-01" | Date=="2007-02-02" ), ]

# histogram of global active power

png("plot1.png", width = 480, height = 480, units = "px")
hist(Feb$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
