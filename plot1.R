# Plot 1
# # This program loads data, formats labels, displays desired plots,
# and outputs the plot to png file.

# source data    Dataset: Electric power consumption [20Mb]
#               "Individual household electric power consumption Data Set" 
#                 UC Irvine Machine Learning Repository,
#               COmpressed Archive: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

d = read.table("household_power_consumption.txt", skip=66637, nrows=(69518-66638), sep=";")

titles <- c("Date", "Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(d) <- titles

##
png("plot1.png", width = 480, height = 480)

hist(d$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power"
     )
dev.off()
##