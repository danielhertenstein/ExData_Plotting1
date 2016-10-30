# Read in the data and extract only the data from 1/2/2007 and 2/2/2007
data <- read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")
data <- subset(data, data$Date== "1/2/2007" | data$Date == "2/2/2007")

# Make Plot 1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power", col = "red")
dev.off()

# Release the memory that we're using
rm('data')