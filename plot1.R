# Routine to draw plot1 for Exploratory Data Analysis

plot1 <- function(dest="plot1.png"){
    # Draw the first plot for Exploratory Data Analysis, Project #1
   
    source("plot_utils.R")
    df <- read_limited(dl())
    par(mfrow=c(1,1), mfcol=c(1,1))
    args = list(x=df$Global_active_power, xlab="Global Active Power", 
                main="Global Active Power", col="red")
    wrap_plot(hist, args, dest)
}
