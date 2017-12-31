# Set Working Directory
setwd("C:\\Users\\David\\Desktop\\R\\S4W1\\ExData_Plotting1")

#  Create Data Directory
dataDirectory <- 'data'
if(!file.exists(dataDirectory))
{
    dir.create("data")
}


# Acquire Data and Check for Existance
file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
file.dest <- 'C:\\Users\\David\\Desktop\\R\\S4W1\\ExData_Plotting1\\data\\power_consumption.zip'

if(!file.exists(file.dest))
{
    download.file(file.url,file.dest)    
}

# Extract File
file <- 'household_power_consumption.txt'
if(!file.exists(paste(dataDirectory,"\\",file,sep="")))
{
    unzip(file.dest, exdir = dataDirectory)
}

# Load Data
power <- read.table(file.path(dataDirectory,file),sep=";", header=TRUE)

# Filter Data to only 2 days Feb 1-2 of 2007
power <- subset(power, Date == '1/2/2007' | power$Date == '2/2/2007')

# Create the output
png("plot3.png",width=480,height=480)
par(mfrow=c(1,1))

plot(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(power$Sub_metering_1),type = "l", ylab = "Energy sub metering", xlab = "", col="black")
lines(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(power$Sub_metering_2),type = "l",col="red")
lines(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(power$Sub_metering_3),type = "l",col="blue")
legend("topright",lty = 1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()