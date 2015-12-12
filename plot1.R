    ## sqldf package needs to be installed and loaded for the code to work

power_consumption <- read.csv.sql("household_power_consumption.txt",
                    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                    sep = ";")

datetime <- as.POSIXct(strptime(paste(power_consumption$Date, power_consumption$Time),
                    format = "%d/%m/%Y %H:%M:%S"))

hist(power_consumption$Global_active_power,xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")

png(file = "plot1.png")
hist(power_consumption$Global_active_power,xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.off()