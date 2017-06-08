

library(dplyr)

file <- "exdata_data_household_power_consumption.zip"
unzip(file) 
object_size(file)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?",stringsAsFactors = FALSE)
str(data)
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,Date >='2007-02-01'& Date<='2007-02-02')
## add datetime column
data <- data %>% mutate(DateTime=paste(Date,Time))
data$DateTime <- as.POSIXct(data$DateTime)
#Plot 1
hist(data$Global_active_power,col="red",main = "Global Active Power",xlab="Global active power (Kilowatts)")

#Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()










