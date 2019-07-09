library(tidyverse)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
E = as_tibble(read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors = FALSE, sep = ";"))
E$Date = as.Date(E$Date,"%d/%m/%Y")
check = as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")
E = E %>% filter(Date %in% check) %>% mutate(Global_active_power = as.numeric(as.character(Global_active_power)),
                                              Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                                             Voltage = as.numeric(as.character(Voltage)),
                                             Global_intensity = as.numeric(as.character(Global_intensity)),
                                             Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), 
                                             Sub_metering_2 = as.numeric(as.character(Sub_metering_2)), 
                                             Sub_metering_3 = as.numeric(as.character(Sub_metering_3))
)

#Plot 1 Code#
png("plot1.png",width = 625, height = 625)
with(E,hist(Global_active_power,col="red",
            xlab = "Global Active Power (kilowatts)",
            ylim = c(0,1200),main="Global Active Power"),par(yaxp  = c(0, 1200, 6)),cex=0.5)
dev.off()




  
