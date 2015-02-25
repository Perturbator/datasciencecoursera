# load data
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
ssc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(dplyr)

# find only coal and combustion in SCC
combustion <- grepl("comb", scc$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", scc$SCC.Level.Four, ignore.case=TRUE) 
combustion_and_coal <- combustion & coal
combustion_scc <- scc[combustion_and_coal,]$SCC

cc_nei <- filter(nei, SCC %in% combustion_scc) %>%
    group_by(year) %>%
    summarize(cc_Emissions = sum(Emissions))

png("plot4.png", bg="transparent")
barplot(cc_nei$cc_Emissions/10^5,
        names.arg = cc_nei$year,
        xlab = "Year",
        ylab = "PM2.5 (10,000 tons)",
        main = "Coal Combustion PM2.5 Emissions in US")
dev.off()
