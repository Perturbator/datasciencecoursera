corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    files_list = list.files(directory, full.names=TRUE)
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    corr_vect <- vector()
    for (i in 1:332) {
        dataset <- read.csv(files_list[i])
        data <- dataset[complete.cases(dataset),]
        nobs <- sum(complete.cases(dataset))
        if (nobs > threshold) {
            corr_vect <- c(corr_vect, cor(data$nitrate, data$sulfate, use="complete.obs"))
        }
    }
    ## Return a numeric vector of correlations
    corr_vect
}