# plot2.R
# Coursera - course 4, Project 1
# Exploratary Data Analysis
# student: mgk2010
# github URL - https://github.com/mgk2014/ExData_Plotting1
#
# purpose: create plot 2 for the assignment. This plot leverages the common source
#       helper script to read data-set filter it for the selected dates
#

# source the helper script
source("read_power_data.R")

# get the subset power data
selectedPowerData <- get_power_data();

# open a PNG device
png(file = "plot2.png")

# create the plot
with(selectedPowerData, plot(NewDateTime, Global_active_power, pch = ".",
                             ylab = "Global Active Power (kilowatts)",
                             xlab = ""))
lines(selectedPowerData$NewDateTime,selectedPowerData$Global_active_power )

# write the file
dev.off()


