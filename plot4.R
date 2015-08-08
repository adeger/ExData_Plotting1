# Routines to draw plot4 for Exploratory Data Analysis

v_vs_dt <- function(df){
    # plot voltage time series graph
    plot(df$Date_Time, df$Voltage, type="l", ylab="Voltage", xlab="datetime",
            col="black")
}

grp_vs_dt <- function(df){
    # plot global reactive power time series graph
    plot(df$Date_Time, df$Global_reactive_power, 
            type="l", ylab="global_reactive_power", xlab="datetime",
            col="black")
}

plot4_all4 <- function(){
    source("plot_utils.R")
    source("plot2.R")
    source("plot3.R")
    par(mfrow=c(2,2))
    df <- read_limited(dl())
    plot2(FALSE)
    v_vs_dt(df)
    plot3(FALSE)
    grp_vs_dt(df)
}

plot4 <- function(dest="plot4.png"){
    # Plot the four graphs shown in example plot 4
    wrap_plot(plot4_all4, list(), dest, c(2,2))
}
