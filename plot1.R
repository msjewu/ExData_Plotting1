# Course Project 1 - Plot 1

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

# PLOT 1
png(filename="plot1.png") #Note the "png" function defaults to 480x480 pixels

hist(x=data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()