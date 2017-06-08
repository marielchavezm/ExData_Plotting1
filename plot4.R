
library(dplyr)

file <- "exdata_data_household_power_consumption.zip"
unzip(file) 
object_size(file)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?",stringsAsFactors = FALSE)
str(data)
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,Date >='2007-02-01'& Date<='2007-02-02')

data <- data %>% mutate(DateTime=paste(Date,Time))
data$DateTime <- as.POSIXct(data$DateTime)

#plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data$Global_active_power~data$DateTime,type="l",ylab="Global active power (Kilowatts)",xlab="")
plot(data$Voltage~data$DateTime,type="l",ylab="Voltage (Volt)",xlab="")
plot(data$Sub_metering_1~data$DateTime,type="l",ylab="Energy submetering",xlab="")
lines(data$Sub_metering_2~data$DateTime,col="red")
lines(data$Sub_metering_3~data$DateTime,col="blue")
legend("topright", col=c("black", "red", "blue"), cex=0.2,lwd=c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),)
plot(data$Global_reactive_power~data$DateTime,type="l",ylab="Global reactive power (Kilowatts)",xlab="")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

