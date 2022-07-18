R           
list.of.packages <- c("plyr", "stringr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org') 
library(stringr)
library(plyr)
data<-read.table("modified_taxonomy.txt", header=FALSE)
data[,2]<-data[,1]
datanew<-str_split_fixed(data[,2], ";", 7)
datanew<-as.data.frame(datanew)
datanew[,8]<-datanew[,1]
datanew[] <- lapply(datanew, gsub, pattern='>', replacement='')
datanew[,1] <- lapply(datanew, sub, pattern='.*_', replacement='')
datanew[,8] <-as.character(datanew[,8])
datanew[,8] <-gsub("\\_.*", "", datanew[,8])
datanew[,9]<-datanew[,1]
datanew[,10]<-datanew[,2]
datanew[,11]<-datanew[,3]
datanew[,12]<-datanew[,4]
datanew[,13]<-datanew[,5]
datanew[,14]<-datanew[,6]
datanew[,15]<-datanew[,7]
datanew[,1]<-NULL
datanew[,1]<-NULL
datanew[,1]<-NULL
datanew[,1]<-NULL
datanew[,1]<-NULL
datanew[,1]<-NULL
datanew[,1]<-NULL
datanew[,2]<- paste((rep("k__", length(datanew[,2]))),datanew[,2])
datanew[,3]<- paste((rep("p__", length(datanew[,3]))),datanew[,3])
datanew[,4]<- paste((rep("c__", length(datanew[,4]))),datanew[,4])
datanew[,5]<- paste((rep("o__", length(datanew[,5]))),datanew[,5])
datanew[,6]<- paste((rep("f__", length(datanew[,6]))),datanew[,6])
datanew[,7]<- paste((rep("g__", length(datanew[,7]))),datanew[,7])
datanew[,8]<- paste((rep("s__", length(datanew[,8]))),datanew[,8])
datanew[] <- lapply(datanew, gsub, pattern=' ', replacement='')
datanew[,9]<- paste(datanew[,2],datanew[,3],datanew[,4],datanew[,5],datanew[,6],datanew[,7],datanew[,8], sep="; ")
datanew[,2]<-NULL
datanew[,2]<-NULL
datanew[,2]<-NULL
datanew[,2]<-NULL
datanew[,2]<-NULL
datanew[,2]<-NULL
datanew[,2]<-NULL
datanew[,3]<- paste(datanew[,1],datanew[,2], sep=" ")
datanew[,1]<-NULL
datanew[,1]<-NULL
write.table(datanew, file = "taxonomy_7levels.txt",sep="\t",col.names= F, row.names=F)
quit("no")