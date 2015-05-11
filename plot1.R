df <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = c("?"), 
                 colClasses = c("character", "character", "numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))

if (!require(lubridate)) {
  install.packages("lubridate")
  library(lubridate)
}
df$Date_time <- dmy_hms(paste(df$Date, df$Time))
df$Date <- dmy(df$Date)
df <- df[df$Date %in% ymd("2007-02-01") | df$Date %in% ymd("2007-02-02"),]

# default size for png is 480x480
png("plot1.png")
hist(df$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
