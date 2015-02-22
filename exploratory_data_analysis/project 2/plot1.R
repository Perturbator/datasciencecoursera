# load data
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(dplyr)

png("plot1.png", bg="transparent")
by_year_total <-  group_by(nei, year) %>%
    summarize(total_pollution = sum(Emissions))
barplot(by_year_total$total_pollution/10^6,
        names.arg = by_year_total$year,
        xlab = "Year",
        ylab = "PM2.5 Emissions (megatons)",
        main = "Total PM2.5 Emissions")
dev.off()
