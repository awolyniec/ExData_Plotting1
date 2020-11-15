library(dplyr)

householdPowerConsumption <- read.table(
  "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset to only the dates 2007-02-01 and 2007-02-02 (in D/M/Y format)
householdPowerConsumption <- householdPowerConsumption[
  householdPowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),
]

## create new DateTime column
householdPowerConsumption <- householdPowerConsumption %>%
  mutate(
    DateTime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
  )

## initialize plot
plotPlot3 <- function() {
  plot(
    householdPowerConsumption$DateTime,
    householdPowerConsumption$Sub_metering_1, ## will not be plotted
    type = "n",
    ylab = "Energy sub metering",
    xlab = ""
  )
  
  points(
    householdPowerConsumption$DateTime,
    householdPowerConsumption$Sub_metering_1,
    type = "l"
  )
  
  points(
    householdPowerConsumption$DateTime,
    householdPowerConsumption$Sub_metering_2,
    type = "l",
    col = "red"
  )
  
  points(
    householdPowerConsumption$DateTime,
    householdPowerConsumption$Sub_metering_3,
    type = "l",
    col = "blue"
  )
  
  legend(
    "topright",
    col = c("black", "blue", "red"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = 1
  )
}

png(filename = "plot3.png")
plotPlot3()
dev.off()