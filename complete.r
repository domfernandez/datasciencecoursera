complete <- function(directory, id = 1:332){
  dirName <- directory
  filesInDir <- list.files(dirName,full.names=T)
  dataComplete <- data.frame()
  numberOfRows <- length(id)
  dataReturn <- data.frame(id=numeric(), nobs=character(), stringsAsFactors=F)
  obsCount <- numeric(0)
#  print(paste(" id", "nobs", collapse = " "))
  
  for (i in id) {
    filePath <-paste(directory, "/", sprintf("%03d", as.numeric(i)), ".csv", sep="")
    dataComplete <-read.csv(filePath, header = T)
    obsCount <- sum(complete.cases(dataComplete))

#    prLn1 <- sprintf("% 3d", as.numeric(i))
#    print(paste(prLn1, sprintf("% 4d", as.numeric(obsCount)), sep=" "))
    dataReturn <- rbind(dataReturn, data.frame(id = toString(i), nobs = obsCount))
    i<-i+1
  }
  dataReturn
}
