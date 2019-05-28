library(stringr)
Sys.setlocale("LC_ALL", "English")

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- {read.csv2(unz(temp, "household_power_consumption.txt"), 
                   header = TRUE, colClasses = c(rep("character", 2), rep("numeric", 7)), dec = ".", na.strings = "?")}
unlink(temp)

data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

date_time <- strptime(str_c(data$Date, data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png")

{plot(date_time, data$Sub_metering_1, 
      type = "l",
      col = "black",
      xlab = "",
      ylab = "Energy sub metering")}

{lines(date_time, data$Sub_metering_2,
       col = "red")}

{lines(date_time, data$Sub_metering_3,
       col = "blue")}

{legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       col = c("black", "red", "blue"))}

dev.off()
