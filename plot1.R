getwd()
?read.table
dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
head(dat)
table(is.na(dat))
library(lubridate)
dat$Date <- dmy(dat$Date)
class(dat$Date)
head(dat)
dat$Time <- hms(dat$Time)
class(dat$Time)
dim(dat)
head(dat)
dat_used1 <- subset(dat,dat$Date == "2007-02-01" , na.rm = TRUE)
dat_used2 <- subset(dat,dat$Date == "2007-02-02" , na.rm = TRUE)
dat_used <- rbind(dat_used1 , dat_used2)
head(dat_used)
table(dat_used$Date)
View(dat_used)


#Plot1 

png("plot1.png", width=480, height=480)
hist(as.numeric(dat_used$Global_active_power)/1000, nclass = 24,xlab = "Global Active Power (kilowatts)" , ylab = "Frequency", col = "red" , main = "Global Active Power")
dev.off()


