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

# Generates plot2.png
png("plot2.png",width=480,height=480)
plot(data$Timest,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
