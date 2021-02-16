#plot 4

#reading the data
colNames <- colnames(read.table("./data/household_power_consumption.txt",header=TRUE,sep = ";"))

data <- read.table("./data/household_power_consumption.txt",header=FALSE,sep = ";",col.names=colNames,fill = TRUE,na.strings = "?",
                   skip=grep("1/2/2007",readLines("./data/household_power_consumption.txt"))[1]-1,nrow=2880)

#plotting
png("plot4.png",height = 480,width = 480)
par(mfrow = c(2,2))

#1
plot(data$DateTime,data$Global_active_power,main="",type="l",xlab="",ylab = "Global Active Power",lwd=1.5)

#2: 
plot(data$DateTime,data$Voltage,type="l", main="",lwd=1.5,xlab="datetime",ylab="Voltage")

#3
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

plot(data$DateTime,sub1,type="l",ylab="Energy Submetering",xlab="")
lines(data$DateTime,sub2,type="l",col="red")
lines(data$DateTime,sub3,type="l",col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col =  c("black","red","blue"))

#4
plot(data$DateTime,data$Global_reactive_power,type="l", main="",lwd=1,xlab="datetime",ylab="Global_reactive_power")

dev.off()