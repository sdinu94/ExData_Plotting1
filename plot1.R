setwd("C:/Users/Subbadk/Desktop/Personal/02 DS/01 Coursera/01 Data Science/04 Exploratory Data Analysis/Week 1")

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
df$Date_Time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df <- df[, which(!colnames(df) %in% c("Date", "Time"))]

png("plot1.png", width=480, height=480)
with(df, hist(as.numeric(Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()