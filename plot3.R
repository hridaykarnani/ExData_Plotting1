# plot 3

# reading the data
colNames <- colnames(read.table("./data/household_power_consumption.txt",header=TRUE,sep = ";"))

data <- read.table("./data/household_power_consumption.txt",header=FALSE,sep = ";",col.names=colNames,fill = TRUE,na.strings = "?",
                   skip=grep("1/2/2007",readLines("./data/household_power_consumption.txt"))[1]-1,nrow=2880)

#subsetting the data to plot it later
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

# plotting and saving it to a .png file
png("plot3.png",height = 480,width = 480)
plot(data$DateTime,sub1,type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,sub2,type="l",col="red")
lines(data$DateTime,sub3,type="l",col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col =  c("black","red","blue"))

dev.off()