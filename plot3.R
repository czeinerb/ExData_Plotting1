########################
# Exploratory Data Analysis - Course Project 1
# https://class.coursera.org/exdata-030
# plot3

## folder of the data source 
## plot will be saved here
getwd()

## read and prepare data
data <- read.csv("household_power_consumption.txt"
                 # , colClasses = "character"
                 , sep = ";", na.strings = "?"
                 , skip = 66637, nrows = (69518 - 66637), header = FALSE)

data_header <- read.csv("household_power_consumption.txt"
                        # , colClasses = "character"
                        , sep = ";", na.strings = "?"
                        , nrows = 1, header = TRUE)
colnames(data) <- colnames(data_header)
rm(data_header)

data <- cbind(data, time = with(data,strptime(paste(Date,Time), "%d/%m/%Y %H:%M")))

## prepare and save output as plot3.png
png("plot3.png", width = 480, height = 480, units = "px")
par(mar = c(5,5,2,2))
with(data, plot(time, Sub_metering_1
                , xlab = ""
                , ylab = "Energy sub metering"
                ,type="n"))
with(data, lines(time, Sub_metering_1, col = "black"))
with(data, lines(time, Sub_metering_2, col = "red"))
with(data, lines(time, Sub_metering_3, col = "blue"))
legend("topright", lwd=1, col = c("black", "blue", "red")
       , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() 

rm(data)
