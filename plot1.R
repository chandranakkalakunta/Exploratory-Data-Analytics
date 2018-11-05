setwd("C:/Users/chandra.nakkalakunta/Documents")

date1 <- "1/2/2007"

date2<- "2/2/2007"


inputData<-read.csv("household_power_consumption.txt", header=T, sep=';',na.strings = "?")

subsetData<- subset(inputData, Date %in% c(date1,date2))

subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")

hist(subsetData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png("plot1.png", width=480, height=480)
dev.off()
