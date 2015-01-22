setwd("/Users/WJLiu/Desktop/R Workspace/Assignment 1 Directory")

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Set file path, name
     path <- getwd()
     directory <- paste(path,directory,sep="/")
     filenames<-as.character(list.files(directory))
     files <- paste(directory,filenames, sep="/")
     
     Count <- c()
     
     x <- 1  ## set the loop for Count
     for(i in id) {
       dataset <- read.csv(files[i])
       Count[x] <- sum(as.numeric(complete.cases(dataset)))
       x <- x + 1                 
     }
     data.frame(id = id, nobs = Count)
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 1:332)

