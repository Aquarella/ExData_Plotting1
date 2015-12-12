    ## sqldf package needs to be installed and loaded for the code to work


power_consumption <- read.csv.sql("household_power_consumption.txt",
                      sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                      sep = ";")

datetime <- as.POSIXct(strptime(paste(power_consumption$Date, power_consumption$Time),
                                format = "%d/%m/%Y %H:%M:%S"))

power_consumption_dt <- cbind(datetime, power_consumption)

with(power_consumption_dt, plot(datetime, Sub_metering_1, xlab = " ",
                 ylab = "Energy sub metering", type = "l"))
lines(power_consumption_dt$datetime, power_consumption_dt$Sub_metering_2, col = "red")
lines(power_consumption_dt$datetime, power_consumption_dt$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png(file = "plot3.png")
with(power_consumption_dt, plot(datetime, Sub_metering_1, xlab = " ",
                                ylab = "Energy sub metering", type = "l"))
lines(power_consumption_dt$datetime, power_consumption_dt$Sub_metering_2, col = "red")
lines(power_consumption_dt$datetime, power_consumption_dt$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()