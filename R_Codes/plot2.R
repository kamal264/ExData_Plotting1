# Part 2

#Adding Date Time column in Data Frame
dat["DateTime"] <- NA

dat$DateTime <- strptime(paste(as.character(dat$Date), dat$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", height=480, width=480)

plot(dat$DateTime, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()