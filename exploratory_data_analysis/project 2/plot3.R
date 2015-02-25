# load data
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(dplyr)

balt_type <- filter(nei, fips == 24510) %>%
    group_by(year,type) %>%
    summarize(Emissions = sum(Emissions))

library(ggplot2)

png("plot3.png", width = 480*3, bg="transparent")
qplot(type, data = balt_type, weight = Emissions/1000, 
      geom="histogram", facets = .~year, ylab = "PM2.5 Emissions (kilotons)",
      main = "Baltimore Pollution")
dev.off()
