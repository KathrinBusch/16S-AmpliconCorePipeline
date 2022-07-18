R   
list.of.packages <- c("tidyr", "plyr", "stringr", "ggplot2", "gridExtra")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org')
library(tidyr)
library(plyr)
library(stringr)
library(ggplot2)
library(gridExtra)
mydata = read.table(file ="sample-frequency-detail.txt", header = F)
mydata<-rename(mydata, c("V1"="Lost_Samples","V2"="Frequency"))
pdf(file="sample_frequencies.pdf", height= 25, width= 30)
vari = read.table(file ="min-frequency.txt", header = F)
names(vari)[1] <- "seqdepth"
p<-ggplot(data=mydata, aes(mydata$Frequency)) + 
  geom_histogram(breaks=seq(0, max(mydata$Frequency), by=1000), col="darkblue", fill="darkblue", alpha=0.2)+
  labs(x = "Frequency per sample", y="Number of samples") +
  xlim(0, max(mydata$Frequency)) +
  geom_vline(xintercept = vari[1,1], linetype="dotted", size=1.5)+
  annotate("text", vari[1,1]+1000, Inf, label = vari[1,1], size=7, parse=TRUE, hjust = 0, vjust = 1) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.position = "none",
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
mydata2<-mydata[mydata$Frequency < vari[1,1], ]
write.table(mydata2, file = "sample-frequency-lost_samples.txt",sep="\t",col.names= T, row.names=F)
rownames(mydata2) <- NULL
p2 <- gridExtra::tableGrob(mydata2)
grid.arrange(p, p2 ,nrow=1, widths = 2:1)
dev.off()
quit("no")