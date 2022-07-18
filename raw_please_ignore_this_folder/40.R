R
list.of.packages <- c("ggplot2","gridExtra")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org') 
library(ggplot2)
library(gridExtra)
sub<- read.table(file="raref2.txt", header =T)
comp<- read.table(file="raref_sub2.txt", header =T)
pdf(file="rarefaction.pdf", height= 14, width= 14)
p1<-ggplot(data=comp, aes(x=seqdepth, y=observedASVs, group=SampleID, color=sampletype)) +
  geom_line(alpha=0.3) +
  labs(x = "Sequencing Depth", y="Observed ASVs (average per sample)") +
  scale_color_manual(values=c('#a0bed8ff','#E69F00','#607281'))+
  geom_vline(xintercept = max(comp$seqdepth), linetype="dotted", size=1.5)+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.title= element_blank(), 
        legend.text = element_text(color = "black", size = 18),
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0),
        legend.key=element_rect(fill='white'),
        legend.key.size = unit(3,"line")) 
p2<-ggplot(data=sub, aes(x=seqdepth, y=observedASVs, group=SampleID, color=sampletype)) +
  geom_line(alpha=0.3) +
  labs(x = "Number of sequences", y="Observed ASVs (average per sample)") +
  scale_color_manual(values=c('#a0bed8ff','#E69F00','#607281'))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.title= element_blank(), 
        legend.text = element_text(color = "black", size = 18),
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0),
        legend.key=element_rect(fill='white'),
        legend.key.size = unit(3,"line")) 
grid.arrange(p2,  p1, nrow=2)
dev.off()
quit("no")