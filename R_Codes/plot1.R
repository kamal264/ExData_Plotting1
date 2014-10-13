library(sqldf)
#To read the selected Rows
dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file
                    WHERE Date IN ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)



dat$Global_active_power= as.numeric(as.character(dat$Global_active_power))

png(filename="plot1.png", height=480, width=480)

hist(dat$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(killowats)",col = "red")

dev.off()
  