create_plot1 <- function()
{
        #read the file with the data downloaded
        dtPower <- read.table("household_power_consumption.txt", header=T, sep=";" , stringsAsFactors = FALSE)
        
        #we are only interested in data between 2007-02-01 and 2007-02-02 , subset this data.
        dtPowerSs <- subset(dtPower, as.Date(as.character(Date),"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(as.character(Date),"%d/%m/%Y") <= as.Date("2007-02-02") )
 
        #convert the Global_active_power column to numeric for plotting
        dtPowerSs$Global_active_power <- as.numeric(as.character(dtPowerSs$Global_active_power))
        
        #open the png device driver with the filename and dimensions set to 480 X 480
        png(file="plot1.png",width=480,height=480)
        
        #plot the histogram
        hist(dtPowerSs$Global_active_power , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency" 
             , main = "Global Active Power" , col = "Red" )
       
        dev.off()
}
