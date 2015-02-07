
best <-  function(state, outcome) {
    ends = c("heart attack", "heart failure", "pneumonia")
    data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
                                 colClasses = "character")
    data[,11] <- as.numeric(data[,11])
    data[,17] <- as.numeric(data[,17])
    data[,23] <- as.numeric(data[,23])
    if (!is.element(state, data$State)) {
        stop("invalid state")
    } else if (!is.element(outcome, ends)) {
        stop("invalid outcome")
    } 
    
    state_data <- data[data$State == state,c(2,11,17,23)]
    
    if (outcome == "heart attack") {
        ans <- state_data[order(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, state_data$Hospital.Name),][1,1]
    } else if (outcome == "heart failure") {
        ans <- state_data[order(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, state_data$Hospital.Name),][1,1]
    } else {
        ans <- state_data[order(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, state_data$Hospital.Name),][1,1]
    }     
    ans
    
}