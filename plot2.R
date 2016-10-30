# Read in the data and extract only the data from 1/2/2007 and 2/2/2007
data <- read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")
data <- subset(data, data$Date== "1/2/2007" | data$Date == "2/2/2007")

# Convert the Date and Time columns to POSIXct's
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Make Plot 2
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, 
     data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

# Release the memory that we're using
rm('data')