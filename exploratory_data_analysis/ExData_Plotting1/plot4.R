file <- c("household_power_consumption.txt")
power <- read.csv(file, header=TRUE,sep=";",na.strings='?')
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
power$datetime<-as.POSIXct(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")
png(file = "plot4.png", height = 480, width = 480, bg="transparent")
par(mfrow = c(2,2))
plot(power$datetime,power$Global_active_power,type="l", xlab="", ylab="Global Active Power")
plot(power$datetime, power$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(power$datetime,power$Sub_metering_1,type="l", xlab="", ylab="Energy sub meeting")
lines(power$datetime,power$Sub_metering_2, col = "red")
lines(power$datetime,power$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = .75,
       cex = .75,
       bty="n"
)
plot(power$datetime, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()