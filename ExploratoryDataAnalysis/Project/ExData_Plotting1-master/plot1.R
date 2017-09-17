## Plot1.R

## Read Household Power Consumption (HPC) data into data frame called 'HPC': 
## NB Data is hard-subsetted by line number, rather than reading entire dataset and subsequently subsetting by date
HPC<-read.table("./data/household_power_consumption.txt",sep=";",na.strings = "?",comment.char="",skip=66637,nrows=2880)

## Add Colnames (lifted from original  data) to 'HPC' data frame: 
colnames(HPC)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Plot 1 - (Global_active_power Histogram)
## ----------------------------------------
## Open PNG file for plot:
png(filename="plot1.png")

hist(HPC$Global_active_power, col="orangered",xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

## Close PNG file:
dev.off()
