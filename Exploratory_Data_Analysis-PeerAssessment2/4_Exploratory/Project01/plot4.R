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
  png("plot4.png",width=480,height=480,units="px",bg = "transparent")
  
  #Data - Join the Date and Time
    datetimeData <- strptime(paste(electricReducedData$Date, electricReducedData$Time), "%d/%m/%Y %H:%M:%S")
    
  #specify the x-axis range
  #there should be a better way to do this
    Date1  <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    Date2 <- strptime("02/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    Date3 <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    DateRange = c(Date1,Date2,Date3) 
  
  #Set number of graph to plot
  par(mfrow=c(2,2))
  #set the text size
  par(cex.axis=0.8, cex.lab=1, cex.main=1.2, cex.sub=1)
    
  #Plot 1
    #Plot the Data
    plot(datetimeData , electricReducedData$Global_active_power, col= "black", type="l", ylim=c(0,7.5), xlab="", ylab="Global Active Power", xaxt="n", yaxt="n", )
    
    #modify color of plot box
    box( col = 'dark grey',  lwd=1)
    
    #x-axis convert to "Mon" display   
    #side (1=bottom, 2=left, 3=top, 4=right)
    axis.POSIXct(side=1,  col = "black", at=cut(DateRange, "days"), format="%a") 
    
    #y-axis set the sequence
    #side (1=bottom, 2=left, 3=top, 4=right)
    axis(side=2,  col = "black", at=seq(0 , 6, by=2), labels=seq(0 , 6, by=2))
   
  #Plot 2
    #Plot the Data
    plot(datetimeData , electricReducedData$Voltage, col= "black", type="l", ylim=c(233,247), xlab="datetime", ylab="Voltage", xaxt="n", yaxt="n", )
    
    #modify color of plot box
    box( col = 'dark grey',  lwd=1)
    
    #x-axis convert to "Mon" display   
    #side (1=bottom, 2=left, 3=top, 4=right)
    axis.POSIXct(side=1,  col = "black", at=cut(DateRange, "days"), format="%a") 
    
    #y-axis set the sequence
    #side (1=bottom, 2=left, 3=top, 4=right)
    axis(side=2,  col = "black",at=seq(234 , 246, by=4))
    axis(side=2,  col = "black", at=seq(234 , 246, by=2), labels=FALSE)
   
  #Plot 3
      #Plot the Data
      plot(datetimeData , electricReducedData$Sub_metering_1, col= "black", type="l", ylim=c(0,40), xlab="", ylab="", xaxt="n", yaxt="n", )
      par(new=TRUE)  
      plot(datetimeData , electricReducedData$Sub_metering_2, col= "red", type="l", ylim=c(0,40), xlab="", ylab="", xaxt="n", yaxt="n",)
      par(new=TRUE)  
      plot(datetimeData , electricReducedData$Sub_metering_3, col= "blue", type="l", ylim=c(0,40), xlab="", ylab="Energy sub metering", xaxt="n", yaxt="n",)
      
      #modify color of plot box
        box( col = 'dark grey',  lwd=1)
      
      #x-axis convert to "Mon" display   
      #side (1=bottom, 2=left, 3=top, 4=right)
        axis.POSIXct(side=1,  col = "black", at=cut(DateRange, "days"), format="%a") 
      
      #y-axis set the sequence
      #side (1=bottom, 2=left, 3=top, 4=right)
        axis(side=2,  col = "black", at=seq(0 , 30, by=10), labels=seq(0 , 30, by=10))
    
      #legend
     
      legend('topright',  bty = "n" ,lwd=1,legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red','blue'))
  
  #Plot 4
    #Plot the Data
    plot(datetimeData , electricReducedData$Global_reactive_power, col= "black", type="l", ylim=c(0.0,0.52), xlab="datetime", ylab="Global_reactive_power", xaxt="n", yaxt="n")
    
    #modify color of plot box
    box( col = 'dark grey',  lwd=1)
    
    #x-axis convert to "Mon" display   
    #side (1=bottom, 2=left, 3=top, 4=right)
    axis.POSIXct(side=1,  col = "black", at=cut(DateRange, "days"), format="%a" ) 
    
    #y-axis set the sequence
    #side (1=bottom, 2=left, 3=top, 4=right)
    axis(side=2,  col = "black",at=seq(0 , 0.5, by=0.1),labels=seq(0 , 0.5, by=0.1))
    
  #Graphical Device - close
  dev.off()
