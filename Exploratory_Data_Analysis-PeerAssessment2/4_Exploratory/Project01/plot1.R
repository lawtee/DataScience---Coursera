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
  png("plot1.png",width=480,height=480,units="px",bg = "transparent")
    #create the histogram with teh correct separation
    h<-hist(electricReducedData$Global_active_power,breaks=16) 
    #plot
    plot(h,freq=TRUE, col="red", ylim=c(0,1200),xlim=c(0,9),xaxt='n', main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
    #fix the labels
    axis(side=1, at=c(0,2,4,6), labels=c(0,2,4,6))
  #Graphical Device - close
  dev.off()
