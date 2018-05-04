#Questions
#You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.
#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
#4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
#5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

#Set Working Directory
setwd("C:/11_R/Coursera/4_Exploratory/Proj02")

#Question 5
# Ans: Dropped

#Clear all variable
rm(list=ls())

#Download file and unzip the files
#download.file(destfile="./NEI_data.zip" ,"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip" ,method = "auto")
#unzip("./NEI_data.zip")

#Load Data into R
NEIData <- readRDS("./summarySCC_PM25.rds")
SCCData <- readRDS("./Source_Classification_Code.rds")

library(ggplot2)
library(plyr)
library(dplyr)

#Subset to obtain required data
marylandOnRoadNEIData <- subset(NEIData, fips == "24510"& type =="ON-ROAD")

#Calculate the sum
sumMarylandOnRoadNEIData <- ddply(marylandOnRoadNEIData,.(Pollutant,year),summarize, SumEmission=sum(Emissions))


png('./plot5.png')

#Plot
plot(sumMarylandOnRoadNEIData$year , sumMarylandOnRoadNEIData$SumEmission, main="Emissions from PM2.5 in the Baltimore City, Maryland (TYPE=ON-ROAD)", col= "black", type="l",  xlab="Year", ylab="Sum of Fine particles (PM2.5) in tons" )

dev.off()