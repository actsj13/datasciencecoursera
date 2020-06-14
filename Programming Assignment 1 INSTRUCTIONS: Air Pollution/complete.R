complete <- function(directory, id = 1:332){
    setwd(directory)
    ID= NULL
    NumberOfCompleteCase= NULL
    
    for(i in id){
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
        
        ID = c(ID,i)
        NumberOfCompleteCase=c(NumberOfCompleteCase,nrow(dataWithoutNa)) 
    }
    df <- data.frame("id"=ID,"nobs"=NumberOfCompleteCase)
    return(df)
}
