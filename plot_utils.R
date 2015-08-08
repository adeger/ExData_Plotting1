#require(dplyr)
#require(lubridate)

dl <- function () {
    # download, unzip household_power_consumption zip file and return name of csv file 

    datafile <- "household_power_consumption.txt"
    if (!file.exists(datafile)){
        return(datafile)
    }

    destfile <- "household_pwr_consumption.zip"
    if (!file.exists(destfile)){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="wininet", 
            destfile=destfile)
        unzip(dfile)
        if (!file.exists(destfile)){
            stop(paste("Could not find datafile", datafile, "after download and unzip operations"))
        }
    }
    datafile
}


wrap_plot <- function(func, args, dest, plots=c(1,1)){
    # Run appropriate file output setup/teardown commands if plot output dest is file/character

    file_output <- FALSE
    if (is.character(dest)){
        file_output <- TRUE
        png(dest)
    }
    do.call(func, args)
    if (file_output){
        dev.off()
    }
}

read_limited <- function(datafile){
    # Return a dataframe of household power data for feb 01-02, 2007

    # Read in a row to get headers
    df_header <- read.csv(datafile, header=T, nrows=1, sep=";")
    name_vec <- names(df_header)

    # Read in rows "close to" the target dates with extras before/after to be sure
    df_data <- read.csv(datafile, header=F, stringsAsFactors=FALSE, skip=66630, sep=";", na.string="?", nrows=2950)
    names(df_data) <- name_vec

    df_data$Date_Time=strptime(paste(df_data$Date, df_data$Time), "%d/%m/%Y %X")

    # Return and filter exactly on target dates
    df_data[grep("(1|2)/2/2007", df_data$Date, perl=TRUE), ]
}
