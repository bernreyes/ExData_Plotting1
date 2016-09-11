setwd("C:/Users/Peesonal/Documents/Dette/Coursera/Exploratory Data Analysis/Week 1")

#read the dataset noting that "?" as the missing data and get the subset dates
data<-read.table("C:/Users/Peesonal/Documents/Dette/Coursera/Exploratory Data Analysis/Week 1/household_power_consumption.txt",sep=";",header=TRUE,na.strings=c("?"))
datasub<-subset(data,Date=="1/2/2007" | Date== "2/2/2007") #dates:2007-02-01,2007-02-02 

#convert character to date-time
date1<-as.Date(datasub$Date,"%d/%m/%Y") 
dt<-paste(date1,datasub$Time)
datetime<-as.POSIXct(strptime(dt,"%Y-%m-%d %H:%M:%S"))

plot(datetime,datasub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

#create a copy in png file with specific dimensions
dev.copy(png,file="plot2.png", width=480, height=480, units="px")
dev.off()