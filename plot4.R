########################
# Exploratory Data Analysis - Course Project 1
# https://class.coursera.org/exdata-030
# plot4

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

## prepare and save output as plot4.png

par(mfcol = c(2,2), mar = c(4.1,4.1,1,1))

### 1st 
with(data, plot(time, Global_active_power
                , xlab = ""
                , ylab = "Global Active Power"
                ,type="l", cex.lab = 0.8, cex.axis = 0.8
))

### 2nd
with(data, plot(time, Sub_metering_1
                , xlab = ""
                , ylab = "Energy sub metering"
                ,type="n", cex.lab = 0.8, cex.axis = 0.8))
with(data, lines(time, Sub_metering_1, col = "black"))
with(data, lines(time, Sub_metering_2, col = "red"))
with(data, lines(time, Sub_metering_3, col = "blue"))
legend("topleft", lwd=1, bty="n", cex = 0.8, inset = c(.4,0), col = c("black", "blue", "red")
       , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

### 3rd 
with(data, plot(time, Voltage
                , xlab = "datetime"
                , ylab = "Voltage"
                ,type="l", cex.lab = 0.8, cex.axis = 0.8
))

### 4th 
with(data, plot(time, Global_reactive_power
                , xlab = "datetime"
                , ylab = "Global Rective Power"
                ,type="l", cex.lab = 0.8, cex.axis = 0.8
))

dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")
dev.off() 

rm(data)