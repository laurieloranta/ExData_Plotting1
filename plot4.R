##plot4.R
library(dplyr)

#Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
##Filter correct dates
d <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
##Add DateTime column with correct date&time in POSIXlt format
d <- mutate(d, DateTime = paste(Date,Time))
d$DateTime <- strptime(d$DateTime, format="%d/%m/%Y %H:%M:%S")


##Plot multiple plots in a grid
par(mfrow = c(2, 2))
with(d, {
    plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=0.7, cex.axis=0.7)
    
    plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage", cex.lab=0.7, cex.axis=0.7)
    
    plot(DateTime, Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering", cex.lab=0.7, cex.axis=0.7)
    points(DateTime, Sub_metering_2, type="l", col="red")
    points(DateTime, Sub_metering_3, type="l", col="blue")
    legend("topright", bty="n", pch= "-", lwd=2, cex=0.5, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    plot(DateTime, Global_reactive_power, type="l", xlab="datetime", cex.lab=0.7, cex.axis=0.7)
    
    })

#Copy the plot as plot4.png
dev.copy(png, file = "plot4.png")
dev.off()

