# Subsetting and sorting

set.seed(134535)
X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X <- X[sample(1:5),]
X$var2[c(1,3)] = NA
X

X[,1] # subset a specific column (just the first)
X[,"var1"] # subset var1 column
X[1:2,"var2"] # subset on rows and columns

X[(X$var1 <= 3 & X$var3 > 11),] # can use conditions

# Dealing with missing values
X[which(X$var2 > 8),] # return indices where var2 > 8 doesnt return NAs
sort(X$var1)
sort(X$var1, decreasing=TRUE)

X[order(X$var1),] # order dataframe by values of a particular variable
X[order(X$var1,X$var3),] # var3 is tie-breaker

library(plyr)
arrange(X, var1)
arrange(X,desc(var1))
X$var4 <- rnorm(5)

Y <- cbind(X, rnorm(5))

data(UCBAdmissions)
df= as.data.frame(UCBAdmissions)
summary(df)

xt <- xtabs(Freq ~ Gender + Admit, data=df) # cross tabs
xt
data(warpbreaks)
warpbreaks$replicate <- rep(1:9, len= 54)
xt = xtabs(breaks ~., data=warpbreaks)
xt

ftable(xt)

fakeData = rnorm(1e5)
print(object.size(fakeData), units="Mb")
