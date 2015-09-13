# Purpose:  re-create Plot 2 in the first project, saving it as a .png.
#
# libraries we want
library(dplyr)
library(tidyr)
library(lubridate)
library(ggplot2)

# what directory are we in?
# currDir <- getwd()
# print(currDir)

# the date range we care about
minDate <- ymd("2007-02-01")
maxDate <- ymd("2007-02-02")

# location of the data file.
file_name<-"exdata-data-household_power_consumption/household_power_consumption.txt"

# read the data file and convert into a dplyr table.
power_data<-read.table(file_name, header = TRUE, sep=";", na.strings = "?")
power_data_tbl<-tbl_df(power_data)

# convert date fields to actually be dates.
power_data_tbl<-mutate(power_data_tbl, DateTime = dmy_hms(paste(Date, Time)))
power_chart_data_tbl <- filter(power_data_tbl, DateTime >= minDate & DateTime < maxDate + days(1) )

timeLine <- c()

png("plot2.png")
plot(power_chart_data_tbl$DateTime,
     power_chart_data_tbl$Global_active_power,
     type = "l",
     col = "black",
     main = "",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")


dev.off()

