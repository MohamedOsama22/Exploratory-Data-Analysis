dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
head(dat)

dim(dat)
dat_used <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]
dat_used1 <- subset(dat,dat$Date == "2007-02-01" , na.rm = TRUE)
dat_used2 <- subset(dat,dat$Date == "2007-02-02" , na.rm = TRUE)
dat_used <- rbind(dat_used1 , dat_used2)
dim(dat_used)
head(dat_used)
table(dat_used$Date)
datetime <- strptime(paste(dat_used$Date, dat_used$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datetime

#plot4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2),mar=c(4,4,2,2))
plot(datetime,as.numeric(dat_used$Global_active_power)/500,type="l" , ylab = "Global Active Power (kilowatts)", xlab = "")
plot(datetime,as.numeric(dat_used$Voltage)/4,type="l" , ylab = "Voltage", xlab = "datetime")
plot(datetime,as.numeric(dat_used$Sub_metering_1),type="l" , ylab = "Energy sub metering")
lines(datetime ,as.numeric(dat_used$Sub_metering_2) , col = "red" )
lines(datetime , as.numeric(dat_used$Sub_metering_3) , col = "blue" )
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5,col = c("black","red","blue"))
plot(datetime,as.numeric(dat_used$Global_reactive_power),type="l" , ylab = "global reactive power", xlab = "datetime")

dev.off()
