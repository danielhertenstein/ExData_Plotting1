# Read in the data and extract only the data from 1/2/2007 and 2/2/2007
data <- read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")
data <- subset(data, data$Date== "1/2/2007" | data$Date == "2/2/2007")

# Convert the Date and Time columns to POSIXct's
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Make Plot 3
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, 
     data$Sub_metering_1, 
     type="n", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1))
dev.off()

# Release the memory that we're using
rm('data')