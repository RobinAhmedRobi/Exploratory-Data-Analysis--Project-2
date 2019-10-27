library("data.table")
path <- getwd()
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]
clrs <- c("red", "green", "blue", "yellow")


totalNEI <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]


total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))

png(filename='plot1.png')

barplot(
        height=total.emissions$Emissions/1000, 
        names.arg=total.emissions$year,
        xlab="years",
        ylab=expression('total PM'[2.5]*' emission in kilotons'),
        ylim=c(0,8000),
        main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),
        col=clrs)

dev.off()
