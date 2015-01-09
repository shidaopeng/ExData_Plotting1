library(data.table)
DT<-fread("household_power_consumption.txt",na.strings="?")
DT1<-DT[DT$Date=="1/2/2007",]
DT2<-DT[DT$Date=="2/2/2007",]
DT3<-rbind(DT1,DT2)
png("plot4.png")
par(mfcol=c(2,2))
with(DT3,{
  #Draw 1st plot
  plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power")
  #Draw 2nd plot
  plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
  lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_2),col="red")
  lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_3),col="blue")
  legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
  #Draw 3rd plot
  plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Voltage),type="l",xlab="datetime",ylab="Voltage")
  #Draw 4th plot
  plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()