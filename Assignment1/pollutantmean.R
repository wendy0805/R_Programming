setwd("/Users/WJLiu/Desktop/R Workspace/Assignment 1 Directory")

pollutantmean <- function(directory, pollutant, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Set file path, name, directory 
    path <- getwd()
    directory <- paste(path,directory,sep="/")
    filenames<-as.character(list.files(directory))
    files <- paste(directory,filenames, sep="/")
    
    dataset2 <- c()
    
    for(i in id) {
       dataset <- read.csv(files[i])
       dataset2 <- c(dataset2,dataset[!is.na(dataset[pollutant]),][[pollutant]])
    }
    
    round(mean(dataset2, na.rm = TRUE),3)
}

