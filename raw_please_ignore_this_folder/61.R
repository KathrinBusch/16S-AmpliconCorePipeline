R
dat=read.table(file ="phylum_tidlyformat.txt", header = T)
meta = read.table(file ="metadataforR.txt", header = T)
fin<-merge(dat, meta, by="SampleID")
write.table(fin, file = "amplitudes.txt",sep="\t",col.names= T, row.names=F)
quit("no")