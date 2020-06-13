pollutantmean <- function(directory, pollutant , id = 1:332){
    setwd(directory)
    dataOfAllFileSelectedPollutant= NULL
    
    for( i in id){
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
        
        dataOfOneFileSelectedPollutant<-subset(dataOfOneFile, select=c(pollutant))
        dataOfOneFileSelectedPollutant<-as.numeric(unlist(dataOfOneFileSelectedPollutant))
        dataOfAllFileSelectedPollutant <- c(dataOfAllFileSelectedPollutant,dataOfOneFileSelectedPollutant)
    }
    meanOfAll <- mean(dataOfAllFileSelectedPollutant, na.rm=TRUE)
    print(meanOfAll)
}
