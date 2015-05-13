setwd("~/GitHub/rprogramming-assignemtn-1")
complete <- function(directory = 'specdata', id = 1:332){
  df <- data.frame(id = numeric(length(id)), nobs = numeric(length(id)))
  for(i in seq_along(id)) {
    #print(i)
    newid <- sprintf("%03d",id[i])
    ids <- paste(newid,".csv",sep="")
    filename <- paste(directory,ids,collapse=NULL, sep="/")
    initial <- read.table(file=filename, sep=",", header=TRUE)
    #initial$Date <- as.Date(initial$Date, "%Y-%m-%d")  #Changes date from Factor to Date
    nittrue <- is.na(initial[,3])
    pending <- initial[!nittrue,]
    sultrue <- is.na(pending[,2])
    final <- pending[!sultrue,]
    #print(paste(id[i],length(final[,1])))    
    df[i,1] = id[i]
    df[i,2] = length(final[,1])    
  }
  df
}