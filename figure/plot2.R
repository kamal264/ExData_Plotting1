# Part 2

#Adding Date Time column in Data Frame
dat["DateTime"] <- NA

dat$DateTime <- strptime(paste(as.character(dat$Date), dat$Time), format = "%d/%m/%Y %H:%M:%S")

plot(dat$DateTime, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

