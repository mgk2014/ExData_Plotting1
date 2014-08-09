
# read_power_data
# Coursera - course 4, Project 1
# Exploratary Data Analysis
# student: mgk2010
# github URL - https://github.com/mgk2014/ExData_Plotting1
#
# purpose: this script is a helper script, meant to be included in each of the R scripts that
#   create the plot. this script includes the common functions to download and unzip the data files
#   if they do not exist. Once files are available, the script reads in the records for cases where date is 
#   meansure meant date is Feb 1, 2007 or Feb 2, 2007
#   The script uses the sqldf (for data-set filtering) and lubridate packages (for date conversions)
#

# Required packages
require(lubridate)
require(sqldf)

srcFile <- "./data/household_power_consumption.txt"
srcData <- "./data/household_power_consumption.zip"
srcDataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## get_power_data()
#       The function looks for the source data file and the zip files in the current working directory
#       If the files does not exist, the function downloads the zip file in the current working directory
#       and unzips it. 
#       Once unzipped, the function reads the file using the sqldf package. This has been done to select
#       the measurements for Feb 1/2, 2007.
#       
#   parameters: none
#
#   returns: selected power measurement entries, NULL in case of any errors
#
get_power_data <- function(...){
    
    # download and unzip source data in case it does not exist
    print("validating if data-set exists in current working directory...")
    if (!file.exists(srcFile)) {
        if (!file.exists(srcData)){
            if(!file.exists("data")) dir.create("data")
            print("downloading data set...")
            download.file(srcDataUrl, srcData, method="curl")
        }
        print("unzipping data set...")
        unzip(srcData, exdir = "./data")
    }

    # Read selected power data using a SQL query, using sql df package
    print("reading data-set...")                        # DEBUGGING
    powerData <- read.csv.sql(srcFile,sep=";",sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')
    format(object.size(powerData), units = "Mb")     # DEBUGGING

    # Close all open file and SQL connections
    print("closing unused file connections...")         # DEBUGGING
    closeAllConnections()
    gc()

    # merge date time columns
    print("fixing date column...")                        # DEBUGGING
    powerData$NewDateTime <- paste(powerData$Date, powerData$Time)
    
    # change the format of the date / time columns. this will be used when plotting
    powerData$NewDateTime <- strptime(powerData$NewDateTime, "%d/%m/%Y %H:%M:%S")

    print(paste("no of rows in power data", nrow(powerData)))  # DEBUGGING

    # return power data?
    powerData
}

## test(): test function
#   Function provides a test script to set the working diretory and execute the script
#
test <- function()
{
    #Set working folder to where the files are expected.  
    # Run the main script
    
    # clear all variables
    rm(list = ls())
    
    curTime <- Sys.time()                               
    powerData <- get_power_data();
    print(paste("time taken to execute the function read_power_data", Sys.time() - curTime))                 # DEBUGGING
    print("Summary of selected power data")
    print(summary(powerData));
}


