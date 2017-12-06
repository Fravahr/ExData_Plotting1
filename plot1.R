hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
HPC <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

HPC$Global_active_power <- as.character(HPC$Global_active_power)
HPC$Global_active_power <- as.numeric(HPC$Global_active_power)

png(filename='plot1.png', width=480, height=480, units='px')
par(mfrow = c(1,1))

### Plot 1
hist(HPC$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()