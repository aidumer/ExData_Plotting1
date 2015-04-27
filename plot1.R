setwd("C:/Alex/Coursera")
library(data.table)

#Importing
power <- fread("C:/Alex/Coursera/household_power_consumption.csv", sep = ";", header = TRUE, nrow = 2075259)
power$Date_New <- as.Date(power$Date, "%d/%m/%Y")

#Subsetting
mydata <- subset(power,Date_New >= "2007-02-01" & Date_New <= "2007-02-02")
mydata$Date_New <- as.Date(mydata$Date, "%d/%m/%Y")
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)

#Histogram and Export
hist(mydata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
png(filename = "plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()