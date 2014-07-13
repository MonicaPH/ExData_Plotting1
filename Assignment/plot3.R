## 2014/07/13 - 
## EXPLORATORY DATA ANALYSIS Assignment 1 - Coursera
## Plot 3
## By: MonicaPH

## This scripts process the data set on Electric power consumption as provided in the Coursera platform 
## to create a plot of the data

# Set language to engish
      Sys.setlocale("LC_TIME", "English")

# Read the data (make sure it is unzipped in your working directory)
      fileLocation <- "household_power_consumption.txt"  
      powerConsum <- read.table(fileLocation,header=TRUE,sep=";",as.is=FALSE,na.strings=c("",NA,"?")) #reads data into a data frame
      powerConsum[,1]<-as.Date(powerConsum[,1],format="%d/%m/%Y")                   #transforms the Date field into a date format
      
# Subsetting the data
      subPowerConsum<-powerConsum[(powerConsum[,1]=="2007-02-01"|powerConsum[,1]=="2007-02-02"),]
      
# Adding a column with the date and time together
      subPowerConsum[,10]<-paste(subPowerConsum[,1],subPowerConsum[,2])
      names(subPowerConsum)[10]<-"Date_time"
      formattedDateTime<-strptime(subPowerConsum$Date_time,format="%Y-%m-%d %H:%M:%S") 

# Plotting Energy sub metering to PNG device
      png(filename = "plot3.png",width = 480, height = 480, bg="white")
      par(mar=c(4,4,2,2))      
      plot(formattedDateTime,subPowerConsum$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")    #plot first
      lines(formattedDateTime,subPowerConsum$Sub_metering_2,col="red")                                      #add second
      lines(formattedDateTime,subPowerConsum$Sub_metering_3,col="blue")                                     #add third
      legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
      dev.off()
