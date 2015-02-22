# Merging data

# Peer review data
if(!file.exits("./data")){dir.create("./data")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews = read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")

head(reviews,2)
head(solutions,2)

# Merging data - merge()
names(reviews)
names(solutions)

mergedData = merge(reviews, solutions, by.x="solution_id",by.y="id",all=TRUE)
head(mergedData)
