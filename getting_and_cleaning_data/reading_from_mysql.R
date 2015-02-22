# Connecting and listing Databases
library(RMySQL)
ucscDb <- dbConnect(MySQL(), user="genome",
                    host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb)

# Connecting to hg19 and listing tables
hg19 <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

# Get Dimensions of a Specific Table
dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "SELECT COUNT * FROM affy133Plus2;")

# read from table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

# select a specific subset
query <- dbSendQuery(hg19, "SELECT * FROM affyU133Plus2 WHERE misMatches BETWEEN 1 AND 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
affyMisSmall <- fetch(query,n=10); dbClearResult(query)
dim(affyMisSmall)
dbDisconnect(hg19)
