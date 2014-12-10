corr <- function(directory, threshold=0) {
  old_wd <- getwd()
  setwd(directory)
  temp = list.files(pattern="*.csv") 
  #Initialize the first data frame
  correlations <- c()
  #Binds dataframes from several csv files
  for (i in temp){
      y <- na.omit(read.csv(i))
      if (nrow(y)>threshold) {
        correlation <- cor(y[['sulfate']], y[['nitrate']])
        correlations <- c(correlations, correlation)
      } 
    }
  
  setwd(old_wd)  
  correlations

  
  
}