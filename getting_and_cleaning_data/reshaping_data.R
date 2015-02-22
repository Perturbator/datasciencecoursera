# Reshaping Data
library(reshape2)
head(mtcars)

# Melting Data  (pass df to melt, tell whats id and what measure -> creates id
# variables and melt all the rest of the values) 
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname","gear","cyl"), measure.vars=c("mpg","hp"))

head(carMelt)
tail(carMelt)

# Casting data frame
cylData <- dcast(carMelt, cyl ~ variable) # see cylinders broken down by the diff vars
cylData

cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

# Averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

# Another way - split
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns
sprCount = lapply(spIns,sum)
sprCount

unlist(sprCount)
sapply(spIns,sum)

# another way - plyr
ddply(InsectSprays,.(spray), summarise, sum=sum(count))

spraySums<-ddply(InsectSprays,.(spray),summarise,sum=ave(count,FUN=sum))
dim(spraySums)
