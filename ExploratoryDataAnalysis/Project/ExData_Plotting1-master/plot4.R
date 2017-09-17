## Plot4.R

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

## Plot 4 - (Compound Plot comprising 'Global Active Power', 'Voltage', 'Sub_metering' & 'Global_reactive_power')
## --------------------------------------------------------------------------------------------------------------
## Open PNG file for plot:
png(filename="plot4.png")

## Create 2 x 2 Canvas
par(mfrow=c(2,2))

## Plot 'Global Active Power' sub-plot on 2 x 2 canvas:
plot(HPC$datetime,HPC$Global_active_power, type = "l",xlab="",ylab="Global Active Power")

## Plot 'Voltage' sub-plot on 2 x 2 canvas:
plot(HPC$datetime,HPC$Voltage, type = "l",xlab="datetime",ylab="Voltage")

## Plot 'Sub_metering' sub-plot on 2 x 2 canvas:
plot(HPC$datetime,HPC$Sub_metering_1, ylim=range(c(HPC$Sub_metering_1,HPC$Sub_metering_2)),type = "l",xlab="",ylab="")
par(new = TRUE)
plot(HPC$datetime,HPC$Sub_metering_2, ylim=range(c(HPC$Sub_metering_1,HPC$Sub_metering_2)),col="red",type = "l",xlab="",ylab="")
par(new = TRUE)
plot(HPC$datetime,HPC$Sub_metering_3, ylim=range(c(HPC$Sub_metering_1,HPC$Sub_metering_2)), type = "l",col="blue",xlab="",ylab="Energy sub metering")
legend("topright", pch="", lty=1, cex = 0.75, col=c("black","red","blue"), legend=c("HPCSub_metering_1","HPCSub_metering_2","HPCSub_metering_3"))

## Plot 'Global_reactive_power' sub-plot on 2 x 2 canvas:
plot(HPC$datetime,HPC$Global_reactive_power, type = "l",xlab="datetime",ylab="Global_reactive_power")

## Close PNG file:
dev.off()