
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

# Fourth chart
    
par(mfrow = c(2, 2))    

with(daysData, 
     plot(dateTime, 
          Global_active_power,  
          type = "l", #Plot with lines
          xlab = "",  #No labels on x-axis
          ylab = "Global Active Power (kilowatts)"))

with(daysData, 
     plot(dateTime, 
          Voltage,  
          type = "l", #Plot with lines
          ylab = "Voltage"))

with(daysData, 
     plot(dateTime, 
          Sub_metering_1,  
          type = "l", #Plot with lines
          xlab = "",  #No labels on x-axis
          ylab = "Energy sub metering"))      

lines(daysData$dateTime, daysData$Sub_metering_2, type='l', col = "red")
lines(daysData$dateTime, daysData$Sub_metering_3, type='l', col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1,1,1) ) 

with(daysData, 
     plot(dateTime, 
          Global_reactive_power,  
          type = "l", #Plot with lines
          ))

# To PNG
png(file="fourthChart.png",width=480,height=480)

par(mfrow = c(2, 2))    

with(daysData, 
     plot(dateTime, 
          Global_active_power,  
          type = "l", #Plot with lines
          xlab = "",  #No labels on x-axis
          ylab = "Global Active Power (kilowatts)"))

with(daysData, 
     plot(dateTime, 
          Voltage,  
          type = "l", #Plot with lines
          ylab = "Voltage"))

with(daysData, 
     plot(dateTime, 
          Sub_metering_1,  
          type = "l", #Plot with lines
          xlab = "",  #No labels on x-axis
          ylab = "Energy sub metering"))      

lines(daysData$dateTime, daysData$Sub_metering_2, type='l', col = "red")
lines(daysData$dateTime, daysData$Sub_metering_3, type='l', col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1,1,1) ) 

with(daysData, 
     plot(dateTime, 
          Global_reactive_power,  
          type = "l", #Plot with lines
     ))

dev.off()