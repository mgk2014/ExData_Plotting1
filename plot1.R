# plot1.R
# Coursera - course 4, Project 1
# Exploratary Data Analysis
# student: mgk2010
# github URL - https://github.com/mgk2014/ExData_Plotting1
#
# purpose: create plot 1 for the assignment. This plot leverages the common source
#       helper script to read data-set filter it for the selected dates
#

# source the helper script
source("read_power_data.R")

# get the subset power data
selectedPowerData <- get_power_data();


# open a PNG device
png(file = "plot1.png")

# create the plot
with(selectedPowerData, hist(Global_active_power, col="red", 
                             xlab = "Global Active Power (kilowatts)",
                            main = "Global Active Power"))

# write the file
dev.off()


