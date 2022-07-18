R
data<-read.table(file ="table2.txt", header = F)
select<-data[1,]
turn<-t(select)
write.table(turn, file = "list_of_remaining_samples.txt",sep="\t",col.names= T, row.names=F)
quit("no")