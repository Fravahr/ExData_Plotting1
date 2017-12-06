hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
HPC <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))
DateTime <- strptime(paste(HPC$Date, HPC$Time), "%d/%m/%Y %H:%M:%S")
HPC <- cbind(DateTime, HPC)

HPC$Global_active_power <- as.character(HPC$Global_active_power)
HPC$Global_active_power <- as.numeric(HPC$Global_active_power)

HPC$Global_reactive_power <- as.character(HPC$Global_reactive_power)
HPC$Global_reactive_power <- as.numeric(HPC$Global_reactive_power)

HPC$Voltage <- as.character(HPC$Voltage)
HPC$Voltage <- as.numeric(HPC$Voltage)

HPC$Sub_metering_1 <- as.character(HPC$Sub_metering_1)
HPC$Sub_metering_1 <- as.numeric(HPC$Sub_metering_1)

HPC$Sub_metering_2 <- as.character(HPC$Sub_metering_2)
HPC$Sub_metering_2 <- as.numeric(HPC$Sub_metering_2)

HPC$Sub_metering_3 <- as.character(HPC$Sub_metering_3)
HPC$Sub_metering_3 <- as.numeric(HPC$Sub_metering_3)

png(filename='plot4.png', width=480, height=480, units='px')
par(mfrow = c(2,2))

plot(HPC$DateTime, HPC$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(HPC$DateTime, HPC$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(HPC$DateTime, HPC$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(HPC$DateTime, HPC$Sub_metering_2, col = "red")
lines(HPC$DateTime, HPC$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

plot(HPC$DateTime, HPC$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()