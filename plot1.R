
#Source data "household_power_consumption.txt" must be in the R working directory

#Read data 
d <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
d <- subset(d, Date %in% c('1/2/2007', '2/2/2007'))

#Set output to png
png("plot1.png", width = 480, height = 480, units = "px")

#Create plot
hist(d$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Write to file
dev.off()
