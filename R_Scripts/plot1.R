plot1 <- function(inputFile="../DATA_INPUT/household_power_consumption.txt", outputFolder="../Plot_Files"){

	columnsClass <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
	data<-read.table(inputFile, sep=";", colClasses = columnsClass, header = T, na.strings = "?" )
	data$Date<-as.Date(data$Date, "%d/%m/%Y")
	data<-subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))
	FullDate<-as.POSIXlt(paste0(data$Date, " ", data$Time))
	data<-cbind(data, FullDate)
	
	if (!file.exists(outputFolder)){
		dir.create(outputFolder)
	}
	
	outputFile<-paste0(outputFolder, "/", "plot1.png")

	png(outputFile, width = 480, height = 480)
	hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
	dev.off()
}