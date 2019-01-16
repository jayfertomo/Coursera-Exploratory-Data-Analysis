# Reading the file
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subsetting the data then Correcting the class of the columns
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Making the plot
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
