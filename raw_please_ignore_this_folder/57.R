R
list.of.packages <- c("tidyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org') 
library(tidyr)
mydata = read.table(file ="phylum_relabund.txt", header = T)
mydata=as.data.frame(mydata)
a<-names(mydata)[1]
b<-names(mydata)[ncol(mydata)]
data<-gather(mydata,condition, measurement, names(mydata)[2:ncol(mydata)], factor_key=T)
dat <- subset(data, condition != "phylum")
names(dat)[names(dat) == "condition"] <- "SampleID"
names(dat)[names(dat) == "measurement"] <- "relabund"
write.table(dat, file = "phylum_tidlyformat.txt",sep="\t",col.names= T, row.names=F)
quit("no")