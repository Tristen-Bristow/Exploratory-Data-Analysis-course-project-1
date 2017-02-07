# Plot 2
# This program loads data, formats it time/date labels, displays desired plots,
# and outputs the plot to png file.

# source data    Dataset: Electric power consumption [20Mb]
#               "Individual household electric power consumption Data Set" 
#                 UC Irvine Machine Learning Repository,
#               COmpressed Archive: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


library(lubridate)


setwd("C:/Users/silly/Desktop/coursera/Coursera data intro R notes/coursera 4/")

d = read.table("household_power_consumption.txt", skip=66637, nrows=(69518-66638), sep=";")

titles <- c("Date", "Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(d) <- titles


tst <- paste(d$Date, d$Time)
dn <- as.POSIXct(tst, format="%d/%m/%Y %H:%M:%S")
week =  weekdays(as.Date(d$Date))



png("plot2.png", width = 480, height = 480)

plot(dn,d$Global_active_power,type="lines",
     ylab="Global Active Power (kilowatts)"
     )
dev.off()