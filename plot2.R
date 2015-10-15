##Reading off the data from file household_power_consumption.txt from 1/2/2007 to 28/2/2007

data <- read.table("household_power_consumption.txt", header=F, sep=";",na.strings="?",
                   skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")),
                   nrows=2880)

##Setting the colnmaes which we would have missed in the previous read
colnames(data) <-names(read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?",nrows=1))

#Convert Date and Time to R-date/time:
data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Time <- NULL
colnames(data$Date) <- c(DateTime)

#Plotting a histogram and saving to file plot1.png
png(filename='plot2.png',width = 480, height = 480,)
plot(data$Date,data$Global_active_power,type='l',xlab='',ylab="Global Active Power (kilowatts)")
dev.off()
