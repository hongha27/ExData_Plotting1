#My directory
setwd("E:/R/DS_coursera/submit_ExData_Plotting1")
getwd()

# download file and unzip
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")

# read data
dat <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)
data <- dat

#Creates a subset of the data to the specific dates of interest
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Add Timestamp, converts it to an R datetime format.
data$Timest <- paste(data$Date, data$Time)
data$Timest <- strptime(data$Timest, format = "%d/%m/%Y %H:%M:%S")

# Generates plot4.png
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
par(mfcol=c(2,2))
plot(data$Timest,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(data$Timest,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Timest,data$Sub_metering_2,col="red")
lines(data$Timest,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_merering_2","Sub_metering_3"),col=c("black","red","blue"),ncol=1,lty=1)
plot(data$Timest,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data$Timest,data$Global_reactive_power,type="l",xlab="datetime",ylab="Voltage")
dev.off()