R
list.of.packages <- c("gridExtra", "ggplot2","MASS", "vegan")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org')
library(vegan)
library(MASS)
library(ggplot2)
library(gridExtra)
set.seed(201)
community_matrix = read.table(file ="weighted_unifrac_distance_matrix.txt", header = T)
mydata = read.table(file ="metadataforR.txt", header = T)
weighted_uni_NMDS <- metaMDS(community_matrix,k=50, maxit=100,trace=TRUE)
stress_NMDS_weighted_uni <-weighted_uni_NMDS$stress
stress_NMDS_weighted_uni <-round(stress_NMDS_weighted_uni, digits = 3)
NMDS_weighted_uni = data.frame(MDS1 = weighted_uni_NMDS$points[,1], MDS2 = weighted_uni_NMDS$points[,2])
p1 <-ggplot(data = NMDS_weighted_uni, aes(MDS1, MDS2, col=mydata$sampletype, shape=mydata$blank)) + 
  geom_point(size=6, alpha=0.5) +
  labs(x = "nMDS1", y="nMDS2", title="Weighted UniFrac distances") +
  annotate("text", max(NMDS_weighted_uni$MDS1)-0.05, min(NMDS_weighted_uni$MDS2), label = paste("Stress: ", stress_NMDS_weighted_uni) , size=7, parse=TRUE) +
scale_color_manual(values=c('#a0bed8ff', '#E69F00','#607281'))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.position="top",
        legend.title= element_blank(),
        legend.text=element_text(size=20),
        legend.background = element_rect(linetype = 'dotted', size = 1, colour = 1),
        plot.title = element_text(color="black", size=20, face="bold"),
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
community_matrix = read.table(file ="unweighted_unifrac_distance_matrix.txt", header = T)
mydata = read.table(file ="metadataforR.txt", header = T)
unweighted_uni_NMDS <- metaMDS(community_matrix,k=50, maxit=100,trace=TRUE)
stress_NMDS_unweighted_uni <-unweighted_uni_NMDS$stress
stress_NMDS_unweighted_uni <-round(stress_NMDS_unweighted_uni, digits = 3)
NMDS_unweighted_uni = data.frame(MDS1 = unweighted_uni_NMDS$points[,1], MDS2 = unweighted_uni_NMDS$points[,2])
p2 <-ggplot(data = NMDS_unweighted_uni, aes(MDS1, MDS2, col=mydata$sampletype, shape=mydata$blank)) + 
  geom_point(size=6, alpha=0.5) +
  labs(x = "nMDS1", y="nMDS2", title="Unweighted UniFrac distances") +
  annotate("text", max(NMDS_unweighted_uni$MDS1)-0.05, min(NMDS_unweighted_uni$MDS2), label = paste("Stress: ", stress_NMDS_unweighted_uni) , size=7, parse=TRUE) +
scale_color_manual(values=c('#a0bed8ff', '#E69F00','#607281'))+
theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.position="top",
        legend.title= element_blank(),
        legend.text=element_text(size=20),
        legend.background = element_rect(linetype = 'dotted', size = 1, colour = 1),
        plot.title = element_text(color="black", size=20, face="bold"),
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
community_matrix = read.table(file ="bray_curtis_distance_matrix.txt", header = T)
mydata = read.table(file ="metadataforR.txt", header = T)
bray_curtis_NMDS <- metaMDS(community_matrix,k=50, maxit=100,trace=TRUE)
stress_NMDS_bray_curtis <-bray_curtis_NMDS$stress
stress_NMDS_bray_curtis <-round(stress_NMDS_bray_curtis, digits = 3)
NMDS_bray_curtis = data.frame(MDS1 = bray_curtis_NMDS$points[,1], MDS2 = bray_curtis_NMDS$points[,2])
p3 <-ggplot(data = NMDS_bray_curtis, aes(MDS1, MDS2, col=mydata$sampletype, shape=mydata$blank)) + 
  geom_point(size=6, alpha=0.5) +
  labs(x = "nMDS1", y="nMDS2", title="Bray-Curtis distances") +
  annotate("text", max(NMDS_bray_curtis$MDS1)-0.05, min(NMDS_bray_curtis$MDS2), label = paste("Stress: ", stress_NMDS_bray_curtis) , size=7, parse=TRUE) +
scale_color_manual(values=c('#a0bed8ff', '#E69F00','#607281'))+
theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.position="top",
        legend.title= element_blank(),
        legend.text=element_text(size=20),
        legend.background = element_rect(linetype = 'dotted', size = 1, colour = 1),
        plot.title = element_text(color="black", size=20, face="bold"),
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
community_matrix = read.table(file ="jaccard_distance_matrix.txt", header = T)
mydata = read.table(file ="metadataforR.txt", header = T)
jaccard_NMDS <- metaMDS(community_matrix,k=50, maxit=100,trace=TRUE)
stress_NMDS_jaccard <-jaccard_NMDS$stress
stress_NMDS_jaccard <-round(stress_NMDS_jaccard, digits = 3)
NMDS_jaccard = data.frame(MDS1 = jaccard_NMDS$points[,1], MDS2 = jaccard_NMDS$points[,2])
p4 <-ggplot(data = NMDS_jaccard, aes(MDS1, MDS2, col=mydata$sampletype, shape=mydata$blank)) + 
  geom_point(size=6, alpha=0.5) +
  labs(x = "nMDS1", y="nMDS2", title="Jaccard distances") +
  annotate("text", max(NMDS_jaccard$MDS1)-0.05, min(NMDS_jaccard$MDS2), label = paste("Stress: ", stress_NMDS_jaccard) , size=7, parse=TRUE) +
scale_color_manual(values=c('#a0bed8ff', '#E69F00','#607281'))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        plot.title = element_text(color="black", size=20, face="bold"),
        legend.position="top",
        legend.title= element_blank(),
        legend.text=element_text(size=20),
        legend.background = element_rect(linetype = 'dotted', size = 1, colour = 1),
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
pdf(file="beta_diversity.pdf", height= 20, width= 20)
grid.arrange(p1, p2 , p3, p4, nrow=2)
dev.off()
quit("no")