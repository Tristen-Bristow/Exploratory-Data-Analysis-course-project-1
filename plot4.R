#Plot 4

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

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

##

plot(dn,d$Global_active_power,type="lines",
     ylab="Global Active Power")
plot(dn,d$Voltage,type="lines",
     ylab="Voltage")  
plot(dn,d$Global_reactive_power,type="lines",
     ylab="Global Reactive Power") 

plot(dn,d$Sub_metering_1,col="black",lwd=1,type="lines", ylim=c(1,40),
     ylab="Energy Sub Metering")
par(new=TRUE)
plot(dn,d$Sub_metering_2,col="red",lwd=1,type="lines", ylim=c(1,40),
     ylab="Energy Sub Metering")
par(new=TRUE)
plot(dn,d$Sub_metering_3,col="blue",lwd=1,type="lines", ylim=c(1,40),
     ylab="Energy Sub Metering")
par(new=TRUE)
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red","blue"), lwd = 1, cex = 0.75)
##

dev.off()
