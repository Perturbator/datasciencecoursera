complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    files_list <- list.files(directory, full.names=TRUE)
    data <- data.frame()
    dataset<-vector()
    nobs<-data.frame()
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    for (i in id) {
        dataset <- read.csv(files_list[i])
        nobs <- sum(complete.cases(dataset))
        data <- rbind(data, data.frame(id=i, nobs = nobs))
    }
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    data
}