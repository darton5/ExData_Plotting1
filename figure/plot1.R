#The following code was used to create the graph in plot1.png

#For this script to work the zip file that contains the dataset must be present in the working directoty

#The zip file can be downloaded from https://github.com/rdpeng/ExData_Plotting1 and is in the README.md file
#on this page

unzip("exdata_data_household_power_consumption.zip")
house <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
#this reads the data set into R

dates <- house$Date
feb_house <- house[dates == "1/2/2007" | dates == "2/2/2007",]
#this extracts the data for the 1st and 2nd of Febuary in 2007

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(feb_house$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
#this creates the plot1.png file in the working directory