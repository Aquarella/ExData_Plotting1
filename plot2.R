    ## sqldf package needed to be installed and loaded for the code to work


power_consumption <- read.csv.sql("household_power_consumption.txt",
                     sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                     sep = ";")

datetime <- as.POSIXct(strptime(paste(power_consumption$Date, power_consumption$Time),
                        format = "%d/%m/%Y %H:%M:%S"))

power_consumption_dt <- cbind(datetime, power_consumption)

with(power_consumption_dt, plot(datetime, Global_active_power, xlab = " ",
                 ylab = "Global Active Power (kilowatts)", type = "l"))

png(file = "plot2.png")
with(power_consumption_dt, plot(datetime, Global_active_power, xlab = " ",
                      ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()