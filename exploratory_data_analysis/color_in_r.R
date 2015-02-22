# Plotting and color in R
library(grDevices)
colors() # list of colors you cna use in any plotting function
pal <- colorRamp(c("red", "blue")) # range from 0-1 red-blue
pal(0)
pal(1)
pal(.5)

pal(seq(0,1, len = 10))

pal <- colorRampPalette(c("red", "yellow"))
pal(2)
pal(10)

# RColorBrewer Package
library(RColorBrewer)
# sequential (continuous, ordered), diverging (+/- from mean) and 
# qualitative (factors, categorical) palettes
cols <- brewer.pal(3, "BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

# The smoothScatter function
# cool for scatter plots
x<-rnorm(1000)
y<-rnorm(1000)
smoothScatter(x,y)

# Notes
## rgb function produces hex string
## color transparency can be added via the alpha parameter to rgb
## the colorspace package can be used for a different control over colors

# Scatterplot with no transparency
plot(x,y, col = rgb(0,0,0,.2), pch = 19)
