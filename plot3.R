
library(dplyr)
#load data
file <- "exdata_data_household_power_consumption.zip"
unzip(file) 
object_size(file)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?",stringsAsFactors = FALSE)
str(data)
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,Date >='2007-02-01'& Date<='2007-02-02')
#add coloumn datetime
data <- data %>% mutate(DateTime=paste(Date,Time))
data$DateTime <- as.POSIXct(data$DateTime)


#Plot 3
plot(data$Sub_metering_1~data$DateTime,type="l",ylab="Energy submetering",xlab="")
lines(data$Sub_metering_2~data$DateTime,col="red")
lines(data$Sub_metering_3~data$DateTime,col="blue")
legend("topright", col=c("black", "red", "blue"), cex=0.5,lwd=c(1,1,1),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Save file and close device
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()