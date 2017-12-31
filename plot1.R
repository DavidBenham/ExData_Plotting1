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
power <- read.table(file.path(dataDirectory,file),sep=";", header=TRUE,stringsAsFactors = FALSE, dec=".")

# Filter Data to only 2 days Feb 1-2 of 2007
power <- subset(power, Date == '1/2/2007' | power$Date == '2/2/2007')

# Create the output
png("plot1.png",width=480,height=480)
hist(as.numeric(power$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
