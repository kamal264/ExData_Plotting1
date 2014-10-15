## Course Assignment 1: plot4.R

#install.packages("sqldf");
library(sqldf);

#Import the range of interest from the datafile
datafile <- "./data/household_power_consumption.txt";
cls <- c(Global_active_power="numeric", Global_reactive_power="numeric", Voltage="numeric", Global_intensity="numeric");
dat <- read.csv.sql(datafile, sql = "SELECT * from file
                    WHERE Date IN ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE,colClasses =cls)
#Adding Date Time column in Data Frame
dat["DateTime"] <- NA

dat$DateTime <- strptime(paste(as.character(dat$Date), dat$Time), format = "%d/%m/%Y %H:%M:%S")


###open png to plot the graph

png(filename="plot4.png", height=480, width=480)


par(mfrow =c(2,2)) #Four Graph 2*2 row wise

#Plot1
plot(dat$DateTime, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#Plot2 
plot(dat$DateTime, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Plot3
plot_colors <- c("black","red","blue")
plot(dat$DateTime, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$DateTime,dat$Sub_metering_2, col = plot_colors[2])
lines(dat$DateTime,dat$Sub_metering_3, col = plot_colors[3])
l_text <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",l_text,col = plot_colors, cex = .5 ,lty = 1 , bty ="n")
#Plot4
plot(dat$DateTime, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()