R
list.of.packages <- c("tidyr", "plyr", "stringr", "ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org') 
library(tidyr)
library(plyr)
library(stringr)
library(ggplot2)
mydata = read.table(file ="forward-seven-number-summaries.txt", header = T)
mydata=as.data.frame(mydata)
a<-names(mydata)[1]
b<-names(mydata)[ncol(mydata)]
data<-gather(mydata,condition, measurement, names(mydata)[2:ncol(mydata)], factor_key=T)
dat <- subset(data, condition != "sequence_base")
names(dat)[names(dat) == "condition"] <- "base"
names(dat)[names(dat) == "measurement"] <- "quality"
dat<-rename(dat, c("sequence_base"="percentile"))
dat<-dat[!(dat$percentile=="count"),]
dat<-dat[!(dat$percentile=="2%"),]
dat<-dat[!(dat$percentile=="98%"),]
dat$percentile<-revalue(dat$percentile, c("9%"="09%"))
data_wide <- spread(dat, percentile, quality)
data_wide$base<-str_remove_all(data_wide$base, "[X]")
data_wide$base<-as.numeric(data_wide$base)
write.table(data_wide , file = "data_wide.txt",sep="\t",col.names= T, row.names=F)
data_wide = read.table(file ="data_wide.txt", header = T)
col <- data.frame(name = c("91%","75%", "50% (median)","25%","09%"),
                   start = c(11.5, 9.5, 8.25, 6,4),
                   end = c(13, 11, 8.75, 7.5,5.5),
                   percentile = c("91%","75%", "50% (median)","25%","09%"),
                   stringsAsFactors = FALSE)
pdf(file="sequence_quality.pdf", height= 10, width= 14)
p<-ggplot(data=data_wide, aes(x=base, y=X50.)) +
  geom_line(linetype="solid", size=1.2) +
  labs(x = "Sequence Base", y="Quality score") +
  xlim(0, 305) +
  ylim(0, 40) +
  geom_vline(xintercept = 270, linetype="dotted", size=1.5)+
  annotate("text", x = 260, y = 0, label = 'atop(bold("270"))', size=7, parse=TRUE) +
  geom_ribbon(aes(ymin=X25., ymax=X50.), fill="darkblue",alpha=0.1) + 
  geom_ribbon(aes(ymin=X09., ymax=X50.), fill="darkblue",alpha=0.1) + 
  geom_ribbon(aes(ymin=X50., ymax=X75.), fill="#4682b4",alpha=0.3) + 
  geom_ribbon(aes(ymin=X50., ymax=X91.), fill="#4682b4",alpha=0.3) +
  geom_rect(data=col, aes(NULL,NULL, ymin=start, ymax=end, fill=percentile), xmin=1, xmax=8, color="white", alpha=1) +
  scale_fill_manual(values=c("91%" = "#c7d9e8ff", "75%" = "#9fbdd7ff", "50% (median)" = "#000000ff", "25%" = "#cecee8ff", "09%" = "#e5e5f3ff")) +
  annotate("text", x = 13, y = 13, label = 'atop(bold("Percentile"))', size=5, parse=TRUE) +
  annotate("text", x = 18, y = 12.25, label = "91 %", size=4) +
  annotate("text", x = 18, y = 10.25, label = "75 %", size=4) + 
  annotate("text", x = 26.5, y = 7.75, label = 'atop(bold("50 % (median)"))', size=4, parse=TRUE) +
  annotate("text", x = 18, y = 6.5, label = "25 %", size=4) +
  annotate("text", x = 18, y = 4.5, label = "9 %", size=4) +
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
p
dev.off()
quit("no")