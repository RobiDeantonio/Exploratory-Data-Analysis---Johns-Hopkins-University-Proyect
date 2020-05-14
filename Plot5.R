library(plyr)
library(ggplot2)


unzip("./ExploratoryDataAnalysis/Proyect2/exdata_data_NEI_data.zip",
      exdir = "./ExploratoryDataAnalysis/Proyect2/")

DataNEI <- readRDS("./ExploratoryDataAnalysis/Proyect2/summarySCC_PM25.rds")

EmissMotor <- ddply(DataNEI[DataNEI$fips == "24510" & DataNEI$type == "ON-ROAD",],
               .(type, year), summarize, TotalEmissions = sum(Emissions))

png(filename = "./ExploratoryDataAnalysis/Proyect2/Plot5.png", width=480, height=480, units="px")
ggplot(EmissMotor, aes(year, TotalEmissions)) + geom_line(color = "green") + geom_point() +
  labs(title = "Total Emissions from Motor Vehicles in Baltimore City", x = "Year",
       y = "Total Emissions")
dev.off()

