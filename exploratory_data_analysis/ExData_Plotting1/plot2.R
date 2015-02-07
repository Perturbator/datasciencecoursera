file <- c("household_power_consumption.txt")
power <- read.csv(file, header=TRUE,sep=";",na.strings='?')
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
power$datetime<-as.POSIXct(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")
plot(power$datetime,power$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file = "plot2.png", height = 480, width = 480)
dev.off()
