##library("data.table")
##path <- getwd()
##SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
##NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
##NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]
##clrs <- c("red", "green", "blue", "yellow")


baltimoreNEI <- NEI[fips=="24510",]

png("plot3.png")

ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()
