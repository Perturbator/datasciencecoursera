library(lattice)
library(datasets)
## Simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

## Convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

# Lattice Behavior
p <- xyplot(Ozone ~ Wind, data = airquality) ## Nothing happens!
print(p)

# Lattice Panel Functions
set.seed910)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x + rnorm(100, sd=.5)
f <- factor(f, lavels = c("Group 1", "Group2"))
xyplot(y ~ x | f, layout = c(2,1)) ## Plot with 2 panels

## Custom panel functions
xyplot( y ~ x | f, panel = function(x,y,...) {
    panel.xyplot(x,y,...) ## First call the default panel function for 'xyplot'
    panel.abline(h = median(y), lty = 2) ## Add a horizontal line at the median
})

xyplot( y ~ x | f, panel = function(x,y,...) {
    panel.xyplot(x,y,...) ## First call the default panel function for 'xyplot'
    panel.lmline(x, y, col = 2) ## Add a horizontal line at the median
})
