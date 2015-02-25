# load data
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
ssc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(dplyr)

# filter by vehicles
vehicles <- grepl("vehicles", scc$EI.Sector, ignore.case=TRUE)
vehicles_scc <- scc[vehicles,]$SCC

vehicles_nei <- filter(nei, SCC %in% vehicles_scc, fips == 24510) %>%
    group_by(year) %>%
    summarize(vehicle_pollution = sum(Emissions))

png("plot5.png", bg="transparent")
barplot(vehicles_nei$vehicle_pollution,
        names.arg = vehicles_nei$year,
        xlab = "Year",
        ylab = "PM2.5 from motor vehicles (tons)",
        main = "Vehicle PM2.5 Emissions in Baltimore")
dev.off()
