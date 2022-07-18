R
fin = read.table(file ="fin4.txt", header = T,  row.names=1)
phylum <- rownames(fin) 
rela<-sapply(fin, function(x) x/sum(x),USE.NAMES = TRUE)
rela2<-cbind(phylum, rela)
write.table(rela2, file = "phylum_relabund.txt",sep="\t",col.names= T, row.names=F)
quit("no")