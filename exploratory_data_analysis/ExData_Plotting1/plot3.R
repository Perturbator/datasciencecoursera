file <- c("household_power_consumption.txt")
power <- read.csv(file, header=TRUE,sep=";",na.strings='?')
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
power$datetime<-as.POSIXct(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")
plot(power$datetime,power$Sub_metering_1,type="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(power$datetime,power$Sub_metering_2, col = "red")
lines(power$datetime,power$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .75
)

dev.copy(png,file = "plot3.png", height = 480, width = 480, bg = "white")
dev.off()
