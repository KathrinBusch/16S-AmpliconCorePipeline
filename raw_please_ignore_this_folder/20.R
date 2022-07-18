R
data<- read.table(file="stats4.txt", header =T)
data$percentage_of_input_passed_filter <-NULL
data$percentage_of_input_non_chimeric <-NULL
write.table(data, file = "0stats.txt",sep="\t",col.names= T, row.names=F)
quit("no")