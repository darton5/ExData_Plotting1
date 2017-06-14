#The following code was used to create the graph in plot2.png

#This script requires the dplyr package to be installed, otherwise it will not work

#For this script to work the zip file that contains the dataset must be present in the working directoty

#The zip file can be downloaded from https://github.com/rdpeng/ExData_Plotting1 and is in the README.md file
#on this page
library(dplyr)
house <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
#This reads the data set into R and loads the dplyr package ready to be used in the next step

dates <- house$Date
feb_house <- house[dates == "1/2/2007" | dates == "2/2/2007",]
feb_house <- mutate(feb_house, Date_Time = paste(feb_house$Date, feb_house$Time))
#This extracts the data from the 1st and 2nd of Febuary 2007 and adds a new column containg both the
#date and the time of the observations, which is used in the plot below

png(filename = "plot2.png", width = 480, height = 480)
plot(strptime(feb_house$Date_Time, format = "%d/%m/%Y %H:%M:%S"), as.numeric(feb_house$Global_active_power),
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
#This creates the plot2.png file