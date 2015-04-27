setwd("C:/Alex/Coursera")
library(data.table)

#Import
power <- fread("C:/Alex/Coursera/household_power_consumption.csv", sep = ";", header = TRUE, nrow = 2075259)
power$Date_New <- as.Date(power$Date, "%d/%m/%Y")
mydata <- subset(power,Date_New >= "2007-02-01" & Date_New <= "2007-02-02")

#Conversions
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Date <- as.Date(mydata$Date)
mydata$datetime <- paste(mydata$Date, mydata$Time)
mydata$DateTime <- as.POSIXct(mydata$datetime)

head(mydata)

#Plot and Export
dev.copy(png, file="plot3.png", height=480, width=480)
with(mydata, {
	plot(mydata$DateTime, mydata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
	lines(mydata$DateTime, mydata$Sub_metering_2, type = "l",col = "red")
	lines(mydata$DateTime, mydata$Sub_metering_3, type = "l", col = "blue")
	legend("topright", col = c("black","red","blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	})

dev.off()

