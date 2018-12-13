setwd("C:/Users/Subbadk/Desktop/Personal/02 DS/01 Coursera/01 Data Science/04 Exploratory Data Analysis/Week 1")

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
df$Date_Time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df <- df[, which(!colnames(df) %in% c("Date", "Time"))]

png("plot3.png", width=480, height=480)
with(df, {plot(y=as.numeric(Sub_metering_1), x=Date_Time, xlab="", ylab="Energy Submetering", type="l")
lines(y=as.numeric(Sub_metering_2), col="red", x=Date_Time, type="l")
lines(y=as.numeric(Sub_metering_3), col="blue", x=Date_Time, type="l")})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()