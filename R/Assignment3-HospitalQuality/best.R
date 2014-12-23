simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}


best <- function(state, outcome_name) {
  outcome <- read.csv("outcome-of-care-measures.csv")
  state_outcome = outcome[outcome$State == state, ]
  if (nrow(state_outcome)==0){
    stop("invalid state")
  }
  ou <- paste("Hospital.30.Day.Death..Mortality..Rates.from.",  gsub(" ", ".", simpleCap(outcome_name)), sep="")
  if (ou %in% colnames(outcome)) {
    filtered_dataframe <-state_outcome[,c(ou, "Hospital.Name")]
    filtered_dataframe[,ou] <- as.numeric(as.character(filtered_dataframe[,ou]))
    filtered_dataframe[,"Hospital.Name"] <- as.character(filtered_dataframe[,"Hospital.Name"])
    minimum <- min(filtered_dataframe[,ou], na.rm=TRUE)
    sort(filtered_dataframe[filtered_dataframe[,ou]==minimum, "Hospital.Name"])
  } else {
    stop("invalid outcome")
  }
  
  
  
}