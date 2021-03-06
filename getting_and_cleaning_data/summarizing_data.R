# Summarizing data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/restaurants.csv", method="curl")
restData <-read.csv("./data/restaurants.csv")

head(restData, n=3)
tail(restData, n=3)

# Make summary
summary(restData)
str(restData)

quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict, probs= c(.5,.75,.9))


# make table
table(restData$zipCode, useNA="ifany")

table(restData$councilDistrict, restData$zipCode)
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))

all(restData$zipCode > 0)

colSums(is.na(restData))
all(colSums(is.na(restData))==0)

table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))

restData[restData$zipCode %in% c("21212","21213"),]

data()
data(UCBAAdmissions)
