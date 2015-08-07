# Draw the first plot for Exploratory Data Analysis, Project #1

plot1 <- function(){
    source("plot_utils.R")
    df <- read_limited(dl())
    png("plot1.png")
    hist(df$Global_active_power, xlab="Global Active Power", main="Global Active Power", col="red")
    dev.off()
}
