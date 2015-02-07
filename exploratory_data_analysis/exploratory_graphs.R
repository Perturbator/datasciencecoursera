pollution <- read.csv("data/avgpm25.csv", colClasses=c("numeric","character",
                                "factor","numeric","numeric"))
head(pollution)

# One dimension
summary(pollution$pm25)
boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green")
rug(pollution$pm25)
abline(v=12, lwd=2)
abline(v=median(pollution$pm25), col="magenta", lwd=4)

barplot(table(pollution$region), col = "wheat")

# two dimensions
boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

with(pollution, plot(latitude, pm25, col = region))
abline(h=12,lwd=2,lty = 2, col = "red")
