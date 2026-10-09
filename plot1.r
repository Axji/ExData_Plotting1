# plot1.r: Histogramm der Global Active Power (kW) am 1. und 2. Februar 2007
# Datensatz: Individual household electric power consumption (UC Irvine Machine Learning Repository)
# Ergebnis: plot1.png (480 x 480 Pixel)

# Daten herunterladen und die Textdatei entpacken (Trennzeichen ';', '?' steht fuer fehlende Werte)
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
unzip (temp, "household_power_consumption.txt")
# Alle Zeilen einlesen. Date und Time sind zuerst Text
Household_PC <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
# Datum von Text (TT/MM/JJJJ) in einen Datumswert umwandeln
Household_PC$Date <- as.Date(Household_PC$Date, format="%d/%m/%Y")
# Nur die beiden Tage behalten, die die Aufgabe verlangt
Household_PC_Subset <- subset(Household_PC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Haeufigkeit der Leistungswerte als rotes Histogramm
hist(Household_PC_Subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Das Diagramm als PNG-Datei speichern und das Grafikgeraet schliessen
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
