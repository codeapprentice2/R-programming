complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  filename <- paste(formatC(id, width = 3, flag = "0"), "csv", sep = ".")
  fullname <- paste(directory, filename, sep = "/")
  n <- length(id)
  my.frame <- data.frame(id = rep(NA, n), nobs = rep(NA, n))
  for (i in 1:n) {
    row.numbers <- sum(complete.cases(read.csv(fullname[i])))
    my.frame[i, ] <-c(id[i], row.numbers)
  }
  return (my.frame)
}