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

## make plot
plotPlot2 <- function() {
  plot(
    householdPowerConsumption$DateTime,
    householdPowerConsumption$Global_active_power,
    type = "l",
    ylab = "Global active power (kilowatts)",
    xlab = ""
  )
}

png(filename = "plot2.png")
plotPlot2()
dev.off()