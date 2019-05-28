temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- {read.csv2(unz(temp, "household_power_consumption.txt"), 
                   header = TRUE, colClasses = c(rep("character", 2), rep("numeric", 7)), dec = ".", na.strings = "?")}
unlink(temp)

data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png("plot1.png")

{hist(data$Global_active_power, 
      col = "red", 
      xlab = "Global Active Power (kilowatts)", 
      main = "Global Active Power")
}

dev.off()




