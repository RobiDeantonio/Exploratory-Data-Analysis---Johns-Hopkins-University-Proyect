

unzip("./ExploratoryDataAnalysis/Proyect2/exdata_data_NEI_data.zip",
      exdir = "./ExploratoryDataAnalysis/Proyect2/")

DataNEI <- readRDS("./ExploratoryDataAnalysis/Proyect2/summarySCC_PM25.rds")

ClassifCode <- readRDS("./ExploratoryDataAnalysis/Proyect2/Source_Classification_Code.rds")

png(filename = "./ExploratoryDataAnalysis/Proyect2/Plot1.png", width = 480, height = 480, units = "px")

totalEmissions <- aggregate(DataNEI$Emissions, list(DataNEI$year), FUN = "sum")

plot(totalEmissions, type = "b", pch = 19, col = "red", xlab = "Year", main = expression('PM'[2.5]*" Emissions in the US from 1999 to 2008"), ylab = expression('Total PM'[2.5]*" Emission (in tons)"))
dev.off()
