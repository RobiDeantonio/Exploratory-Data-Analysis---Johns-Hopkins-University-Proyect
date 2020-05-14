library(plyr)
library(ggplot2)


unzip("./ExploratoryDataAnalysis/Proyect2/exdata_data_NEI_data.zip",
      exdir = "./ExploratoryDataAnalysis/Proyect2/")

DataNEI <- readRDS("./ExploratoryDataAnalysis/Proyect2/summarySCC_PM25.rds")
classifCode <- readRDS("./ExploratoryDataAnalysis/Proyect2/Source_Classification_Code.rds")

Coal <- classifCode[grep("Comb.*Coal", classifCode$Short.Name), "SCC"]
CoalNEI <- DataNEI[DataNEI$SCC %in% Coal, ]

tEmissionsCoal <- ddply(CoalNEI, .(year), summarise, TotalEmissions = sum(Emissions))

png(filename = "./ExploratoryDataAnalysis/Proyect2/Plot4.png", width=480, height=480, units="px")
ggplot(tEmissionsCoal, aes(year, TotalEmissions)) + geom_line(color = "red") + geom_point() +
  labs(title = "Total Emissions from Coal Combustion-Related Sources", x = "Year",
       y = "Total Emissions")
dev.off()

