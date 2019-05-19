data_epc = read.table("household_power_consumption.txt", sep=";", na.strings = "?")
names(data_epc) <- as.character(unlist(data_epc[1,]))
data_epc <- data_epc[-1,]

data_epc$Time <- strptime(paste(data_epc$Date,data_epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data_epc$Date <- as.Date(data_epc$Date , "%d/%m/%Y")


get.rows <- data_epc$Date >= as.Date("2007-02-01") & data_epc$Date <= as.Date("2007-02-02") 
data_period <- data_epc[get.rows, ]

data_period$Global_active_power <- as.numeric(as.character(data_period$Global_active_power))
data_period$Global_reactive_power <- as.numeric(as.character(data_period$Global_reactive_power))
data_period$Global_intensity <- as.numeric(as.character(data_period$Global_intensity))
data_period$Voltage <- as.numeric(as.character(data_period$Voltage))
data_period$Sub_metering_1 <- as.numeric(as.character(data_period$Sub_metering_1))
data_period$Sub_metering_2 <- as.numeric(as.character(data_period$Sub_metering_2))
data_period$Sub_metering_3 <- as.numeric(as.character(data_period$Sub_metering_3))

png("plot3.png")
plot(data_period$Time, data_period$Sub_metering_1, type="n", main="",  xlab = "", ylab = "Energy sub metering") 
lines(data_period$Time, data_period$Sub_metering_1, type="l")
lines(data_period$Time, data_period$Sub_metering_2, type="l", col="red")
lines(data_period$Time, data_period$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub metering 1", "Sub metering 2","Sub metering 3"),col=c("black","red", "blue"), lty=1)
dev.off()