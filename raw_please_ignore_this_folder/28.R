R
list.of.packages <- c("plyr", "stringr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org') 
library(stringr)
library(plyr)
data1<- read.table(file="1stats2.txt", header =T)
data2<- read.table(file="2stats2.txt", header =T)
data3<- read.table(file="3stats2.txt", header =T)
data4<- read.table(file="4stats2.txt", header =T)
x<-merge(data1,data2, by="sample_id")
x2<-merge(x,data3,by="sample_id")
x3<-merge(x2,data4, by="sample_id")
x4<-rename(x3, c("sample_id"="SampleID","nochloroplasts"="non_chloroplastic","nomitochondria"="non_mitochondric","nounassigned"="non_unassigned"))
x4$input_percent<-x4$input/x4$input*100
x4$filtered_percent<-100/x4$input*x4$filtered
x4$denoised_percent<-100/x4$input*x4$denoised
x4$non_chimeric_percent<-100/x4$input*x4$non_chimeric
x4$non_chloroplastic_percent<-100/x4$input*x4$non_chloroplastic
x4$non_mitochondric_percent<-100/x4$input*x4$non_mitochondric
x4$non_unassigned_percent<-100/x4$input*x4$non_unassigned
x4$filtered<-NULL
x4$filtered_percent<-NULL
myvars <- c("SampleID","input", "denoised", "non_chimeric","non_chloroplastic","non_mitochondric","non_unassigned")
absolute <- x4[myvars]
myvars <- c("SampleID","input_percent", "denoised_percent", "non_chimeric_percent","non_chloroplastic_percent","non_mitochondric_percent","non_unassigned_percent")
relative <- x4[myvars]
write.table(absolute, file = "denoising_absolute.txt",sep="\t",col.names= T, row.names=F)
write.table(relative, file = "denoising_relative.txt",sep="\t",col.names= T, row.names=F)
quit("no")