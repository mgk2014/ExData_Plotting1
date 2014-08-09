# plot4.R
# Coursera - course 4, Project 1
# Exploratary Data Analysis
# student: mgk2010
# github URL - https://github.com/mgk2014/ExData_Plotting1
#
# purpose: create plot 4 for the assignment. This plot leverages the common source
#       helper script to read data-set filter it for the selected dates
#

# source the helper script
source("read_power_data.R")

# get the subset power data
selectedPowerData <- get_power_data();

# open a PNG device
png(file = "plot4.png", width = 500, height = 500, units = 'px')

# create the plot

# set the output to be a 2 X 2 matrix of plots
par(mfrow = c(2,2))


# plot 1
with(selectedPowerData, plot(NewDateTime, Global_active_power, pch = ".",
                             ylab = "Global Active Power",
                             xlab = ""))
lines(selectedPowerData$NewDateTime,selectedPowerData$Global_active_power )


# plot 2
with(selectedPowerData, plot(NewDateTime, Voltage, pch = ".",
                             ylab = "Voltage",
                             xlab = "datetime"))
lines(selectedPowerData$NewDateTime,selectedPowerData$Voltage )


# plot 3
with(selectedPowerData, {
    plot(NewDateTime, Sub_metering_1, pch = "-", type="n", ylab = "Energy Sub Metering", xlab = "")
    lines(NewDateTime,Sub_metering_1, col = "black")
    lines(NewDateTime,Sub_metering_2, col = "red" )
    lines(NewDateTime,Sub_metering_3, col = "blue" )
    legend("topright", pch = "-", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})


# plot 4
with(selectedPowerData, plot(NewDateTime, Global_reactive_power, pch = ".",
                             ylab = "Global Reactive Power",
                             xlab = "datetime"))
lines(selectedPowerData$NewDateTime,selectedPowerData$Global_reactive_power )

# write the file
dev.off()


