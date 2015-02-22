housing <- read.csv("data/housingID.csv")
library(plyr)
library(dplyr)
agricultureLogical <- housing$ACR == 3 & housing$AGS == 6
sum(agricultureLogical, na.rm=TRUE)
which(agricultureLogical)

library(jpeg)
pic <- readJPEG("data/jeff.jpg", native=TRUE)
quantile(pic,c(.3,.8))


edu <- read.csv("data/edCountry.csv")
edu <- rename(edu, cc = CountryCode)
edu <- select(edu, cc, Income.Group)

gdp <- read.csv("data/GDP.csv")
gdp <- rename(gdp, cc = X, name = X.2, GDP = X.3)
gdp <- select(gdp, cc, name, GDP)
gdp <- filter(gdp, !is.na(cc) &!is.na(GDP))
gdp <- filter(gdp, cc != "")

gdp_ed<-arrange(join(gdp,edu),cc)
gdp_ed<-filter(gdp_ed, !is.na(Income.Group) & GDP != ".." & Income.Group != "")
gdp_ed <- mutate(gdp_ed, GDP = as.numeric(gsub(",","",GDP)))
gdp_ed_sorted <- arrange(gdp_ed, desc(GDP))
gdp_ed_sorted <- mutate(gdp_ed_sorted, rank = 1:189)
g <- group_by(gdp_ed_sorted, Income.Group)
summarize(g, mean(rank), na.rm= TRUE)

library(Hmisc)
q <- cut2(gdp_ed_sorted$rank,g=5)
gc <- cbind(gdp_ed_sorted,q)
gc <- rename(gc, quant_range = q)
table(gc$Income.Group, gc$quant_range)
