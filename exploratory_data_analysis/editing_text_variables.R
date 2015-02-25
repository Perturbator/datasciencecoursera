if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv",method="curl")
cameraData <-read.csv("./data/cameras.csv")
names(cameraData)

tolower(names(cameraData))

# fixing character vectors - strsplit()
splitNames = strsplit(names(cameraData), "\\.")
splitNames

# Fixing character vectors - sapply()
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

# gsub
testName <- "this_us_a_test"
sub("_","",testName)
gsub("_","",testName)

# Finding values - grep(), grepl()
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))

cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]

# More useful string functions
library(stringr)
nchar("John Bobo")
substr("John Bobo",1,4)
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")
str_trim("John      ")
