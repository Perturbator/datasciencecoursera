# K-means Clustering
## partitioning approach
#-- fix number of clusters
#-- get centroids of each cluster
#-- assign things to closest centroid
#-- recalculate centroids
## Requires
#-- metric
#-- number of clusters
#-- initial guess as to cluster centroids
## Produces
#-- Final estimate of cluster centroids
#-- An assignment of each point to clusters

set.seed(1234)
par(mar = c(2,2,2,2))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + .05, y + .05, labels = as.character(1:12))

# kmeans()
dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
kmeansObj$cluster

plot(x,y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col=1:3, pch = 3, cex = 3, lwd = 3)

# Heatmaps

dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1,2))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")









