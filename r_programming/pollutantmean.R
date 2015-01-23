pollutantmean <- function(directory, pollutant, id = 1:332) {
    sum = 0
    num_measurements = 0
    files = list.files(directory)
    for (i in id) {
        data = read.csv(paste(dir,"/",sprintf("%03s",i), ".csv", sep = ""))
        col_pollutant = data[,pollutant]
        sum = sum + sum(na.omit(col_pollutant))
        num_measurements = num_measurements + length(na.omit(col_pollutant))
    }
    return  (sum / num_measurements)
}

