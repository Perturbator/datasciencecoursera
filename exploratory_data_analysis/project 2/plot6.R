# load data
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
ssc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(dplyr)

vehicles <- grepl("vehicles", scc$EI.Sector, ignore.case=TRUE)
vehicles_scc <- scc[vehicles,]$SCC

vehicles_nei <- filter(nei, SCC %in% vehicles_scc, is.element(fips, c("06037", "24510"))) %>%
    group_by(fips,year) %>%
    summarize(vehicle_pollution = sum(Emissions))

#This is just for the facet labels on the graph
vehicles_nei$fips <- c(rep(c("LA","Baltimore"), each = 4))

png("plot6.png", width = 480*1.5, bg="transparent")
qplot(as.character(year), data = vehicles_nei, weight = vehicle_pollution/1000, 
      geom="histogram", facets = .~fips, ylab = "PM2.5 Emissions (kilotons)",
      xlab = "Year", main = "Vehicle Pollution") 
dev.off()
