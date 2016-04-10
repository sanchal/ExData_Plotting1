create_plot4 <- function()
{
        #read the file with the data downloaded        
        dtPower <- read.table("household_power_consumption.txt", header=T, sep=";" , stringsAsFactors = FALSE)
        
        #we are only interested in data between 2007-02-01 and 2007-02-02 , subset this data.
        dtPowerSs <- subset(dtPower, as.Date(as.character(Date),"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(as.character(Date),"%d/%m/%Y") <= as.Date("2007-02-02") )
        
        #add a new column with the date and time values combined
        dtPowerSs$DateTime <- strptime(paste(dtPowerSs$Date, dtPowerSs$Time), format =  "%d/%m/%Y %H:%M:%S")
        
        #open the png device driver with the filename and dimensions set to 480 X 480
        png(file="plot4.png",width=480,height=480)
        
        #make the plotting area 2 rows and 2 columns
        par(mfrow = c(2,2))
        
        #plot the first graph
        with(dtPowerSs,plot(DateTime,Global_active_power, type = "l" , main = "" , ylab = "Global Active Power" , xlab = ""))
        
        #plot the second graph
        with(dtPowerSs,plot(DateTime,Voltage, type = "l" , main = "" , ylab = "Voltage" , xlab = "datetime"))
     
        #plot the third graph and then add the lines and the legend
        plot(dtPowerSs$DateTime,dtPowerSs$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(dtPowerSs$DateTime,dtPowerSs$Sub_metering_2,col="red")
        lines(dtPowerSs$DateTime,dtPowerSs$Sub_metering_3,col="blue")
        
        #set box.lwd = 0 to remove the box to match what is in the assignment..
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), box.lwd = 0)
        
        #plot the fourth graph
        with(dtPowerSs,plot(DateTime,Global_reactive_power, type = "l" , main = "" ,  xlab = "datetime"))
        
        dev.off()
}