pollutmean <-function(directory, pollutant, id=1:332)
{
    #declare vector for initial append to be successful
    selection<-vector(mode="numeric")
    for (countr in id)
      #add leading zeroes to file name depending on number of the file
    { { if (countr < 10)  prefix <-"00" 
        else if (countr < 100) prefix <-"0" 
        else prefix<-"" }
     filename<-paste(directory,prefix,countr,".csv", sep="")
     filemeasure<-read.csv(file=filename,header=TRUE,sep=",")[,pollutant]
     #append new results to existing ones
     selection<-append(selection, filemeasure)
     
    }
    x<-mean(selection,na.rm=TRUE)
 }

#to test the function
dir<-paste(getwd(),"/specdata/",sep="")
pol<-'nitrate'
station<-70:72
test <-pollutmean(dir,pol,station)
test

  
