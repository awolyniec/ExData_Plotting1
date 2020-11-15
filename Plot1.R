householdPowerConsumption <- read.table(
  "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset to only the dates 2007-02-01 and 2007-02-02 (in D/M/Y format)
householdPowerConsumption <- householdPowerConsumption[
  householdPowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),
]

png(filename = "plot1.png")
hist(
  householdPowerConsumption$Global_active_power,
  freq = TRUE,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)
dev.off()