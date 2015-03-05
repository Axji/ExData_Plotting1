temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
unzip (temp, "household_power_consumption.txt")
Household_PC <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
Household_PC$Date <- as.Date(Household_PC$Date, format="%d/%m/%Y")
Household_PC$Datetime <- paste(Household_PC$Date, Household_PC$Time, sep=" ")

Household_PC_Subset <- subset(Household_PC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

Household_PC_Subset$Datetime <- as.POSIXct(paste(as.Date(Household_PC_Subset$Date), Household_PC_Subset$Time))

plot(Household_PC_Subset$Global_active_power~Household_PC_Subset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()