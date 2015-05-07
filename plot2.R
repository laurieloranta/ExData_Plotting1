##plot2.R
library(dplyr)

#Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
##Filter correct dates
d <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
##Add DateTime column with correct date&time in POSIXlt format
d <- mutate(d, DateTime = paste(Date,Time))
d$DateTime <- strptime(d$DateTime, format="%d/%m/%Y %H:%M:%S")

#Plot the histogam to screen device
with(d, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=0.7, cex.axis=0.7))

#Copy the histogram as  plot2.png
dev.copy(png, file = "plot2.png")
dev.off()

