library(data.table)
DT<-fread("household_power_consumption.txt",na.strings="?")
DT1<-DT[DT$Date=="1/2/2007",]
DT2<-DT[DT$Date=="2/2/2007",]
DT3<-rbind(DT1,DT2)
png("plot3.png")
with(DT3,{
  plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
  lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_2),col="red")
  lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_3),col="blue")
  legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
})
dev.off()
