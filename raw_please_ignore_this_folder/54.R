R
mydata =read.table(file ="tableforR.txt", header = T)
my = read.table(file ="taxonomyforR.txt", header = T)
x<-merge(my, mydata, by="FeatureID")
x$FeatureID<-NULL
x$Confidence<-NULL
x$Taxon<-NULL
x$kingdom<-NULL
x$class<-NULL 
x$order<-NULL
x$family<-NULL
x$genus<-NULL
x$species<-NULL
fin<-aggregate(. ~ phylum, data = x, sum)
rownames(fin) <- fin[,1]
fin[,1] <- NULL
fin <- droplevels(fin[rowSums(fin) != 0,])
fin <- droplevels(fin[,colSums(fin) != 0])
write.table(fin, file = "fin.txt",sep="\t",col.names= T, row.names=T)
quit("no")