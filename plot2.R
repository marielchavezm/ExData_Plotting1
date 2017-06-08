
library(dplyr)

#load data
file <- "exdata_data_household_power_consumption.zip"
unzip(file) 
object_size(file)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?",stringsAsFactors = FALSE)
str(data)
#add coloumn datetime
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,Date >='2007-02-01'& Date<='2007-02-02')

data <- data %>% mutate(DateTime=paste(Date,Time))
data$DateTime <- as.POSIXct(data$DateTime)

#Plot 2
plot(data$Global_active_power~data$DateTime,type="l",ylab="Global active power (Kilowatts)",xlab="")

#Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
