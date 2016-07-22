#Source data "household_power_consumption.txt" must be in the R working directory

#Read data 
d <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
d <- subset(d, Date %in% c('1/2/2007', '2/2/2007'))

#Convert raw date and time to POSIXlt 
formatDateTime  <- "%d/%m/%Y %H:%M:%S"
d$DateTime <- paste(d$Date, d$Time)
d$DateTime <- strptime(d$DateTime, format = formatDateTime)

#Set output to png
png("plot3.png", width = 480, height = 480, units = "px")

#Create plot
color1   <- "black"
color2   <- "red"
color3   <- "blue"
plot(d$DateTime, d$Sub_metering_1, col = color1, type="l", xlab="", ylab="Global Active Power")
lines(d$DateTime, d$Sub_metering_2, col = color2)
lines(d$DateTime, d$Sub_metering_3, col = color3)
legend("topright",col=c(color1,color2,color3), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

#Write to file
dev.off()