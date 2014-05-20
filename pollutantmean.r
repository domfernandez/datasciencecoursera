pollutantmean <- function(directory, pollutant, id = 1:332)
{
  dirName <- directory
  filesInDir <- list.files(dirName,full.names=T)
  dataMeanFile <- data.frame()
  for (i in id) {
    dataMeanFile <- rbind(dataMeanFile, read.csv(filesInDir[i]))
  }
  ifelse (pollutant == "sulfate", 
          pollutantmean <- mean(dataMeanFile$sulfate, na.rm=TRUE),
          pollutantmean <- mean(dataMeanFile$nitrate, na.rm=TRUE))
  
  print(format(pollutantmean, digits=2, nsmall=3))
}
