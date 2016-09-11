setwd("C:/Users/Peesonal/Documents/Dette/Coursera/Exploratory Data Analysis/Week 1")

#read the dataset noting that "?" as the missing data and get the subset dates
data<-read.table("C:/Users/Peesonal/Documents/Dette/Coursera/Exploratory Data Analysis/Week 1/household_power_consumption.txt",sep=";",header=TRUE,na.strings=c("?"))
datasub<-subset(data,Date=="1/2/2007" | Date== "2/2/2007") #dates:2007-02-01,2007-02-02 

#convert character to date-time
date1<-as.Date(datasub$Date,"%d/%m/%Y") 
dt<-paste(date1,datasub$Time)
datetime<-as.POSIXct(strptime(dt,"%Y-%m-%d %H:%M:%S"))

plot(datetime,type="n",datasub$Sub_metering_1,ylab="Energy sub metering",xlab=NA)
points(datetime,datasub$Sub_metering_1,type="l")
points(datetime,datasub$Sub_metering_2,col="red",type="l")
points(datetime,datasub$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#create a copy in png file with specific dimensions
dev.copy(png,file="plot3.png", width=480, height=480, units="px")
dev.off()