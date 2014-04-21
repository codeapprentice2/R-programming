corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  #source("complete.R")
  
  file.list <- list.files(path = directory)
  corr.list <- c()
  for (f in file.list) {
    f.data <- read.csv(file.path(directory,f))
    f.data <- f.data[complete.cases(f.data), ]
    if (nrow(f.data) > threshold) {
      corr.list <- c(corr.list, cor(f.data$sulfate, f.data$nitrate))
    }
  }
  return (corr.list)



}