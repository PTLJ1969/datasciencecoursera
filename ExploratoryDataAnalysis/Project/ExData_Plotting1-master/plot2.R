## Plot2.R

## Read Household Power Consumption (HPC) data into data frame called 'HPC': 
## NB Data is hard-subsetted by line number, rather than reading entire dataset and subsequently subsetting by date
HPC<-read.table("./data/household_power_consumption.txt",sep=";",na.strings = "?",comment.char="",skip=66637,nrows=2880)

## Add Colnames (lifted from original  data) to 'HPC' data frame: 
colnames(HPC)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## The following three steps create a 'datetime' column from the oridinal 'Date' and 'Time' columns
## This is neccessary for the line plot X-axes, where the respective HPC data features are plotted against time

## Convert Date from 'Factor' to 'Date' class:
HPC$Date<-as.Date(HPC$Date, format="%d/%m/%Y")

## Paste Date Column data to corresponding Time Column data to crerate new 'datetime' column in 'HPC' dataframe
HPC$datetime <- with(HPC, as.POSIXct(paste(HPC$Date, as.character(HPC$Time))))

## Format new datetime column
HPC$datetime <- strptime(HPC$datetime, "%Y-%m-%d %H:%M:%S")

## Plot 2 - (Global_active_power Line Plot)
## ----------------------------------------
## Open PNG file for plot:
png(filename="plot2.png")

## Plot Global_active_power Data:
plot(HPC$datetime,HPC$Global_active_power, type = "l",xlab="",ylab="Global Active Power (kilowatts)")

## Close PNG file:
dev.off()
