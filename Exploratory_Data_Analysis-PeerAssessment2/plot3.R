#Questions
#You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.
#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
#4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
#5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


#Question 3
# Ans: 
#Decrease: NON-ROAD, NONPOINT, ON-ROAD
#Increase: POINT

#Clear all variable
rm(list=ls())

#Download file and unzip the files
download.file(destfile="./NEI_data.zip" ,"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip" ,method = "auto")
unzip("./NEI_data.zip")

#Load Data into R
NEIData <- readRDS("./summarySCC_PM25.rds")
SCCData <- readRDS("./Source_Classification_Code.rds")

library(ggplot2)
library(plyr)
library(dplyr)

marylandNEIData <- subset(NEIData, fips == "24510")

#using marylandNEIData
sumMarylandByYearTypeNEIData <- ddply(marylandNEIData,.(year,type),summarize, SumEmission=sum(Emissions))

png('./plot3.png')

#plot
p <- ggplot(data=sumMarylandByYearTypeNEIData, aes(x=year, y=SumEmission, group=type, colour=type)) +
  labs(x = "Year", y = "Fine particles (PM2.5) in tons") +
  ggtitle("Emissions from PM2.5 by type in the Baltimore City, Maryland")  +
  geom_line() +
  geom_point()

print(p)
dev.off()