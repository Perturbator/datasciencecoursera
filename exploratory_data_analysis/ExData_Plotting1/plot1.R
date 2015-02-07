file <- c("household_power_consumption.txt")
power <- read.csv(file, header=TRUE,sep=";",na.strings='?')
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
hist(power$Global_active_power, col = "red", breaks = 12,
     xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

dev.copy(png,file = "plot1.png", height = 480, width = 480)
dev.off()
