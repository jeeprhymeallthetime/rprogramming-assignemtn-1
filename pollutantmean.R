setwd("~/GitHub/rprogramming-assignemtn-1")
pollutantmean <- function(directory = 'specdata', pollutant = 'sulfate', id=1:332) {
  if (pollutant =='sulfate'){
    colid=2    
  }
  if (pollutant =="nitrate") {
    colid=3
  }
  for(i in seq_along(id)) {
    #print(i)
    #print(id[i])
    newid <- sprintf("%03d",id[i])
    ids <- paste(newid,".csv",sep="")
    filename <- paste(directory,ids,collapse=NULL, sep="/")
    initial <- read.table(file=filename, sep=",", header=TRUE)
    #initial$Date <- as.Date(initial$Date, "%Y-%m-%d")  #Changes date from Factor to Date
    if (i==1){
      holdon <- initial[!is.na(initial[,colid]),colid]
    }
    else {
      holdon <- append(holdon,initial[!is.na(initial[,colid]),colid], after=length(holdon))
    }
  }
  meanie <- mean(holdon)
  meanie
}