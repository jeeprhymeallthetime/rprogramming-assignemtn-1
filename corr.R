setwd("~/GitHub/rprogramming-assignemtn-1")
corr <- function(directory = 'specdata', threshold = 0){
  id <- 1:332
  count <- 1
  #df <- data.frame(id = numeric(length(id)), nobs = numeric(length(id)))
  for(i in seq_along(id)) {
    newid <- sprintf("%03d",id[i])
    ids <- paste(newid,".csv",sep="")
    filename <- paste(directory,ids,collapse=NULL, sep="/")
    initial <- read.table(file=filename, sep=",", header=TRUE)
    #initial$Date <- as.Date(initial$Date, "%Y-%m-%d")  #Changes date from Factor to Date
    nittrue <- is.na(initial[,3])
    pending <- initial[!nittrue,]
    sultrue <- is.na(pending[,2])
    final <- pending[!sultrue,]
    if(length(final[,1]) > threshold){
      if(count == 1){
        corvec <- cor(final[,3],final[,2])
      }
      if(count > 1) {
        corvec <- append(corvec, cor(final[,3],final[,2]), after=length(corvec))
      }
      count <- count + 1
    }
    #print(paste(id[i],length(final[,1])))

  }
  if(count ==1){
    corvec <- numeric(0)
  }
  corvec
}