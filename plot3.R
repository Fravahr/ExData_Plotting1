hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
HPC <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))
DateTime <- strptime(paste(HPC$Date, HPC$Time), "%d/%m/%Y %H:%M:%S")
HPC <- cbind(DateTime, HPC)

HPC$Sub_metering_1 <- as.character(HPC$Sub_metering_1)
HPC$Sub_metering_1 <- as.numeric(HPC$Sub_metering_1)

HPC$Sub_metering_2 <- as.character(HPC$Sub_metering_2)
HPC$Sub_metering_2 <- as.numeric(HPC$Sub_metering_2)

HPC$Sub_metering_3 <- as.character(HPC$Sub_metering_3)
HPC$Sub_metering_3 <- as.numeric(HPC$Sub_metering_3)

png(filename='plot3.png', width=480, height=480, units='px')
par(mfrow = c(1,1))

### Plot 3
plot(HPC$DateTime, HPC$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(HPC$DateTime, HPC$Sub_metering_2, col = "red")
lines(HPC$DateTime, HPC$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()