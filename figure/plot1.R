library(sqldf)
#To read the selected Rows
dat <- read.csv.sql("Data/household_power_consumption.txt", sql = "SELECT * from file
                    WHERE Date IN ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)



dat$Global_active_power= as.numeric(as.character(dat$Global_active_power))

hist(dat$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(killowats)",col = "red")
