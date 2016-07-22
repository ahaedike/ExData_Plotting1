
#Source data "household_power_consumption.txt" must be in the R working directory

#Read data 
d <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
d <- subset(d, Date %in% c('1/2/2007', '2/2/2007'))

#Convert raw date and time to POSIXlt 
formatDateTime  <- "%d/%m/%Y %H:%M:%S"
d$DateTime <- paste(d$Date, d$Time)
d$DateTime <- strptime(d$DateTime, format = formatDateTime)

#Set output to png
png("plot2.png", width = 480, height = 480, units = "px")

#Create plot
plot(d$DateTime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Write to file
dev.off()