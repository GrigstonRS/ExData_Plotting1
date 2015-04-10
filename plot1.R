plot1 <- function() {
  
  data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
  timestamp <- strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")
  data <- cbind(data, timestamp)
  
  png("plot1.png", bg="transparent", height=480, width=480)
  hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
  
}