# Intro to dplyr
library(dplyr)
chicago <- readRDS("data/chicago.rds")
head(chicago)
dim(chicago)
str(chicago)
names(chicago)
head(select(chicago, city:dptp))
head(select(chicago,-(city:dptp)))

# filter subsets rows based on conditions
chic.f <- filter(chicago, pm25tmean2> 30 & tmpd > 80)
head(chic.f)

# arrange reoerders rows based on values of a column
chicago <- arrange(chicago, date)
head(chicago)
tail(chicago)
chicago <- arrange(chicago, desc(date))
head(chicago)

# rename
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
head(chicago)

# mutate
chicago <- mutate(chicago, pm25detrend = mean(25-mean(pm25, na.rm = TRUE)))

# group_by
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd >80), labels = c("cold","hot")))
summarize(chicago, pm25 = mean(pm25))

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
