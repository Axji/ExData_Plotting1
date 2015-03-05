temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
unzip (temp, "household_power_consumption.txt")
Household_PC <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
Household_PC$Date <- as.Date(Household_PC$Date, format="%d/%m/%Y")
Household_PC_Subset <- subset(Household_PC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


hist(Household_PC_Subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
