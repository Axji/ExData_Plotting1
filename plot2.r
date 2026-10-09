# plot2.r: Verlauf der Global Active Power (kW) am 1. und 2. Februar 2007
# Datensatz: Individual household electric power consumption (UC Irvine Machine Learning Repository)
# Ergebnis: plot2.png (480 x 480 Pixel)

# Daten herunterladen und die Textdatei entpacken (Trennzeichen ';', '?' steht fuer fehlende Werte)
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
unzip (temp, "household_power_consumption.txt")
# Alle Zeilen einlesen. Date und Time sind zuerst Text
Household_PC <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
# Datum von Text (TT/MM/JJJJ) in einen Datumswert umwandeln
Household_PC$Date <- as.Date(Household_PC$Date, format="%d/%m/%Y")
# Datum und Uhrzeit zu einem Text zusammenfuegen
Household_PC$Datetime <- paste(Household_PC$Date, Household_PC$Time, sep=" ")

# Nur die beiden Tage behalten, die die Aufgabe verlangt
Household_PC_Subset <- subset(Household_PC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Datum und Uhrzeit als Zeitpunkt (POSIXct), damit die x-Achse Wochentage zeigt
Household_PC_Subset$Datetime <- as.POSIXct(paste(as.Date(Household_PC_Subset$Date), Household_PC_Subset$Time))

# Linie ueber die Zeit (type = "l")
plot(Household_PC_Subset$Global_active_power~Household_PC_Subset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Das Diagramm als PNG-Datei speichern und das Grafikgeraet schliessen
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()