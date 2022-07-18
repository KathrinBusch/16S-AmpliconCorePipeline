R
data1<- read.table(file="eveness.txt", header =T)
data2<- read.table(file="faith_pd_vector.txt", header =T)
data3<- read.table(file="observed_otus_vector.txt", header =T)
data4<- read.table(file="shannon_vector.txt", header =T)
d<-merge(data1,data2, by="SampleID")
d1<-merge(d,data3, by="SampleID")
d2<-merge(d1,data4, by="SampleID")
names(d2)[names(d2) == "observed_otus"] <- "observed_asvs"
write.table(d2, file = "alpha_diversity.txt",sep="\t",col.names= T, row.names=F)
quit("no")