setwd("/Users/WJLiu/Desktop/R Workspace/Assignment 1 Directory")

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  path <- getwd()
  directory <- paste(path,directory,sep="/")
  filenames<-as.character(list.files(directory))
  files <- paste(directory,filenames, sep="/")
  
  obs <- complete("Specdata", 1:332)
  
  ids <- obs[obs$nobs > threshold,]$id
  
  correlation <- c()
  
  x <- 1  ## set the loop for Count  
  for (i in ids) {
  dataset <- read.csv(files[i])
  correlation[x] <- cor(dataset$sulfate, dataset$nitrate, use="complete.obs")
  x <- x + 1                 
  }
  correlation
  
}

source("complete.R")
cr <- corr("specdata", 150)
head(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)

