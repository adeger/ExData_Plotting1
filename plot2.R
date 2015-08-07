# Draw the first plot for Exploratory Data Analysis, Project #1

plot2 <- function(){
    source("plot_utils.R")
    df <- read_limited(dl())
    png("plot2.png")
    plot(df$Date_Time, df$Global_active_power, type="l",
            ylab="Global Active Power (kilowatts)", xlab="",
            col="black")
    dev.off()
}
