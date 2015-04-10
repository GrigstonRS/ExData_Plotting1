plot4 <- function() {
  
  data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
  timestamp <- strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")
  data <- cbind(data, timestamp)
  
  png("plot4.png", bg="transparent", height=480, width=480)
  par(mfcol=c(2,2));
  
  plot(data$timestamp, data$Global_active_power, type="s", xlab="", ylab="Global Active Power")
  
  plot(data$timestamp, data$Sub_metering_1, type="s", xlab="", ylab="Energy sub metering")
  par(new=T)
  plot(data$timestamp, data$Sub_metering_2, type="s", xlab="", ylab="", axes=FALSE, ylim=c(0, 40), col="red")
  par(new=T)
  plot(data$timestamp, data$Sub_metering_3, type="s", xlab="", ylab="", axes=FALSE, ylim=c(0, 40), col="blue")
  par(new=F)
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1, 1), lwd=c(2.5,2.5, 2.5),col=c("black", "red", "blue"), bty="n")
  
  plot(data$timestamp, data$Voltage, type="s", xlab="datetime", ylab="Voltage")
  
  plot(data$timestamp, data$Global_reactive_power, type="s", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
}