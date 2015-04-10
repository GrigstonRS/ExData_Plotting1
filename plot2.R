plot2 <- function() {
  
  data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
  timestamp <- strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")
  data <- cbind(data, timestamp)
  
  png("plot2.png", bg="transparent", height=480, width=480)
  plot(data$timestamp, data$Global_active_power, type="s", xlab="", ylab="Global Active Power (kilowatts")
  dev.off()
  
}