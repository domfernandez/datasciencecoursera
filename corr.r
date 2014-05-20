corr <- function(directory, threshold = 0) {
  corrsNum <- numeric(0)
  nobsDfr <- complete("specdata")
  nobsDfr <- nobsDfr[nobsDfr$nobs > threshold, ]
  
  for (cid in nobsDfr$id) {
    rawDfr <- data.frame()
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(cid)), ".csv",sep = "")
    rawDfr <- read.csv(fileStr)
    corrsNum <- c(corrsNum, cor(rawDfr$sulfate, rawDfr$nitrate, use = "pairwise.complete.obs"))
  }
  return(corrsNum)
}
