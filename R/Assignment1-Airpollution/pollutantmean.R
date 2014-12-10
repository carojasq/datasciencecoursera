pollutantmean <- function(directory, pollutant, id=1:332) {
  # Save the old wd
  old_wd <- getwd()
  setwd(directory)
  id <- c(id)
  #Initialize the first data frame
  filename  <- paste(formatC(id[1], width = 3, format = "d", flag = "0"), ".csv", sep="")
  x <- read.csv(filename)
  #Binds dataframes from several csv files
  if (length(id)>1) {
    for (i in id[2:length(id)]){
      filename  <- paste(formatC(i, width = 3, format = "d", flag = "0"), ".csv", sep="")
      y <- read.csv(filename)
      x <- rbind(x, y)
     }
  }
  # Calculates mean and sets the old wd
  setwd(old_wd)
  #Double braces[[]] return a vector
  mean(x[[pollutant]], na.rm=TRUE)
}

