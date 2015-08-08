# Routine to draw plot2 for Exploratory Data Analysis

plot2 <- function(dest="plot2.png"){
    # Draw the second plot for Exploratory Data Analysis, Project #1
   
    source("plot_utils.R")
    df <- read_limited(dl())
    args = list(x=df$Date_Time, y=df$Global_active_power, type="l",
                ylab="Global Active Power (kilowatts)", xlab="",
                col="black")
    wrap_plot(plot, args, dest)
}
