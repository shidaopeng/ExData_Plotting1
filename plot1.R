library(data.table)
DT<-fread("household_power_consumption.txt",na.strings="?")
DT1<-DT[DT$Date=="1/2/2007",]
DT2<-DT[DT$Date=="2/2/2007",]
DT3<-rbind(DT1,DT2)
png("plot1.png")
with(DT3,hist(as.numeric(Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()

