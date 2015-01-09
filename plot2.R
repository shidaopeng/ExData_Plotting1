library(data.table)
DT<-fread("household_power_consumption.txt",na.strings="?")
DT1<-DT[DT$Date=="1/2/2007",]
DT2<-DT[DT$Date=="2/2/2007",]
DT3<-rbind(DT1,DT2)
png("plot2.png")
with(DT3,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
