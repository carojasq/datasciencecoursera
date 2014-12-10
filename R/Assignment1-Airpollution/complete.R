complete <- function (directory, id=1:332){
  # Save the old wd
  old_wd <- getwd()
  setwd(directory)
  N <- length(id)
  # Creates a DF with the necessary rows
  DF <- data.frame(id=rep(0,N), nobs=rep(0,N))
  counter = 1
  for(i in id){
    filename  <- paste(formatC(i, width = 3, format = "d", flag = "0"), ".csv", sep="")
    air_pol <- read.csv(filename)
    # Search for complete cases
    cc <- complete.cases(air_pol)
    # Inserts data on DF
    DF[counter, ] <- c(i, length(cc[cc==TRUE]))
    counter <- counter + 1
  }
  setwd(old_wd)  
  DF
}