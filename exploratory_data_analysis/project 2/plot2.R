# load data
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
ssc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(dplyr)

data <- filter(nei, fips == 24510) %>%
    group_by(year) %>%
    summarize(total_pollution = sum(Emissions))

png("plot2.png", bg="transparent")
barplot(data$total_pollution/1000,
        names.arg = data$year,
        xlab = "Year",
        ylab = "PM2.5 Emissions (kilotons)",
        main = "Total PM2.5 Emissions in Baltimore")
dev.off()
