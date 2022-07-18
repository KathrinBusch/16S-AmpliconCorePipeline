R
list.of.packages <- c("tidyr", "ggplot2","grid","gridExtra","scales")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org') 
library(tidyr)
library(ggplot2)
library(gridExtra)
library(scales)
mydata = read.table(file="sample_denoising_absolute.txt", header =T)
mydata=as.data.frame(mydata)
a<-names(mydata)[1]
b<-names(mydata)[ncol(mydata)]
dat<-gather(mydata,condition, measurement, names(mydata)[2:ncol(mydata)], factor_key=T)
names(dat)[names(dat) == "condition"] <- "filtering_step"
names(dat)[names(dat) == "measurement"] <- "read_count"
addline_format <- function(x,...){gsub('_','-\n',x)}
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  plots <- c(list(...), plotlist)
  numPlots = length(plots)
  if (is.null(layout)) {
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  if (numPlots==1) {
    print(plots[[1]])
  } else {
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    for (i in 1:numPlots) {
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
col <- data.frame(name = c("Mean"),
                  start = c(0.00001,0.00002),
                  end = c(0.00001,0.00002),
                  percentile = c("Mean"),
                  stringsAsFactors = FALSE)
pdf(file="see_denoising.pdf", height= 17, width= 25)
W <- subset(dat, filtering_step == "input")
p1<-ggplot(data=dat, aes(x=filtering_step, y=read_count)) +
  stat_summary(aes(y = read_count,group=1), fun.y=sum, colour="black", geom="line",group=1,linetype="solid", size=2) +
  labs(x = "Filtering steps", y="Total read count", fill="") +
  geom_rect(data=col, aes(NULL,NULL, ymin=start, ymax=end, fill=percentile), xmin=0.00001, xmax=0.00002, color="white", alpha=1) +
  scale_fill_manual(values=c("Mean" = "white")) +
  scale_x_discrete(breaks=unique(dat$filtering_step), 
                   labels=addline_format(c("input", "denoised","non_chimeric","non_chloroplastic", 
                                           "non_mitochondric", "non_unassigned")))+
  ylim(0, sum(W$read_count)) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.text = element_text(color = "white", size = 18),
        legend.position = c(0.96, 0.1), 
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
p2<-ggplot(data=dat, aes(x=filtering_step, y=read_count)) +
  geom_point(colour="black", alpha=0.2) +
  stat_summary(aes(y = read_count,group=1), fun.y=mean, colour="#cecee8ff", geom="line",group=1,linetype="solid", size=2) +
  labs(x = "Filtering steps", y="Read count per sample", fill="") +
  geom_rect(data=col, aes(NULL,NULL, ymin=start, ymax=end, fill=percentile), xmin=0.00001, xmax=0.00002, color="white", alpha=1) +
  scale_fill_manual(values=c("Mean" = "#cecee8ff")) +
  scale_x_discrete(breaks=unique(dat$filtering_step), 
                   labels=addline_format(c("input", "denoised","non_chimeric","non_chloroplastic", 
                                           "non_mitochondric", "non_unassigned")))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.text = element_text(color = "black", size = 18),
        legend.position = c(0.96, 0.1), 
        axis.title.x = element_text(color="black", size=20, face="bold"),  
        axis.text.x = element_text(face="plain", color="black",size=18, angle=0),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
bar = read.table(file="sample_denoising_relative.txt", header =T)
bar=as.data.frame(bar)
a<-names(bar)[1]
b<-names(bar)[ncol(bar)]
bar2<-gather(bar,condition, measurement, names(bar)[2:ncol(bar)], factor_key=T)
names(bar2)[names(bar2) == "condition"] <- "filtering_step"
names(bar2)[names(bar2) == "measurement"] <- "read_count"
bar3<-aggregate(bar2[, 3], list(bar2$filtering_step), mean)
bar3$z<-rep(1, nrow(bar3))
#bar3$a<-(1: nrow(bar3))
names(bar3)[1] <- "filtering_step"
names(bar3)[2] <- "read_percent"
df1 <- subset(bar3,bar3$filtering_step=="non_unassigned_percent")
df1$a<-df1$read_percent-0
df2 <- subset(bar3,bar3$filtering_step=="non_mitochondric_percent")
df2$a<-df2$read_percent-df1$read_percent
df3 <- subset(bar3,bar3$filtering_step=="non_chloroplastic_percent")
df3$a<-df3$read_percent-df2$read_percent
df4 <- subset(bar3,bar3$filtering_step=="non_chimeric_percent")
df4$a<-df4$read_percent-df3$read_percent
df5 <- subset(bar3,bar3$filtering_step=="denoised_percent")
df5$a<-df5$read_percent-df4$read_percent
df6 <- subset(bar3,bar3$filtering_step=="input_percent")
df6$a<-df6$read_percent-df5$read_percent
u<- rbind(df6, df5, df4, df3, df2, df1)
p3<-ggplot(data=u, aes(x=z, y=a, fill=filtering_step)) +
  geom_bar(position="stack", stat="identity",width = 0.2) +
  scale_fill_manual(values=c("#cee1f0ff", "#9db8d6ff", "#667eb1ff","#354567ff", "#657090ff", "#e5e5f3ff"),
  name = "Filtering steps", 
  labels = c("Denoising", "Chimera removal", "Chloroplast removal", "Mitochondria removal", "Unassigned removal", "Remaining fraction")) +
  labs(x = "", y="Mean fraction of input read count \n [% per sample]") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.title= element_text(color = "black", size = 18, face="bold"),
        legend.text = element_text(color = "black", size = 18),
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
dat3<-aggregate(dat[, 3], list(dat$filtering_step), sum)
dat3$z<-rep(1, nrow(dat3))
names(dat3)[1] <- "filtering_step"
names(dat3)[2] <- "read_absolute"
df7 <- subset(dat3,dat3$filtering_step=="input")
df7$read_percent<-100/df7$read_absolute*df7$read_absolute
df8 <- subset(dat3,dat3$filtering_step=="non_unassigned")
df8$read_percent<-100/df7$read_absolute*df8$read_absolute
df9 <- subset(dat3,dat3$filtering_step=="non_mitochondric")
df9$read_percent<-100/df7$read_absolute*df9$read_absolute
df10 <- subset(dat3,dat3$filtering_step=="non_chloroplastic")
df10$read_percent<-100/df7$read_absolute*df10$read_absolute
df11 <- subset(dat3,dat3$filtering_step=="non_chimeric")
df11$read_percent<-100/df7$read_absolute*df11$read_absolute
df12 <- subset(dat3,dat3$filtering_step=="denoised")
df12$read_percent<-100/df7$read_absolute*df12$read_absolute
df13<-df7
df8$a<-df8$read_percent-0
df9$a<-df9$read_percent-df8$read_percent
df10$a<-df10$read_percent-df9$read_percent
df11$a<-df11$read_percent-df10$read_percent
df12$a<-df12$read_percent-df11$read_percent
df13$a<-df13$read_percent-df12$read_percent
u2<- rbind(df13, df12, df11, df10, df9, df8)
p4<-ggplot(data=u2, aes(x=z, y=a, fill=filtering_step)) +
  geom_bar(position="stack", stat="identity",width = 0.2) +
  scale_fill_manual(values=c("#cee1f0ff", "#9db8d6ff", "#667eb1ff","#354567ff", "#657090ff", "#e5e5f3ff"),
                    name = "Filtering steps", 
                    labels = c("Denoising", "Chimera removal", "Chloroplast removal", "Mitochondria removal", "Unassigned removal", "Remaining fraction")) +
  labs(x = "", y="Fraction of total input read count \n [%]") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.title= element_text(color = "black", size = 18, face="bold"),
        legend.text = element_text(color = "black", size = 18),
        legend.position = "none",
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
u2$z<-NULL
u2$a<-NULL
u3 <- subset(u2,filtering_step=="input"| filtering_step=="non_unassigned")
names(u3)[names(u3) == "read_absolute"] <- "Total_read_count"
names(u3)[names(u3) == "read_percent"] <- "Total_read_count_[%]"
u4 <- subset(dat,filtering_step=="input")
u4$Sample_read_count_median<-median(u4$read_count)
u4$Sample_read_count_mean<-mean(u4$read_count)
u4$Sample_read_count_min<-min(u4$read_count)
u4$Sample_read_count_max<-max(u4$read_count)
u4$SampleID<-NULL
u4$read_count<-NULL
input<-u4[1,]
u5 <- subset(dat,filtering_step=="non_unassigned")
u5$Sample_read_count_median<-median(u5$read_count)
u5$Sample_read_count_mean<-mean(u5$read_count)
u5$Sample_read_count_min<-min(u5$read_count)
u5$Sample_read_count_max<-max(u5$read_count)
u5$SampleID<-NULL
u5$read_count<-NULL
output<-u5[1,]
o<-rbind(input,output)
sum<-merge(u3,o,by="filtering_step")
noin = scan("sample_number_start.txt")
nout = scan("sample_number_end.txt")
noin2 <- data.frame(matrix(unlist(noin), nrow=length(noin), byrow=T))
names(noin2)[1] <- "Sample_number"
noin2$filtering_step<-rep(c("input"), nrow(noin2))
nout2 <- data.frame(matrix(unlist(nout), nrow=length(nout), byrow=T))
names(nout2)[1] <- "Sample_number"
nout2$filtering_step<-rep(c("non_unassigned"), nrow(nout2))
fin<-rbind(noin2,nout2)
sum2<-merge(fin,sum,by="filtering_step")
sum3<-t(sum2)
sum3<-as.data.frame(sum3)
names(sum3) <- as.matrix(sum3[1, ])
sum3 <- sum3[-1, ]
names(sum3)[2] <- "output"
write.table(sum3, file = "sum3.txt",sep="\t",col.names= T, row.names=T)
sum3 = read.table(file="sum3.txt", header =T)
round_df <- function(x, digits) {
  numeric_columns <- sapply(x, mode) == 'numeric'
  x[numeric_columns] <-  round(x[numeric_columns], digits)
  x
}
sum4<-round_df(sum3, 0)
feat = read.table(file="feature-frequency-detail.txt", header =T)
feat$b<-rep(1, nrow(feat))
p6<-ggplot(feat, aes(x=b, y=frequency)) + 
  geom_boxplot(fill="#cecee8ff", alpha=0.8) +
  scale_y_continuous(trans = 'log10')  +
  annotation_logticks()  +
  labs(x = "", y="Total ASV frequency") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "grey", size = 1.5, linetype = "solid"),
        panel.background = element_rect(fill = "#ffffff",colour = NA),
        plot.background = element_rect(fill = '#ffffff'),
        legend.title= element_text(color = "black", size = 18, face="bold"),
        legend.text = element_text(color = "black", size = 18),
        legend.position = "none",
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y = element_text(color="black", size=20, face="bold"),  
        axis.text.y = element_text(face="plain", color="black",size=18, angle=0))
l<-c("NA",length(feat$FeatureID))
l <- data.frame(matrix(unlist(l), nrow=length(l), byrow=T))
names(l)[1] <- "Total_hash_count"
l<-t(l)
l<-as.data.frame(l)
names(l)[1] <- "input"
names(l)[2] <- "output"
sum5<-rbind(sum4,l)
e = scan(file="sample_read_count_min_at_seq_depth.txt")
e2 <- data.frame(matrix(unlist(e), nrow=length(e), byrow=T))
names(e2)[1] <- "Sample_read_count_min"
sum5[6,2] <-e2[1,1]
mytheme <- gridExtra::ttheme_minimal(
  core = list(fg_params=list(cex = 1.5),bg_params = list(fill = "lightgrey", col=NA)),
  colhead = list(fg_params=list(cex = 1.5)),
  rowhead = list(fg_params=list(cex = 1.5)))
p5 <- gridExtra::tableGrob(sum5, theme = mytheme)
grid.arrange(p1, arrangeGrob(p4, p3,nrow=1, widths = 1:2),  p2, widths = 3:2, arrangeGrob(p5, p6,nrow=1, widths = 2:0.2))
dev.off()
quit("no")