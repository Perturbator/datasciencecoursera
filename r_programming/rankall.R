get_data_by_outcome <- function(outcome) {
    outcomes = c("heart attack", "heart failure", "pneumonia")
    data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
                     colClasses = "character")
    data[,11] <- as.numeric(data[,11])
    data[,17] <- as.numeric(data[,17])
    data[,23] <- as.numeric(data[,23])
    if (outcome == outcomes[1]) {
        outcome_data <- data[,c(2,7,11)]
    } else if (outcome == outcomes[2]) {
        outcome_data <- data[,c(2,7,17)]
    } else if (outcome == outcomes[3]) {
        outcome_data <- data[,c(2,7,23)]
    } else {
        stop("invalid outcome")
    }
    outcome_data
}
get_state_hospital <- function(data, state, rank) {
    
    state_data <- subset(data, State == state)
    ans <- state_data[order(state_data[,3], state_data[,1], na.last = NA),][,1]
    if (rank == "best") {
        rank = 1
        return(ans[rank])
    } else if (rank == "worst") {
        flag = TRUE
        for (i in 1:length(ans)) {
            if (is.na(ans[i])) {
                return(ans[i-1])
                flag = FALSE
                break
            }
        }
        if (flag) {
            return(ans[length(ans)])
        }
    } else if (rank <= length(ans)) {
        return(ans[rank])
    }
    else {
        return(NA)
    }   
}
rankall <- function(outcome, num) {
    ## Read outcome data
    outcome_data <- get_data_by_outcome(outcome)
        
    ## For each state find the hospital of the given rank
    state <- sort(unique(outcome_data$State))
    hospital <- character(54)
    for (i in 1:54) {
        
        hospital[i] <- get_state_hospital(outcome_data, state[i], num)
    }
    df = data.frame(hospital, state)
    ## Return a data fram with hospital names and the (abbreviated) state name.
    df
}
