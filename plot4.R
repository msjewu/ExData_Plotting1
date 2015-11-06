# Course Project 1 - Plot 4

# Read in a few lines from dataset to figure out the class type
# Knowing the class type increases speed of data import
initial <- read.csv("household_power_consumption.txt",sep=";",
                    stringsAsFactors=FALSE, nrows=25)
classes <- sapply(initial, class)

# Read in data
all_data <- read.csv("household_power_consumption.txt",sep=";",
                     colClasses=classes, na.strings="?")
head(all_data)

# Subset data
data <- subset(all_data, Date =="1/2/2007"|Date =="2/2/2007")
row.names(data)<-NULL

# Combine "Date" and "Time" into one column with a date-time format
data$date_time <- strptime(paste(data$Date," ",data$Time), "%d/%m/%Y %H:%M:%S")
head(data)

# PLOT 4
png(filename="plot4.png") #Note the "png" function defaults to 480x480 pixels

par(mfrow=c(2,2))
#Global active power vs date_time graph
plot(data$date_time, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

#Voltage vs date_time graph
plot(data$date_time, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

#Energy sub metering vs date_time graph
plot(data$date_time, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(data$date_time, data$Sub_metering_2, type="l", col="red")
lines(data$date_time, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

#Global reactive power vs date_time graph
plot(data$date_time, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()