library(datasets)
with(faithful,plot(eruptions, waiting))
title(main = "Old Faithful Geyser")

pdf(file = "myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main="Old Faithful Geyser data")
dev.off()

x <- rnorm(100)
y <- x + .3 * rnorm(100)
plot(x,y)
dev.copy2pdf(file="ha.pdf")
