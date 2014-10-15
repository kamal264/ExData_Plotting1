## Course Assignment 1: plot1.R

#install.packages("sqldf");
library(sqldf);

#Import the range of interest from the datafile
datafile <- "./data/household_power_consumption.txt";
cls <- c(Global_active_power="numeric", Global_reactive_power="numeric", Voltage="numeric", Global_intensity="numeric");
dat <- read.csv.sql(datafile, sql = "SELECT * from file
                    WHERE Date IN ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE,colClasses =cls)


###open png to plot the graph
png(filename="plot1.png", height=480, width=480, units = "px")

hist(dat$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(killowats)",col = "red")

dev.off()
  