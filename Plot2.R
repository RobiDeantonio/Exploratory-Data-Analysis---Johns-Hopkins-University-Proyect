

unzip("./ExploratoryDataAnalysis/Proyect2/exdata_data_NEI_data.zip",
      exdir = "./ExploratoryDataAnalysis/Proyect2/")

DataNEI <- readRDS("./ExploratoryDataAnalysis/Proyect2/summarySCC_PM25.rds")
BaltData <- DataNEI[DataNEI$fips == "24510", ]

totalEmissionsBalt <- aggregate(BaltData$Emissions, list(BaltData$year), FUN = "sum")

png(filename = "./ExploratoryDataAnalysis/Proyect2/Plot2.png", width=480, height=480, units="px")
plot(totalEmissionsBalt, type = "b", pch = 14, col = "green", xlab = "Year",
     main = expression('Total PM'[2.5]*" Emissions in Baltimore City, Maryland from 1999 to 2008"),
     ylab = expression('Total PM'[2.5]*" Emission (in tons)"))
dev.off()
