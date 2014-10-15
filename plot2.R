## Course Assignment 1: plot2.R

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
png(filename="plot2.png", height=480, width=480)

plot(dat$DateTime, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()