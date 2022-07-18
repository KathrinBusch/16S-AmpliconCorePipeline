R
phy = read.table(file ="phylum_relabund.txt", header = F,  row.names=1)
names(phy) = phy[1,] [phy[1,] !="phylum"]
for(i in 1:ncol(phy)){
  write.table(phy[,i],row.names = row.names(phy), col.names =F,file=paste0(names(phy)[i],".txt"))
}
quit("no")