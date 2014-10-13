#Part4


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
legend("topright",l_text,col = plot_colors, cex = .5 ,lty = 1)
#Plot4
plot(dat$DateTime, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
