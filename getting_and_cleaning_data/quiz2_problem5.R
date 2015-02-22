file <- file("q2p5.for", "r")
lines <- readLines(file)
head(lines)
length(lines)
noHead <- lines[5:1258]
head(noHead)
sum = 0
for (i in 1:length(noHead)) {
    sum = sum + as.numeric(substr(noHead[i],29,32))
}
sum

