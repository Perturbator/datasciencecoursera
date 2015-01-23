add2 = function(x, y) {
    x + y
}

above10 = function(x) {
    use = x > 10
    x[use]
}

above = function(x, n = 10) {
    use = x > n
    x[use]
}

columnMean = function(y, removeNA = TRUE) {
    numCols = ncol(y)
    means = numeric(numCols)
    for (i in 1:numCols) {
        means[i] = mean(y[,i])
    }
    means
}