setwd("C:/Users/chandra.nakkalakunta/Documents")

date1 <- "1/2/2007"

date2<- "2/2/2007"


inputData<-read.csv("household_power_consumption.txt", header=T, sep=';',na.strings = "?")

subsetData<- subset(inputData, Date %in% c(date1,date2))

subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(subsetData$Date), subsetData$Time)

subsetData$Datetime <- as.POSIXct(datetime)

with(subsetData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()

