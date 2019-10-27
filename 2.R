##library("data.table")
##path <- getwd()
##SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
##NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
##NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]
##clrs <- c("red", "green", "blue", "yellow")

totalNEI <- NEI[fips=='24510', lapply(.SD, sum, na.rm = TRUE)
                , .SDcols = c("Emissions")
                , by = year]

png(filename='plot2.png')

barplot(totalNEI[, Emissions]
        , names = totalNEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = expression("Emissions over the Years"), col = clrs)

dev.off()
