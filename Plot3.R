library(plyr)
library(ggplot2)


unzip("./ExploratoryDataAnalysis/Proyect2/exdata_data_NEI_data.zip",
      exdir = "./ExploratoryDataAnalysis/Proyect2/")

DataNEI <- readRDS("./ExploratoryDataAnalysis/Proyect2/summarySCC_PM25.rds")
BaltData <- DataNEI[DataNEI$fips == "24510", ]

totalEmissionsBalt <- ddply(BaltData, .(type, year), summarize, TotalEmissions = sum(Emissions))

png(filename = "./ExploratoryDataAnalysis/Proyect2/Plot3.png", width=480, height=480, units="px")
ggplot(totalEmissionsBalt, aes(year, TotalEmissions, colour = type)) + geom_line() + geom_point() + 
  labs(title = expression('Total PM'[2.5]*" Emissions in Baltimore from 1999 to 2008"),
       x = "Year", y = expression('Total PM'[2.5]*" Emission (in tons)"))
dev.off()

