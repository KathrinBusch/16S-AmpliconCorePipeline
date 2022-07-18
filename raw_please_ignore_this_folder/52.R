R
list.of.packages <- c("stringr", "plyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org') 
library(stringr)
library(plyr)
metadata<-read.table(file ="list_of_remaining_samples.txt", header = T,  sep="\t")
metadata2<-read.table(file ="metadataV34.txt", header = T,  sep="\t")
names(metadata)[1] <- "SampleID"
data<-merge(metadata, metadata2, by="SampleID")
write.table(data, file = "metadataforR.txt",sep="\t",col.names= T, row.names=F)
quit("no")