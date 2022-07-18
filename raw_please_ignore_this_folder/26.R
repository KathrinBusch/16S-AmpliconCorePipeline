R
data<- read.table(file="sample-frequency-detail.txt", header =T)
min<-min(data$samplingdepth)
write.table(min, file = "sample_read_count_min_at_seq_depth.txt",sep="\t",col.names= F, row.names=F)
quit("no")