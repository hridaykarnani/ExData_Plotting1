setwd("C:/Users/Hriday/Documents/R/win-library/4.0/Data_Science_R_Coursera/Exploratory_Data_Analysis")

## downloading data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"data.zip",method="curl")
unzip("data.zip",list=TRUE)

library(lubridate)

#since my computer is in spanish, i am changing it to english
Sys.setlocale(locale = "USA")

##reading data, first extracting the name of the columns
colNames <- colnames(read.table("./data/household_power_consumption.txt",header=TRUE,sep = ";"))

data <- read.table("./data/household_power_consumption.txt",header=FALSE,sep = ";",col.names=colNames,fill = TRUE,na.strings = "?",
                   skip=grep("1/2/2007",readLines("./data/household_power_consumption.txt"))[1]-1,nrow=2880)

#plotting and saving it in a .png file
png("plot1.png",height = 480,width = 480)
hist(data$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()