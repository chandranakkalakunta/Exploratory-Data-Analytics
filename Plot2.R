setwd("C:/Users/chandra.nakkalakunta/Documents")

date1 <- "1/2/2007"

date2<- "2/2/2007"


inputData<-read.csv("household_power_consumption.txt", header=T, sep=';',na.strings = "?")

subsetData<- subset(inputData, Date %in% c(date1,date2))

subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(subsetData$Date), subsetData$Time)

subsetData$Datetime <- as.POSIXct(datetime)

with(subsetData, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
