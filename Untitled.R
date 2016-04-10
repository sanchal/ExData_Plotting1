dtPower <- read.table("household_power_consumption.txt", header=T, sep=";" , stringsAsFactors = FALSE)
dtPowerSs <- subset(dtPower, as.Date(as.character(Date),"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(as.character(Date),"%d/%m/%Y") <= as.Date("2007-02-02") )
dtPowerSs$DateTime <- strptime(paste(dtPowerSs$Date, dtPowerSs$Time), format =  "%d/%m/%Y %H:%M:%S")
with(dtPowerSs,plot(DateTime,Global_active_power, type = "l"))
