corr <- function(directory, threshold=0){
    setwd(directory)
    correlations= NULL
    for(i in 1:332){
        if(i<10){
            fileName <- paste(directory,'/00',i,'.csv',sep="")
            dataOfOneFile <- read.csv(file = fileName)
        }else if(i<100){
            fileName <- paste(directory,'/0',i,'.csv',sep="")
            dataOfOneFile <- read.csv(file = fileName)
        }else {
            fileName <- paste(directory,'/',i,'.csv',sep="")
            dataOfOneFile <- read.csv(file = fileName)
        }
        dataWithoutNa <- na.omit(dataOfOneFile)
        
        NumberOfCompleteCase=nrow(dataWithoutNa)
        if(NumberOfCompleteCase>threshold){
            correlations=c(correlations, cor(dataWithoutNa$sulfate,dataWithoutNa$nitrate))
        }
    }
    return(correlations)
}
