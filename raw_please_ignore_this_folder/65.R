R
list.of.packages <- c("gridExtra", "ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org')
library(ggplot2)
library(gridExtra)
dat<-read.table("alpha_diversity_indices.txt", header=TRUE)
metadata<-read.table("metadataforR.txt", header=TRUE)
data<-merge(dat, metadata, by="SampleID")
data_summary <- function(x) {
  m <- mean(x)
  ymin <- m-sd(x)
  ymax <- m+sd(x)
  return(c(y=m,ymin=ymin,ymax=ymax))
}
p1 <- ggplot(data, aes(x=sampletype, y=faith_pd, fill=sampletype)) + 
  geom_violin(trim=FALSE) +
  stat_summary(fun.data=data_summary) +
  labs(x = "nMDS1", y="Faith's PD", title="Faith's Phylogenetic Diversity") +
scale_fill_manual(values=c('#a0bed8ff', '#E69F00','#607281'))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        plot.title = element_text(color="black", size=20, face="bold"),
        legend.position="none",
        legend.title= element_blank(),
        legend.text=element_text(size=20),
        legend.background = element_rect(linetype = 'dotted', size = 1, colour = 1),
        axis.title.x = element_blank(),
        axis.text.x = element_text(color="black", size=20, face="bold"),  
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
p2 <- ggplot(data, aes(x=sampletype, y=pielou_e, fill=sampletype)) + 
  geom_violin(trim=FALSE) +
  stat_summary(fun.data=data_summary) +
  labs(x = "nMDS1", y="Pielou's evenness", title="Pielou's evenness") +
scale_fill_manual(values=c('#a0bed8ff', '#E69F00','#607281'))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        plot.title = element_text(color="black", size=20, face="bold"),
        legend.position="none",
        legend.title= element_blank(),
        legend.text=element_text(size=20),
        legend.background = element_rect(linetype = 'dotted', size = 1, colour = 1),
        axis.title.x = element_blank(),
        axis.text.x = element_text(color="black", size=20, face="bold"),  
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
p3 <- ggplot(data, aes(x=sampletype, y=observed_asvs, fill=sampletype)) + 
  geom_violin(trim=FALSE) +
  stat_summary(fun.data=data_summary) +
  labs(x = "nMDS1", y="Number of observed ASVs", title="Number of observed ASVs") +
scale_fill_manual(values=c('#a0bed8ff', '#E69F00','#607281'))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        plot.title = element_text(color="black", size=20, face="bold"),
        legend.position="none",
        legend.title= element_blank(),
        legend.text=element_text(size=20),
        legend.background = element_rect(linetype = 'dotted', size = 1, colour = 1),
        axis.title.x = element_blank(),
        axis.text.x = element_text(color="black", size=20, face="bold"),  
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
p4 <- ggplot(data, aes(x=sampletype, y=shannon, fill=sampletype)) + 
  geom_violin(trim=FALSE) +
  stat_summary(fun.data=data_summary) +
  labs(x = "nMDS1", y="Shannon Index", title="Shannon Index") +
scale_fill_manual(values=c('#a0bed8ff', '#E69F00','#607281'))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        plot.title = element_text(color="black", size=20, face="bold"),
        legend.position="none",
        legend.title= element_blank(),
        legend.text=element_text(size=20),
        legend.background = element_rect(linetype = 'dotted', size = 1, colour = 1),
        axis.title.x = element_blank(),
        axis.text.x = element_text(color="black", size=20, face="bold"),  
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
pdf(file="alpha_diversity.pdf", height= 20, width= 20)
grid.arrange(p1, p2 , p3, p4, nrow=2)
dev.off()
quit("no")