# Part 3

#Plot 3 with colors and Adding lines
plot_colors <- c("black","red","blue")

plot(dat$DateTime, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$DateTime,dat$Sub_metering_2, col = plot_colors[2])
lines(dat$DateTime,dat$Sub_metering_3, col = plot_colors[3])
l_text <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",l_text,col = plot_colors, lty = 1)

