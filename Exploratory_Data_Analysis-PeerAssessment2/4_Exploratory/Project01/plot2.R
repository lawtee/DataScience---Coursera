#
# Exploratory Data Analysis - Course Project 1 
# By lawtee
#
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
# 1.Date: Date in format dd/mm/yyyy  
# 2.Time: time in format hh:mm:ss
# 3.Global_active_power: household global minute-averaged active power (in kilowatt)
# 4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# 5.Voltage: minute-averaged voltage (in volt)
# 6.Global_intensity: household global minute-averaged current intensity (in ampere)
# 7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hotplates are not electric but gas powered).
# 8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# 9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

#Step 1: Data Preparation
  #Loading Dataset into R, csv seperated by ';'
  #mssing values are coded as ?
  electricData <- read.csv('household_power_consumption.txt',,stringsAsFactors=F,sep=';',na.strings="?")
  
  #Filter the date range 2007-02-01 and 2007-02-02
  #Data is in Day/Month/Year
  filter.rows   <- as.Date(electricData$Date, format="%d/%m/%Y") >= as.Date("01/02/2007", format="%d/%m/%Y") & as.Date(electricData$Date, format="%d/%m/%Y") <= as.Date("02/02/2007", format="%d/%m/%Y")
  electricReducedData <- electricData[filter.rows, ]


#Step 2: Plotting
  #Graphical Device - initialize
  png("plot2.png",width=480,height=480,units="px",bg = "transparent")
  
  #Data - Join the Date and Time
    datetimeData <- strptime(paste(electricReducedData$Date, electricReducedData$Time), "%d/%m/%Y %H:%M:%S")
    
  #specify the x-axis range
  #there should be a better way to do this
    Date1  <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    Date2 <- strptime("02/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    Date3 <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    DateRange = c(Date1,Date2,Date3) 
  
  #Plot the Data
    plot(datetimeData , electricReducedData$Global_active_power,type="l", ylim=c(0,8), xlab="", ylab="Global Active Power (kilowatts)", xaxt="n", yaxt="n")
  
  #modify color of plot box
    box( col = 'dark grey',  lwd=2)
  #x-axis convert to "Mon" display   
  #side (1=bottom, 2=left, 3=top, 4=right)
    axis.POSIXct(side=1,  col = "black", at=cut(DateRange, "days"), format="%a") 
  
  #y-axis set the sequence
  #side (1=bottom, 2=left, 3=top, 4=right)
    axis(side=2,  col = "black", at=seq(0 , 6, by=2), labels=seq(0 , 6, by=2))
  
  #Graphical Device - close
  dev.off()
