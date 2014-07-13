## 2014/07/13 - 
## EXPLORATORY DATA ANALYSIS Assignment 1 - Coursera
## Plot 1
## By: MonicaPH

## This scripts process the data set on Electric power consumption as provided in the Coursera platform 
## to create a histogram of the Global Active Power


# Read the data (make sure it is unzipped in your working directory)
      fileLocation <- "household_power_consumption.txt"  
      powerConsum <- read.table(fileLocation,header=TRUE,sep=";",as.is=FALSE,na.strings=c("",NA,"?")) #reads data into a data frame
      powerConsum[,1]<-as.Date(powerConsum[,1],format="%d/%m/%Y")                   #transforms the Date field into a date format

# Subsetting the data
      subPowerConsum<-powerConsum[(powerConsum[,1]=="2007-02-01"|powerConsum[,1]=="2007-02-02"),]

# Plotting histogram of Global Active Power to PNG device
      png(filename = "plot1.png",width = 480, height = 480, bg="white")
      par(mar=c(4,4,2,2))      
      hist(subPowerConsum$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
      dev.off()
