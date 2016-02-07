# Reading until line 69518 : the 3rd of Feb
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep=";",
                   na.strings = "?",
                   nrows = 69518)

# Creating a date-time column
dateTime <- paste(as.character(data$Date), as.character(data$Time))
data <- cbind(dateTime, data)
data$dateTime <- strptime(data$dateTime, format="%d/%m/%Y %H:%M:%S")

# Filtering 2 days
daysData <- subset(data, (data$dateTime > strptime("2007-01-31 23:59:59", "%Y-%m-%d %H:%M:%S")) & 
                         (data$dateTime < strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S")))

---------------------------------------------------------------------------------------------------------

# First chart
hist(daysData$Global_active_power,
main="Global Active Power", 
xlab="Global Active Power (kilowatts)", 
col="red")

# To PNG
png(file="firstChart.png",width=480,height=480)
hist(daysData$Global_active_power,
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")
dev.off()