library(tidyverse)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
E = as_tibble(read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors = FALSE, sep = ";"))
E$Date = as.Date(E$Date,"%d/%m/%Y")
E$Time = paste(E$Date,E$Time)
E$Time = as.POSIXct(as.character(E$Time),format="%Y-%m-%d %H:%M:%S")
check = as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")
E = E %>% filter(Date %in% check) %>% mutate(Global_active_power = as.numeric(as.character(Global_active_power)),
                                              Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                                             Voltage = as.numeric(as.character(Voltage)),
                                             Global_intensity = as.numeric(as.character(Global_intensity)),
                                             Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), 
                                             Sub_metering_2 = as.numeric(as.character(Sub_metering_2)), 
                                             Sub_metering_3 = as.numeric(as.character(Sub_metering_3))
)



#Plot 3 Code#
png("plot3.png",width = 625, height = 625)
plot(E$Time,E$Sub_metering_1,pch=NA,type="l",col="black",xlab = "",ylab="Energy Sub Metering")
lines(E$Time,E$Sub_metering_2,col="red")
lines(E$Time,E$Sub_metering_3,col="blue")
legend("topright", legend=colnames(E[,7:9]),lty=1,
       col=c("black","red", "blue"), cex=0.75)
dev.off()


  
