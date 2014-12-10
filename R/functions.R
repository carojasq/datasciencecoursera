add2 <-function(x, y) {x+y}

above10 <- function(x) {
  use <- x>10
  x[use]
}

above <- function(x, t=10) {
  use <- x>t
  x[use]
}

columns_means <- function(m, removeNA=TRUE) {
  col_mean = c()
  for (j in seq_len(ncol(x))) {
    # Concat vectors
    col_mean = c(col_mean, mean(x[,j]), na.rm=removeNA)
  }
  col_mean
}

