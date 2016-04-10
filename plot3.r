create_plot3 <- function()
{
      #read the file with the data downloaded        
      dtPower <- read.table("household_power_consumption.txt", header=T, sep=";" , stringsAsFactors = FALSE)
      
      #we are only interested in data between 2007-02-01 and 2007-02-02 , subset this data.
      dtPowerSs <- subset(dtPower, as.Date(as.character(Date),"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(as.character(Date),"%d/%m/%Y") <= as.Date("2007-02-02") )
      
      #add a new column with the date and time values combined
      dtPowerSs$DateTime <- strptime(paste(dtPowerSs$Date, dtPowerSs$Time), format =  "%d/%m/%Y %H:%M:%S")
     
      #open the png device driver with the filename and dimensions set to 480 X 480
      png(file="plot3.png",width=480,height=480)
      
      #plot the graph with the Sub_metering_1 variable
      plot(dtPowerSs$DateTime,dtPowerSs$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering" , col = "black" )
      
      #add the Sub_metering_2 red line
      lines(dtPowerSs$DateTime,dtPowerSs$Sub_metering_2,col="red")
      
      #add the Sub_metering_3 blue line
      lines(dtPowerSs$DateTime,dtPowerSs$Sub_metering_3,col="blue")
      
      #add the legend
      legend("topright" , c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col=c("black","red","blue") ,cex = 1  , lty = c(1,1,1) )
      
      dev.off()

}