hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
HPC <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))
DateTime <- strptime(paste(HPC$Date, HPC$Time), "%d/%m/%Y %H:%M:%S")
HPC <- cbind(DateTime, HPC)
HPC$Global_active_power <- as.character(HPC$Global_active_power)
HPC$Global_active_power <- as.numeric(HPC$Global_active_power)

png(filename='plot2.png', width=480, height=480, units='px')
par(mfrow = c(1,1))

### Plot 2
plot(HPC$DateTime, HPC$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()