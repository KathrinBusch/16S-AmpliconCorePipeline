R
list.of.packages <- c("stringr", "plyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org')  
library(stringr)
library(plyr)
taxonomy<-read.table(file ="taxonomy.txt", header = T, sep="\t")
datnew<-str_split_fixed(taxonomy$Taxon, ";", 7)
d=as.data.frame(datnew)
d$V1 <- sub("^$", "__", d$V1)
d$V2 <- sub("^$", "__", d$V2)
d$V3 <- sub("^$", "__", d$V3)
d$V4 <- sub("^$", "__", d$V4)
d$V5 <- sub("^$", "__", d$V5)
d$V6 <- sub("^$", "__", d$V6)
d$V7 <- sub("^$", "__", d$V7)
a<- paste(d$V1,d$V2,d$V3,d$V4,d$V5,d$V6,d$V7,sep=";")
b<- cbind(taxonomy,a)
b<- cbind(b,d$V1,d$V2,d$V3,d$V4,d$V5,d$V6,d$V7)
b$Taxon<-NULL
b<-rename(b, c("a"="Taxon"))
b<-b[!grepl("*Chloroplast*", b$Taxon),]
b<-b[!grepl("*Mitochondria*", b$Taxon),]
b<-b[!grepl("*Unassigned*", b$Taxon),]
b<-rename(b, c("d$V1"="kingdom","d$V2"="phylum","d$V3"="class","d$V4"="order","d$V5"="family","d$V6"="genus","d$V7"="species"))
write.table(b, file = "taxonomyforR.txt",sep="\t",col.names= T, row.names=F)
quit("no")