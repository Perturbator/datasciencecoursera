# Questions 1 and 2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/housingID.csv", method = "curl")

dateDownloaded <- date()

housingData <- read.csv("./data/housingID.csv")

sum(housingData$VAL==24, na.rm=TRUE)

# Question 3
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl2, destfile = "./data/natural_gas.xlsx", method="curl")
library(xlsx)
dat <- read.xlsx("./data/natural_gas.xlsx", sheetIndex=1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext, na.rm=T) 

# Question 4
fileUrl3 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
library(XML)
balRest <- xmlTreeParse(fileUrl3, useInternal=TRUE)
rootNode <- xmlRoot(balRest)
xmlName(rootNode)
names(rootNode)
length(xpathSApply(rootNode, "//row[zipcode=21231]",xmlValue))

# Question 5
library(data.table)
fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl5, destfile = "./data/IDhousing.csv", method="curl")
DT <- fread("./data/IDhousing.csv")
system.time(DT[,mean(pwgtp15),by=SEX])
