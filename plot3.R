## Course Assignment 1: plot3.R

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

#Plot 3 with colors and Adding lines
plot_colors <- c("black","red","blue")

png(filename="plot3.png", height=480, width=480)

plot(dat$DateTime, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$DateTime,dat$Sub_metering_2, col = plot_colors[2])
lines(dat$DateTime,dat$Sub_metering_3, col = plot_colors[3])
l_text <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",l_text,col = plot_colors, lty = 1)

dev.off()
