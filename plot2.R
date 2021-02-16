#plot2 

# reading the data
colNames <- colnames(read.table("./data/household_power_consumption.txt",header=TRUE,sep = ";"))

data <- read.table("./data/household_power_consumption.txt",header=FALSE,sep = ";",col.names=colNames,fill = TRUE,na.strings = "?",
                   skip=grep("1/2/2007",readLines("./data/household_power_consumption.txt"))[1]-1,nrow=2880)


# changing date and time to their respective formats
data$DateTime <- paste(data$Date,data$Time,sep = " ")
data$DateTime <- strptime(data$DateTime, "%y/%m/%d %H:%M:%S")

# plotting and saving it to a .png file
png("plot2.png",height = 480,width = 480)
plot(data$DateTime,data$Global_active_power,main="",type="l",xlab="",ylab = "Global Active Power (kilowatts)",lwd=1.5)
dev.off()