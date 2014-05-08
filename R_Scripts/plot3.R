plot3 <- function(inputFile="../DATA_INPUT/household_power_consumption.txt", outputFolder="../DATA_OUTPUT"){

	columnsClass <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
	data<-read.table(inputFile, sep=";", colClasses = columnsClass, header = T, na.strings = "?" )
	data$Date<-as.Date(data$Date, "%d/%m/%Y")
	data<-subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))
	FullDate<-as.POSIXlt(paste0(data$Date, " ", data$Time))
	data<-cbind(data, FullDate)
	
	if (!file.exists(outputFolder)){
		dir.create(outputFolder)
	}
	
	outputFile<-paste0(outputFolder, "/", "plot3.png")

	png(outputFile, width = 480, height = 480)
	plot(data$FullDate, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
	lines(data$FullDate,data$Sub_metering_2,col="red")
	lines(data$FullDate,data$Sub_metering_3,col="blue")
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), lty=1, col=c("black","red","blue"))
	dev.off()
}