# Draw the third plot for Exploratory Data Analysis, Project #1

plot_all_series_for3 <- function(){
    # helper function to make calling wrap_plot easier
    source("plot_utils.R")
    df <- read_limited(dl())
    plot(df$Date_Time, df$Sub_metering_1, 
            type="l", ylab="Energy sub metering", xlab="",
            col="black")
    points(df$Date_Time, df$Sub_metering_2, t="l", col="red")
    points(df$Date_Time, df$Sub_metering_3, t="l", col="blue")
    leg <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", leg, lty=1, col=c("black", "red", "blue"))
}

plot3 <- function(dest="plot3.png"){
    # draw plot3

    wrap_plot(plot_all_series_for3, list(), dest)
}
