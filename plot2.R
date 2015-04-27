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
plot(mydata$DateTime, mydata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()