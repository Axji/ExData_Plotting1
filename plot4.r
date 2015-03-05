temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
unzip (temp, "household_power_consumption.txt")
Household_PC <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
Household_PC$Date <- as.Date(Household_PC$Date, format="%d/%m/%Y")
Household_PC$Datetime <- paste(Household_PC$Date, Household_PC$Time, sep=" ")

Household_PC_Subset <- subset(Household_PC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

Household_PC_Subset$Datetime <- as.POSIXct(paste(as.Date(Household_PC_Subset$Date), Household_PC_Subset$Time))

par(mfrow= c(2,2), mar = c(4,4,3,2), cex = "0.75")

plot(Household_PC_Subset$Datetime, Household_PC_Subset$Global_active_power,
     type = "l", 
     xlab="datetime", 
     ylab="Global_active_power")

plot(Household_PC_Subset$Datetime, Household_PC_Subset$Voltage,
     type = "l", 
     xlab="datetime", 
     ylab="Voltage")

plot(Household_PC_Subset$Datetime, Household_PC_Subset$Sub_metering_1, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(Household_PC_Subset$Datetime, Household_PC_Subset$Sub_metering_2, col = "red")
lines(Household_PC_Subset$Datetime, Household_PC_Subset$Sub_metering_3, col = "blue")
legend("topright", 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Household_PC_Subset$Datetime, Household_PC_Subset$Global_reactive_power,
     type = "l", 
     xlab="datetime", 
     ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()