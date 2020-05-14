library(plyr)
library(ggplot2)
library(scales)

unzip("./ExploratoryDataAnalysis/Proyect2/exdata_data_NEI_data.zip",
      exdir = "./ExploratoryDataAnalysis/Proyect2/")

DataNEI <- readRDS("./ExploratoryDataAnalysis/Proyect2/summarySCC_PM25.rds")

BaltData <- DataNEI[(DataNEI$fips=="24510"), ]
BaltData <- aggregate(Emissions ~ year, data = BaltData, FUN = sum)
losAngelesData <- DataNEI[(DataNEI$fips=="06037"),]
losAngelesData <- aggregate(Emissions ~ year, data = losAngelesData, FUN = sum)
BaltData$County <- "Baltimore"
losAngelesData$County <- "Los Angeles"
Data <- rbind(BaltData, losAngelesData)

png(filename = "./ExploratoryDataAnalysis/Proyect2/Plot6.png", width=480, height=480, units="px")
ggplot(Data, aes(x=factor(year), y=Emissions, fill=County)) + geom_bar(aes(fill = County),
  position = "dodge", stat="identity") + labs(x = "Year") + 
  labs(y = expression("Total Emissions (in log scale) of PM"[2.5])) +
  xlab("year") + ggtitle(expression("Motor vehicle emission in Baltimore and Los Angeles")) +
  scale_y_continuous(trans = log_trans())
dev.off()

