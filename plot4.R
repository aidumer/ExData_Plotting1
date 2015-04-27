setwd("C:/Alex/Coursera")
library(data.table)

power <- fread("C:/Alex/Coursera/household_power_consumption.csv", sep = ";", header = TRUE, nrow = 2075259)
power$Date_New <- as.Date(power$Date, "%d/%m/%Y")
mydata <- subset(power,Date_New >= "2007-02-01" & Date_New <= "2007-02-02")

#Conversions
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Date <- as.Date(mydata$Date)
mydata$datetime <- paste(mydata$Date, mydata$Time)
mydata$DateTime <- as.POSIXct(mydata$datetime)

head(mydata)

dev.copy(png, file="plot4.png", height=480, width=480)
par(mfrow = c(2,2))
with(mydata, {
	plot(mydata$DateTime, mydata$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
	plot(mydata$DateTime, mydata$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
	plot(mydata$DateTime, mydata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
	lines(mydata$DateTime, mydata$Sub_metering_2, type = "l",col = "red")
	lines(mydata$DateTime, mydata$Sub_metering_3, type = "l", col = "blue")
	legend("topright", col = c("black","red","blue"), lty = 1, lwd = 1, bty = "n", cex = .65, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(mydata$DateTime, mydata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()

