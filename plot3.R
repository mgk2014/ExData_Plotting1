# plot3.R
# Coursera - course 4, Project 1
# Exploratary Data Analysis
# student: mgk2010
# github URL - https://github.com/mgk2014/ExData_Plotting1
#
# purpose: create plot 3 for the assignment. This plot leverages the common source
#       helper script to read data-set filter it for the selected dates
#

# source the helper script
source("read_power_data.R")

# get the subset power data
selectedPowerData <- get_power_data();

# open a PNG device
png(file = "plot3.png", width = 500, height = 500, units = 'px')

# create the plot
with(selectedPowerData, {
    plot(NewDateTime, Sub_metering_1, pch = "-", type="n", ylab = "Energy Sub Metering", xlab = "Day of the Week")
    lines(NewDateTime,Sub_metering_1, col = "black")
    lines(NewDateTime,Sub_metering_2, col = "red" )
    lines(NewDateTime,Sub_metering_3, col = "blue" )
    legend("topright", pch = "-", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})


# write the file
dev.off()


