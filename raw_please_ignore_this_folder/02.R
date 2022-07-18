R
data<-read.table(file ="metadataV34_complete.txt", header = T,  sep="\t")
dat<-read.table(file ="filter_manually.txt", header = T,  sep="\t")
mydata<-merge(data, dat, by="SampleID", all=TRUE)
mydata$remove<-as.character(mydata$remove)
mydata$remove[is.na(mydata$remove)] <- "keep"
my<-mydata[!(mydata$remove=="delete"),]
my$remove<-NULL
names(my)[1] <- c('#SampleID') 
write.table(my, file = "metadataV34.txt",sep="\t",col.names= T, row.names=F)
quit("no")