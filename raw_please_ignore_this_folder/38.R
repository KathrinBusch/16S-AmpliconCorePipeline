R
list.of.packages <- c("ggplot2", "stringr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,  repos='http://cran.us.r-project.org') 
library(stringr)
library(ggplot2)
data<- read.table(file="observed_otusN.txt", header =T)
data[data == 0] <- NA
dat <- data[,-1]
rownames(dat) <- data[,1]
depth1<-dat[,1:10]
depth2<-dat[,11:20]
depth3<-dat[,21:30]
depth4<-dat[,31:40]
depth5<-dat[,41:50]
depth6<-dat[,51:60]
depth7<-dat[,61:70]
depth8<-dat[,71:80]
depth9<-dat[,81:90]
depth10<-dat[,91:100]
depth11<-dat[,101:110]
depth12<-dat[,111:120]
depth13<-dat[,121:130]
depth14<-dat[,131:140]
depth15<-dat[,141:150]
depth16<-dat[,151:160]
depth17<-dat[,161:170]
depth18<-dat[,171:180]
depth19<-dat[,181:190]
depth20<-dat[,191:200]
depth21<-dat[,201:210]
depth22<-dat[,211:220]
depth23<-dat[,221:230]
depth24<-dat[,231:240]
depth25<-dat[,241:250]
depth26<-dat[,251:260]
depth27<-dat[,261:270]
depth28<-dat[,271:280]
depth29<-dat[,281:290]
depth30<-dat[,291:300]
depth31<-dat[,301:310]
depth32<-dat[,311:320]
depth33<-dat[,321:330]
depth34<-dat[,331:340]
depth35<-dat[,341:350]
depth36<-dat[,351:360]
depth37<-dat[,361:370]
depth38<-dat[,371:380]
depth39<-dat[,381:390]
depth40<-dat[,391:400]
depth41<-dat[,401:410]
depth42<-dat[,411:420]
depth43<-dat[,421:430]
depth44<-dat[,431:440]
depth45<-dat[,441:450]
depth46<-dat[,451:460]
depth47<-dat[,461:470]
depth48<-dat[,471:480]
depth49<-dat[,481:490]
depth50<-dat[,491:500]
depth51<-dat[,501:510]
depth52<-dat[,511:520]
depth53<-dat[,521:530]
depth54<-dat[,531:540]
depth55<-dat[,541:550]
depth56<-dat[,551:560]
depth57<-dat[,561:570]
depth58<-dat[,571:580]
depth59<-dat[,581:590]
depth60<-dat[,591:600]
depth61<-dat[,601:610]
depth62<-dat[,611:620]
depth63<-dat[,621:630]
depth64<-dat[,631:640]
depth65<-dat[,641:650]
depth66<-dat[,651:660]
depth67<-dat[,661:670]
depth68<-dat[,671:680]
depth69<-dat[,681:690]
depth70<-dat[,691:700]
depth71<-dat[,701:710]
depth72<-dat[,711:720]
depth73<-dat[,721:730]
depth74<-dat[,731:740]
depth75<-dat[,741:750]
depth76<-dat[,751:760]
depth77<-dat[,761:770]
depth78<-dat[,771:780]
depth79<-dat[,781:790]
depth80<-dat[,791:800]
depth81<-dat[,801:810]
depth82<-dat[,811:820]
depth83<-dat[,821:830]
depth84<-dat[,831:840]
depth85<-dat[,841:850]
depth86<-dat[,851:860]
depth87<-dat[,861:870]
depth88<-dat[,871:880]
depth89<-dat[,881:890]
depth90<-dat[,891:900]
depth91<-dat[,901:910]
depth92<-dat[,911:920]
depth93<-dat[,921:930]
depth94<-dat[,931:940]
depth95<-dat[,941:950]
depth96<-dat[,951:960]
depth97<-dat[,961:970]
depth98<-dat[,971:980]
depth99<-dat[,981:990]
depth100<-dat[,991:1000]
metadata<-dat[,1001:ncol(dat)]
depth1$mean<-rowMeans(depth1)
depth2$mean<-rowMeans(depth2)
depth3$mean<-rowMeans(depth3)
depth4$mean<-rowMeans(depth4)
depth5$mean<-rowMeans(depth5)
depth6$mean<-rowMeans(depth6)
depth7$mean<-rowMeans(depth7)
depth8$mean<-rowMeans(depth8)
depth9$mean<-rowMeans(depth9)
depth10$mean<-rowMeans(depth10)
depth11$mean<-rowMeans(depth11)
depth12$mean<-rowMeans(depth12)
depth13$mean<-rowMeans(depth13)
depth14$mean<-rowMeans(depth14)
depth15$mean<-rowMeans(depth15)
depth16$mean<-rowMeans(depth16)
depth17$mean<-rowMeans(depth17)
depth18$mean<-rowMeans(depth18)
depth19$mean<-rowMeans(depth19)
depth20$mean<-rowMeans(depth20)
depth21$mean<-rowMeans(depth21)
depth22$mean<-rowMeans(depth22)
depth23$mean<-rowMeans(depth23)
depth24$mean<-rowMeans(depth24)
depth25$mean<-rowMeans(depth25)
depth26$mean<-rowMeans(depth26)
depth27$mean<-rowMeans(depth27)
depth28$mean<-rowMeans(depth28)
depth29$mean<-rowMeans(depth29)
depth30$mean<-rowMeans(depth30)
depth31$mean<-rowMeans(depth31)
depth32$mean<-rowMeans(depth32)
depth33$mean<-rowMeans(depth33)
depth34$mean<-rowMeans(depth34)
depth35$mean<-rowMeans(depth35)
depth36$mean<-rowMeans(depth36)
depth37$mean<-rowMeans(depth37)
depth38$mean<-rowMeans(depth38)
depth39$mean<-rowMeans(depth39)
depth40$mean<-rowMeans(depth40)
depth41$mean<-rowMeans(depth41)
depth42$mean<-rowMeans(depth42)
depth43$mean<-rowMeans(depth43)
depth44$mean<-rowMeans(depth44)
depth45$mean<-rowMeans(depth45)
depth46$mean<-rowMeans(depth46)
depth47$mean<-rowMeans(depth47)
depth48$mean<-rowMeans(depth48)
depth49$mean<-rowMeans(depth49)
depth50$mean<-rowMeans(depth50)
depth51$mean<-rowMeans(depth51)
depth52$mean<-rowMeans(depth52)
depth53$mean<-rowMeans(depth53)
depth54$mean<-rowMeans(depth54)
depth55$mean<-rowMeans(depth55)
depth56$mean<-rowMeans(depth56)
depth57$mean<-rowMeans(depth57)
depth58$mean<-rowMeans(depth58)
depth59$mean<-rowMeans(depth59)
depth60$mean<-rowMeans(depth60)
depth61$mean<-rowMeans(depth61)
depth62$mean<-rowMeans(depth62)
depth63$mean<-rowMeans(depth63)
depth64$mean<-rowMeans(depth64)
depth65$mean<-rowMeans(depth65)
depth66$mean<-rowMeans(depth66)
depth67$mean<-rowMeans(depth67)
depth68$mean<-rowMeans(depth68)
depth69$mean<-rowMeans(depth69)
depth70$mean<-rowMeans(depth70)
depth71$mean<-rowMeans(depth71)
depth72$mean<-rowMeans(depth72)
depth73$mean<-rowMeans(depth73)
depth74$mean<-rowMeans(depth74)
depth75$mean<-rowMeans(depth75)
depth76$mean<-rowMeans(depth76)
depth77$mean<-rowMeans(depth77)
depth78$mean<-rowMeans(depth78)
depth79$mean<-rowMeans(depth79)
depth80$mean<-rowMeans(depth80)
depth81$mean<-rowMeans(depth81)
depth82$mean<-rowMeans(depth82)
depth83$mean<-rowMeans(depth83)
depth84$mean<-rowMeans(depth84)
depth85$mean<-rowMeans(depth85)
depth86$mean<-rowMeans(depth86)
depth87$mean<-rowMeans(depth87)
depth88$mean<-rowMeans(depth88)
depth89$mean<-rowMeans(depth89)
depth90$mean<-rowMeans(depth90)
depth91$mean<-rowMeans(depth91)
depth92$mean<-rowMeans(depth92)
depth93$mean<-rowMeans(depth93)
depth94$mean<-rowMeans(depth94)
depth95$mean<-rowMeans(depth95)
depth96$mean<-rowMeans(depth96)
depth97$mean<-rowMeans(depth97)
depth98$mean<-rowMeans(depth98)
depth99$mean<-rowMeans(depth99)
depth100$mean<-rowMeans(depth100)
names(depth1)<-sapply(strsplit(names(depth1), "_iter"), `[[`, 1)
colnames(depth1)[1] 
depth1$seqdepth<-rep(colnames(depth1)[1], nrow(depth1))
depth1[,1:10]<-NULL
depth1$seqdepth<-str_remove_all(depth1$seqdepth, "[depth]")
depth1<-merge(depth1, metadata, by="row.names")
names(depth2)<-sapply(strsplit(names(depth2), "_iter"), `[[`, 1)
colnames(depth2)[1] 
depth2$seqdepth<-rep(colnames(depth2)[1], nrow(depth2))
depth2[,1:10]<-NULL
depth2$seqdepth<-str_remove_all(depth2$seqdepth, "[depth]")
depth2<-merge(depth2, metadata, by="row.names")
names(depth3)<-sapply(strsplit(names(depth3), "_iter"), `[[`, 1)
colnames(depth3)[1] 
depth3$seqdepth<-rep(colnames(depth3)[1], nrow(depth3))
depth3[,1:10]<-NULL
depth3$seqdepth<-str_remove_all(depth3$seqdepth, "[depth]")
depth3<-merge(depth3, metadata, by="row.names")
names(depth4)<-sapply(strsplit(names(depth4), "_iter"), `[[`, 1)
colnames(depth4)[1] 
depth4$seqdepth<-rep(colnames(depth4)[1], nrow(depth4))
depth4[,1:10]<-NULL
depth4$seqdepth<-str_remove_all(depth4$seqdepth, "[depth]")
depth4<-merge(depth4, metadata, by="row.names")
names(depth5)<-sapply(strsplit(names(depth5), "_iter"), `[[`, 1)
colnames(depth5)[1] 
depth5$seqdepth<-rep(colnames(depth5)[1], nrow(depth5))
depth5[,1:10]<-NULL
depth5$seqdepth<-str_remove_all(depth5$seqdepth, "[depth]")
depth5<-merge(depth5, metadata, by="row.names")
names(depth6)<-sapply(strsplit(names(depth6), "_iter"), `[[`, 1)
colnames(depth6)[1] 
depth6$seqdepth<-rep(colnames(depth6)[1], nrow(depth6))
depth6[,1:10]<-NULL
depth6$seqdepth<-str_remove_all(depth6$seqdepth, "[depth]")
depth6<-merge(depth6, metadata, by="row.names")
names(depth7)<-sapply(strsplit(names(depth7), "_iter"), `[[`, 1)
colnames(depth7)[1] 
depth7$seqdepth<-rep(colnames(depth7)[1], nrow(depth7))
depth7[,1:10]<-NULL
depth7$seqdepth<-str_remove_all(depth7$seqdepth, "[depth]")
depth7<-merge(depth7, metadata, by="row.names")
names(depth8)<-sapply(strsplit(names(depth8), "_iter"), `[[`, 1)
colnames(depth8)[1] 
depth8$seqdepth<-rep(colnames(depth8)[1], nrow(depth8))
depth8[,1:10]<-NULL
depth8$seqdepth<-str_remove_all(depth8$seqdepth, "[depth]")
depth8<-merge(depth8, metadata, by="row.names")
names(depth9)<-sapply(strsplit(names(depth9), "_iter"), `[[`, 1)
colnames(depth9)[1] 
depth9$seqdepth<-rep(colnames(depth9)[1], nrow(depth9))
depth9[,1:10]<-NULL
depth9$seqdepth<-str_remove_all(depth9$seqdepth, "[depth]")
depth9<-merge(depth9, metadata, by="row.names")
names(depth10)<-sapply(strsplit(names(depth10), "_iter"), `[[`, 1)
colnames(depth10)[1] 
depth10$seqdepth<-rep(colnames(depth10)[1], nrow(depth10))
depth10[,1:10]<-NULL
depth10$seqdepth<-str_remove_all(depth10$seqdepth, "[depth]")
depth10<-merge(depth10, metadata, by="row.names")
names(depth11)<-sapply(strsplit(names(depth11), "_iter"), `[[`, 1)
colnames(depth11)[1] 
depth11$seqdepth<-rep(colnames(depth11)[1], nrow(depth11))
depth11[,1:10]<-NULL
depth11$seqdepth<-str_remove_all(depth11$seqdepth, "[depth]")
depth11<-merge(depth11, metadata, by="row.names")
names(depth12)<-sapply(strsplit(names(depth12), "_iter"), `[[`, 1)
colnames(depth12)[1] 
depth12$seqdepth<-rep(colnames(depth12)[1], nrow(depth12))
depth12[,1:10]<-NULL
depth12$seqdepth<-str_remove_all(depth12$seqdepth, "[depth]")
depth12<-merge(depth12, metadata, by="row.names")
names(depth13)<-sapply(strsplit(names(depth13), "_iter"), `[[`, 1)
colnames(depth13)[1] 
depth13$seqdepth<-rep(colnames(depth13)[1], nrow(depth13))
depth13[,1:10]<-NULL
depth13$seqdepth<-str_remove_all(depth13$seqdepth, "[depth]")
depth13<-merge(depth13, metadata, by="row.names")
names(depth14)<-sapply(strsplit(names(depth14), "_iter"), `[[`, 1)
colnames(depth14)[1] 
depth14$seqdepth<-rep(colnames(depth14)[1], nrow(depth14))
depth14[,1:10]<-NULL
depth14$seqdepth<-str_remove_all(depth14$seqdepth, "[depth]")
depth14<-merge(depth14, metadata, by="row.names")
names(depth15)<-sapply(strsplit(names(depth15), "_iter"), `[[`, 1)
colnames(depth15)[1] 
depth15$seqdepth<-rep(colnames(depth15)[1], nrow(depth15))
depth15[,1:10]<-NULL
depth15$seqdepth<-str_remove_all(depth15$seqdepth, "[depth]")
depth15<-merge(depth15, metadata, by="row.names")
names(depth16)<-sapply(strsplit(names(depth16), "_iter"), `[[`, 1)
colnames(depth16)[1] 
depth16$seqdepth<-rep(colnames(depth16)[1], nrow(depth16))
depth16[,1:10]<-NULL
depth16$seqdepth<-str_remove_all(depth16$seqdepth, "[depth]")
depth16<-merge(depth16, metadata, by="row.names")
names(depth17)<-sapply(strsplit(names(depth17), "_iter"), `[[`, 1)
colnames(depth17)[1] 
depth17$seqdepth<-rep(colnames(depth17)[1], nrow(depth17))
depth17[,1:10]<-NULL
depth17$seqdepth<-str_remove_all(depth17$seqdepth, "[depth]")
depth17<-merge(depth17, metadata, by="row.names")
names(depth18)<-sapply(strsplit(names(depth18), "_iter"), `[[`, 1)
colnames(depth18)[1] 
depth18$seqdepth<-rep(colnames(depth18)[1], nrow(depth18))
depth18[,1:10]<-NULL
depth18$seqdepth<-str_remove_all(depth18$seqdepth, "[depth]")
depth18<-merge(depth18, metadata, by="row.names")
names(depth19)<-sapply(strsplit(names(depth19), "_iter"), `[[`, 1)
colnames(depth19)[1] 
depth19$seqdepth<-rep(colnames(depth19)[1], nrow(depth19))
depth19[,1:10]<-NULL
depth19$seqdepth<-str_remove_all(depth19$seqdepth, "[depth]")
depth19<-merge(depth19, metadata, by="row.names")
names(depth20)<-sapply(strsplit(names(depth20), "_iter"), `[[`, 1)
colnames(depth20)[1] 
depth20$seqdepth<-rep(colnames(depth20)[1], nrow(depth20))
depth20[,1:10]<-NULL
depth20$seqdepth<-str_remove_all(depth20$seqdepth, "[depth]")
depth20<-merge(depth20, metadata, by="row.names")
names(depth21)<-sapply(strsplit(names(depth21), "_iter"), `[[`, 1)
colnames(depth21)[1] 
depth21$seqdepth<-rep(colnames(depth21)[1], nrow(depth21))
depth21[,1:10]<-NULL
depth21$seqdepth<-str_remove_all(depth21$seqdepth, "[depth]")
depth21<-merge(depth21, metadata, by="row.names")
names(depth22)<-sapply(strsplit(names(depth22), "_iter"), `[[`, 1)
colnames(depth22)[1] 
depth22$seqdepth<-rep(colnames(depth22)[1], nrow(depth22))
depth22[,1:10]<-NULL
depth22$seqdepth<-str_remove_all(depth22$seqdepth, "[depth]")
depth22<-merge(depth22, metadata, by="row.names")
names(depth23)<-sapply(strsplit(names(depth23), "_iter"), `[[`, 1)
colnames(depth23)[1] 
depth23$seqdepth<-rep(colnames(depth23)[1], nrow(depth23))
depth23[,1:10]<-NULL
depth23$seqdepth<-str_remove_all(depth23$seqdepth, "[depth]")
depth23<-merge(depth23, metadata, by="row.names")
names(depth24)<-sapply(strsplit(names(depth24), "_iter"), `[[`, 1)
colnames(depth24)[1] 
depth24$seqdepth<-rep(colnames(depth24)[1], nrow(depth24))
depth24[,1:10]<-NULL
depth24$seqdepth<-str_remove_all(depth24$seqdepth, "[depth]")
depth24<-merge(depth24, metadata, by="row.names")
names(depth25)<-sapply(strsplit(names(depth25), "_iter"), `[[`, 1)
colnames(depth25)[1] 
depth25$seqdepth<-rep(colnames(depth25)[1], nrow(depth25))
depth25[,1:10]<-NULL
depth25$seqdepth<-str_remove_all(depth25$seqdepth, "[depth]")
depth25<-merge(depth25, metadata, by="row.names")
names(depth26)<-sapply(strsplit(names(depth26), "_iter"), `[[`, 1)
colnames(depth26)[1] 
depth26$seqdepth<-rep(colnames(depth26)[1], nrow(depth26))
depth26[,1:10]<-NULL
depth26$seqdepth<-str_remove_all(depth26$seqdepth, "[depth]")
depth26<-merge(depth26, metadata, by="row.names")
names(depth27)<-sapply(strsplit(names(depth27), "_iter"), `[[`, 1)
colnames(depth27)[1] 
depth27$seqdepth<-rep(colnames(depth27)[1], nrow(depth27))
depth27[,1:10]<-NULL
depth27$seqdepth<-str_remove_all(depth27$seqdepth, "[depth]")
depth27<-merge(depth27, metadata, by="row.names")
names(depth28)<-sapply(strsplit(names(depth28), "_iter"), `[[`, 1)
colnames(depth28)[1] 
depth28$seqdepth<-rep(colnames(depth28)[1], nrow(depth28))
depth28[,1:10]<-NULL
depth28$seqdepth<-str_remove_all(depth28$seqdepth, "[depth]")
depth28<-merge(depth28, metadata, by="row.names")
names(depth29)<-sapply(strsplit(names(depth29), "_iter"), `[[`, 1)
colnames(depth29)[1] 
depth29$seqdepth<-rep(colnames(depth29)[1], nrow(depth29))
depth29[,1:10]<-NULL
depth29$seqdepth<-str_remove_all(depth29$seqdepth, "[depth]")
depth29<-merge(depth29, metadata, by="row.names")
names(depth30)<-sapply(strsplit(names(depth30), "_iter"), `[[`, 1)
colnames(depth30)[1] 
depth30$seqdepth<-rep(colnames(depth30)[1], nrow(depth30))
depth30[,1:10]<-NULL
depth30$seqdepth<-str_remove_all(depth30$seqdepth, "[depth]")
depth30<-merge(depth30, metadata, by="row.names")
names(depth31)<-sapply(strsplit(names(depth31), "_iter"), `[[`, 1)
colnames(depth31)[1] 
depth31$seqdepth<-rep(colnames(depth31)[1], nrow(depth31))
depth31[,1:10]<-NULL
depth31$seqdepth<-str_remove_all(depth31$seqdepth, "[depth]")
depth31<-merge(depth31, metadata, by="row.names")
names(depth32)<-sapply(strsplit(names(depth32), "_iter"), `[[`, 1)
colnames(depth32)[1] 
depth32$seqdepth<-rep(colnames(depth32)[1], nrow(depth32))
depth32[,1:10]<-NULL
depth32$seqdepth<-str_remove_all(depth32$seqdepth, "[depth]")
depth32<-merge(depth32, metadata, by="row.names")
names(depth33)<-sapply(strsplit(names(depth33), "_iter"), `[[`, 1)
colnames(depth33)[1] 
depth33$seqdepth<-rep(colnames(depth33)[1], nrow(depth33))
depth33[,1:10]<-NULL
depth33$seqdepth<-str_remove_all(depth33$seqdepth, "[depth]")
depth33<-merge(depth33, metadata, by="row.names")
names(depth34)<-sapply(strsplit(names(depth34), "_iter"), `[[`, 1)
colnames(depth34)[1] 
depth34$seqdepth<-rep(colnames(depth34)[1], nrow(depth34))
depth34[,1:10]<-NULL
depth34$seqdepth<-str_remove_all(depth34$seqdepth, "[depth]")
depth34<-merge(depth34, metadata, by="row.names")
names(depth35)<-sapply(strsplit(names(depth35), "_iter"), `[[`, 1)
colnames(depth35)[1] 
depth35$seqdepth<-rep(colnames(depth35)[1], nrow(depth35))
depth35[,1:10]<-NULL
depth35$seqdepth<-str_remove_all(depth35$seqdepth, "[depth]")
depth35<-merge(depth35, metadata, by="row.names")
names(depth36)<-sapply(strsplit(names(depth36), "_iter"), `[[`, 1)
colnames(depth36)[1] 
depth36$seqdepth<-rep(colnames(depth36)[1], nrow(depth36))
depth36[,1:10]<-NULL
depth36$seqdepth<-str_remove_all(depth36$seqdepth, "[depth]")
depth36<-merge(depth36, metadata, by="row.names")
names(depth37)<-sapply(strsplit(names(depth37), "_iter"), `[[`, 1)
colnames(depth37)[1] 
depth37$seqdepth<-rep(colnames(depth37)[1], nrow(depth37))
depth37[,1:10]<-NULL
depth37$seqdepth<-str_remove_all(depth37$seqdepth, "[depth]")
depth37<-merge(depth37, metadata, by="row.names")
names(depth38)<-sapply(strsplit(names(depth38), "_iter"), `[[`, 1)
colnames(depth38)[1] 
depth38$seqdepth<-rep(colnames(depth38)[1], nrow(depth38))
depth38[,1:10]<-NULL
depth38$seqdepth<-str_remove_all(depth38$seqdepth, "[depth]")
depth38<-merge(depth38, metadata, by="row.names")
names(depth39)<-sapply(strsplit(names(depth39), "_iter"), `[[`, 1)
colnames(depth39)[1] 
depth39$seqdepth<-rep(colnames(depth39)[1], nrow(depth39))
depth39[,1:10]<-NULL
depth39$seqdepth<-str_remove_all(depth39$seqdepth, "[depth]")
depth39<-merge(depth39, metadata, by="row.names")
names(depth40)<-sapply(strsplit(names(depth40), "_iter"), `[[`, 1)
colnames(depth40)[1] 
depth40$seqdepth<-rep(colnames(depth40)[1], nrow(depth40))
depth40[,1:10]<-NULL
depth40$seqdepth<-str_remove_all(depth40$seqdepth, "[depth]")
depth40<-merge(depth40, metadata, by="row.names")
names(depth41)<-sapply(strsplit(names(depth41), "_iter"), `[[`, 1)
colnames(depth41)[1] 
depth41$seqdepth<-rep(colnames(depth41)[1], nrow(depth41))
depth41[,1:10]<-NULL
depth41$seqdepth<-str_remove_all(depth41$seqdepth, "[depth]")
depth41<-merge(depth41, metadata, by="row.names")
names(depth42)<-sapply(strsplit(names(depth42), "_iter"), `[[`, 1)
colnames(depth42)[1] 
depth42$seqdepth<-rep(colnames(depth42)[1], nrow(depth42))
depth42[,1:10]<-NULL
depth42$seqdepth<-str_remove_all(depth42$seqdepth, "[depth]")
depth42<-merge(depth42, metadata, by="row.names")
names(depth43)<-sapply(strsplit(names(depth43), "_iter"), `[[`, 1)
colnames(depth43)[1] 
depth43$seqdepth<-rep(colnames(depth43)[1], nrow(depth43))
depth43[,1:10]<-NULL
depth43$seqdepth<-str_remove_all(depth43$seqdepth, "[depth]")
depth43<-merge(depth43, metadata, by="row.names")
names(depth44)<-sapply(strsplit(names(depth44), "_iter"), `[[`, 1)
colnames(depth44)[1] 
depth44$seqdepth<-rep(colnames(depth44)[1], nrow(depth44))
depth44[,1:10]<-NULL
depth44$seqdepth<-str_remove_all(depth44$seqdepth, "[depth]")
depth44<-merge(depth44, metadata, by="row.names")
names(depth45)<-sapply(strsplit(names(depth45), "_iter"), `[[`, 1)
colnames(depth45)[1] 
depth45$seqdepth<-rep(colnames(depth45)[1], nrow(depth45))
depth45[,1:10]<-NULL
depth45$seqdepth<-str_remove_all(depth45$seqdepth, "[depth]")
depth45<-merge(depth45, metadata, by="row.names")
names(depth46)<-sapply(strsplit(names(depth46), "_iter"), `[[`, 1)
colnames(depth46)[1] 
depth46$seqdepth<-rep(colnames(depth46)[1], nrow(depth46))
depth46[,1:10]<-NULL
depth46$seqdepth<-str_remove_all(depth46$seqdepth, "[depth]")
depth46<-merge(depth46, metadata, by="row.names")
names(depth47)<-sapply(strsplit(names(depth47), "_iter"), `[[`, 1)
colnames(depth47)[1] 
depth47$seqdepth<-rep(colnames(depth47)[1], nrow(depth47))
depth47[,1:10]<-NULL
depth47$seqdepth<-str_remove_all(depth47$seqdepth, "[depth]")
depth47<-merge(depth47, metadata, by="row.names")
names(depth48)<-sapply(strsplit(names(depth48), "_iter"), `[[`, 1)
colnames(depth48)[1] 
depth48$seqdepth<-rep(colnames(depth48)[1], nrow(depth48))
depth48[,1:10]<-NULL
depth48$seqdepth<-str_remove_all(depth48$seqdepth, "[depth]")
depth48<-merge(depth48, metadata, by="row.names")
names(depth49)<-sapply(strsplit(names(depth49), "_iter"), `[[`, 1)
colnames(depth49)[1] 
depth49$seqdepth<-rep(colnames(depth49)[1], nrow(depth49))
depth49[,1:10]<-NULL
depth49$seqdepth<-str_remove_all(depth49$seqdepth, "[depth]")
depth49<-merge(depth49, metadata, by="row.names")
names(depth50)<-sapply(strsplit(names(depth50), "_iter"), `[[`, 1)
colnames(depth50)[1] 
depth50$seqdepth<-rep(colnames(depth50)[1], nrow(depth50))
depth50[,1:10]<-NULL
depth50$seqdepth<-str_remove_all(depth50$seqdepth, "[depth]")
depth50<-merge(depth50, metadata, by="row.names")
names(depth51)<-sapply(strsplit(names(depth51), "_iter"), `[[`, 1)
colnames(depth51)[1] 
depth51$seqdepth<-rep(colnames(depth51)[1], nrow(depth51))
depth51[,1:10]<-NULL
depth51$seqdepth<-str_remove_all(depth51$seqdepth, "[depth]")
depth51<-merge(depth51, metadata, by="row.names")
names(depth52)<-sapply(strsplit(names(depth52), "_iter"), `[[`, 1)
colnames(depth52)[1] 
depth52$seqdepth<-rep(colnames(depth52)[1], nrow(depth52))
depth52[,1:10]<-NULL
depth52$seqdepth<-str_remove_all(depth52$seqdepth, "[depth]")
depth52<-merge(depth52, metadata, by="row.names")
names(depth53)<-sapply(strsplit(names(depth53), "_iter"), `[[`, 1)
colnames(depth53)[1] 
depth53$seqdepth<-rep(colnames(depth53)[1], nrow(depth53))
depth53[,1:10]<-NULL
depth53$seqdepth<-str_remove_all(depth53$seqdepth, "[depth]")
depth53<-merge(depth53, metadata, by="row.names")
names(depth54)<-sapply(strsplit(names(depth54), "_iter"), `[[`, 1)
colnames(depth54)[1] 
depth54$seqdepth<-rep(colnames(depth54)[1], nrow(depth54))
depth54[,1:10]<-NULL
depth54$seqdepth<-str_remove_all(depth54$seqdepth, "[depth]")
depth54<-merge(depth54, metadata, by="row.names")
names(depth55)<-sapply(strsplit(names(depth55), "_iter"), `[[`, 1)
colnames(depth55)[1] 
depth55$seqdepth<-rep(colnames(depth55)[1], nrow(depth55))
depth55[,1:10]<-NULL
depth55$seqdepth<-str_remove_all(depth55$seqdepth, "[depth]")
depth55<-merge(depth55, metadata, by="row.names")
names(depth56)<-sapply(strsplit(names(depth56), "_iter"), `[[`, 1)
colnames(depth56)[1] 
depth56$seqdepth<-rep(colnames(depth56)[1], nrow(depth56))
depth56[,1:10]<-NULL
depth56$seqdepth<-str_remove_all(depth56$seqdepth, "[depth]")
depth56<-merge(depth56, metadata, by="row.names")
names(depth57)<-sapply(strsplit(names(depth57), "_iter"), `[[`, 1)
colnames(depth57)[1] 
depth57$seqdepth<-rep(colnames(depth57)[1], nrow(depth57))
depth57[,1:10]<-NULL
depth57$seqdepth<-str_remove_all(depth57$seqdepth, "[depth]")
depth57<-merge(depth57, metadata, by="row.names")
names(depth58)<-sapply(strsplit(names(depth58), "_iter"), `[[`, 1)
colnames(depth58)[1] 
depth58$seqdepth<-rep(colnames(depth58)[1], nrow(depth58))
depth58[,1:10]<-NULL
depth58$seqdepth<-str_remove_all(depth58$seqdepth, "[depth]")
depth58<-merge(depth58, metadata, by="row.names")
names(depth59)<-sapply(strsplit(names(depth59), "_iter"), `[[`, 1)
colnames(depth59)[1] 
depth59$seqdepth<-rep(colnames(depth59)[1], nrow(depth59))
depth59[,1:10]<-NULL
depth59$seqdepth<-str_remove_all(depth59$seqdepth, "[depth]")
depth59<-merge(depth59, metadata, by="row.names")
names(depth60)<-sapply(strsplit(names(depth60), "_iter"), `[[`, 1)
colnames(depth60)[1] 
depth60$seqdepth<-rep(colnames(depth60)[1], nrow(depth60))
depth60[,1:10]<-NULL
depth60$seqdepth<-str_remove_all(depth60$seqdepth, "[depth]")
depth60<-merge(depth60, metadata, by="row.names")
names(depth61)<-sapply(strsplit(names(depth61), "_iter"), `[[`, 1)
colnames(depth61)[1] 
depth61$seqdepth<-rep(colnames(depth61)[1], nrow(depth61))
depth61[,1:10]<-NULL
depth61$seqdepth<-str_remove_all(depth61$seqdepth, "[depth]")
depth61<-merge(depth61, metadata, by="row.names")
names(depth62)<-sapply(strsplit(names(depth62), "_iter"), `[[`, 1)
colnames(depth62)[1] 
depth62$seqdepth<-rep(colnames(depth62)[1], nrow(depth62))
depth62[,1:10]<-NULL
depth62$seqdepth<-str_remove_all(depth62$seqdepth, "[depth]")
depth62<-merge(depth62, metadata, by="row.names")
names(depth63)<-sapply(strsplit(names(depth63), "_iter"), `[[`, 1)
colnames(depth63)[1] 
depth63$seqdepth<-rep(colnames(depth63)[1], nrow(depth63))
depth63[,1:10]<-NULL
depth63$seqdepth<-str_remove_all(depth63$seqdepth, "[depth]")
depth63<-merge(depth63, metadata, by="row.names")
names(depth64)<-sapply(strsplit(names(depth64), "_iter"), `[[`, 1)
colnames(depth64)[1] 
depth64$seqdepth<-rep(colnames(depth64)[1], nrow(depth64))
depth64[,1:10]<-NULL
depth64$seqdepth<-str_remove_all(depth64$seqdepth, "[depth]")
depth64<-merge(depth64, metadata, by="row.names")
names(depth65)<-sapply(strsplit(names(depth65), "_iter"), `[[`, 1)
colnames(depth65)[1] 
depth65$seqdepth<-rep(colnames(depth65)[1], nrow(depth65))
depth65[,1:10]<-NULL
depth65$seqdepth<-str_remove_all(depth65$seqdepth, "[depth]")
depth65<-merge(depth65, metadata, by="row.names")
names(depth66)<-sapply(strsplit(names(depth66), "_iter"), `[[`, 1)
colnames(depth66)[1] 
depth66$seqdepth<-rep(colnames(depth66)[1], nrow(depth66))
depth66[,1:10]<-NULL
depth66$seqdepth<-str_remove_all(depth66$seqdepth, "[depth]")
depth66<-merge(depth66, metadata, by="row.names")
names(depth67)<-sapply(strsplit(names(depth67), "_iter"), `[[`, 1)
colnames(depth67)[1] 
depth67$seqdepth<-rep(colnames(depth67)[1], nrow(depth67))
depth67[,1:10]<-NULL
depth67$seqdepth<-str_remove_all(depth67$seqdepth, "[depth]")
depth67<-merge(depth67, metadata, by="row.names")
names(depth68)<-sapply(strsplit(names(depth68), "_iter"), `[[`, 1)
colnames(depth68)[1] 
depth68$seqdepth<-rep(colnames(depth68)[1], nrow(depth68))
depth68[,1:10]<-NULL
depth68$seqdepth<-str_remove_all(depth68$seqdepth, "[depth]")
depth68<-merge(depth68, metadata, by="row.names")
names(depth69)<-sapply(strsplit(names(depth69), "_iter"), `[[`, 1)
colnames(depth69)[1] 
depth69$seqdepth<-rep(colnames(depth69)[1], nrow(depth69))
depth69[,1:10]<-NULL
depth69$seqdepth<-str_remove_all(depth69$seqdepth, "[depth]")
depth69<-merge(depth69, metadata, by="row.names")
names(depth70)<-sapply(strsplit(names(depth70), "_iter"), `[[`, 1)
colnames(depth70)[1] 
depth70$seqdepth<-rep(colnames(depth70)[1], nrow(depth70))
depth70[,1:10]<-NULL
depth70$seqdepth<-str_remove_all(depth70$seqdepth, "[depth]")
depth70<-merge(depth70, metadata, by="row.names")
names(depth71)<-sapply(strsplit(names(depth71), "_iter"), `[[`, 1)
colnames(depth71)[1] 
depth71$seqdepth<-rep(colnames(depth71)[1], nrow(depth71))
depth71[,1:10]<-NULL
depth71$seqdepth<-str_remove_all(depth71$seqdepth, "[depth]")
depth71<-merge(depth71, metadata, by="row.names")
names(depth72)<-sapply(strsplit(names(depth72), "_iter"), `[[`, 1)
colnames(depth72)[1] 
depth72$seqdepth<-rep(colnames(depth72)[1], nrow(depth72))
depth72[,1:10]<-NULL
depth72$seqdepth<-str_remove_all(depth72$seqdepth, "[depth]")
depth72<-merge(depth72, metadata, by="row.names")
names(depth73)<-sapply(strsplit(names(depth73), "_iter"), `[[`, 1)
colnames(depth73)[1] 
depth73$seqdepth<-rep(colnames(depth73)[1], nrow(depth73))
depth73[,1:10]<-NULL
depth73$seqdepth<-str_remove_all(depth73$seqdepth, "[depth]")
depth73<-merge(depth73, metadata, by="row.names")
names(depth74)<-sapply(strsplit(names(depth74), "_iter"), `[[`, 1)
colnames(depth74)[1] 
depth74$seqdepth<-rep(colnames(depth74)[1], nrow(depth74))
depth74[,1:10]<-NULL
depth74$seqdepth<-str_remove_all(depth74$seqdepth, "[depth]")
depth74<-merge(depth74, metadata, by="row.names")
names(depth75)<-sapply(strsplit(names(depth75), "_iter"), `[[`, 1)
colnames(depth75)[1] 
depth75$seqdepth<-rep(colnames(depth75)[1], nrow(depth75))
depth75[,1:10]<-NULL
depth75$seqdepth<-str_remove_all(depth75$seqdepth, "[depth]")
depth75<-merge(depth75, metadata, by="row.names")
names(depth76)<-sapply(strsplit(names(depth76), "_iter"), `[[`, 1)
colnames(depth76)[1] 
depth76$seqdepth<-rep(colnames(depth76)[1], nrow(depth76))
depth76[,1:10]<-NULL
depth76$seqdepth<-str_remove_all(depth76$seqdepth, "[depth]")
depth76<-merge(depth76, metadata, by="row.names")
names(depth77)<-sapply(strsplit(names(depth77), "_iter"), `[[`, 1)
colnames(depth77)[1] 
depth77$seqdepth<-rep(colnames(depth77)[1], nrow(depth77))
depth77[,1:10]<-NULL
depth77$seqdepth<-str_remove_all(depth77$seqdepth, "[depth]")
depth77<-merge(depth77, metadata, by="row.names")
names(depth78)<-sapply(strsplit(names(depth78), "_iter"), `[[`, 1)
colnames(depth78)[1] 
depth78$seqdepth<-rep(colnames(depth78)[1], nrow(depth78))
depth78[,1:10]<-NULL
depth78$seqdepth<-str_remove_all(depth78$seqdepth, "[depth]")
depth78<-merge(depth78, metadata, by="row.names")
names(depth79)<-sapply(strsplit(names(depth79), "_iter"), `[[`, 1)
colnames(depth79)[1] 
depth79$seqdepth<-rep(colnames(depth79)[1], nrow(depth79))
depth79[,1:10]<-NULL
depth79$seqdepth<-str_remove_all(depth79$seqdepth, "[depth]")
depth79<-merge(depth79, metadata, by="row.names")
names(depth80)<-sapply(strsplit(names(depth80), "_iter"), `[[`, 1)
colnames(depth80)[1] 
depth80$seqdepth<-rep(colnames(depth80)[1], nrow(depth80))
depth80[,1:10]<-NULL
depth80$seqdepth<-str_remove_all(depth80$seqdepth, "[depth]")
depth80<-merge(depth80, metadata, by="row.names")
names(depth81)<-sapply(strsplit(names(depth81), "_iter"), `[[`, 1)
colnames(depth81)[1] 
depth81$seqdepth<-rep(colnames(depth81)[1], nrow(depth81))
depth81[,1:10]<-NULL
depth81$seqdepth<-str_remove_all(depth81$seqdepth, "[depth]")
depth81<-merge(depth81, metadata, by="row.names")
names(depth82)<-sapply(strsplit(names(depth82), "_iter"), `[[`, 1)
colnames(depth82)[1] 
depth82$seqdepth<-rep(colnames(depth82)[1], nrow(depth82))
depth82[,1:10]<-NULL
depth82$seqdepth<-str_remove_all(depth82$seqdepth, "[depth]")
depth82<-merge(depth82, metadata, by="row.names")
names(depth83)<-sapply(strsplit(names(depth83), "_iter"), `[[`, 1)
colnames(depth83)[1] 
depth83$seqdepth<-rep(colnames(depth83)[1], nrow(depth83))
depth83[,1:10]<-NULL
depth83$seqdepth<-str_remove_all(depth83$seqdepth, "[depth]")
depth83<-merge(depth83, metadata, by="row.names")
names(depth84)<-sapply(strsplit(names(depth84), "_iter"), `[[`, 1)
colnames(depth84)[1] 
depth84$seqdepth<-rep(colnames(depth84)[1], nrow(depth84))
depth84[,1:10]<-NULL
depth84$seqdepth<-str_remove_all(depth84$seqdepth, "[depth]")
depth84<-merge(depth84, metadata, by="row.names")
names(depth85)<-sapply(strsplit(names(depth85), "_iter"), `[[`, 1)
colnames(depth85)[1] 
depth85$seqdepth<-rep(colnames(depth85)[1], nrow(depth85))
depth85[,1:10]<-NULL
depth85$seqdepth<-str_remove_all(depth85$seqdepth, "[depth]")
depth85<-merge(depth85, metadata, by="row.names")
names(depth86)<-sapply(strsplit(names(depth86), "_iter"), `[[`, 1)
colnames(depth86)[1] 
depth86$seqdepth<-rep(colnames(depth86)[1], nrow(depth86))
depth86[,1:10]<-NULL
depth86$seqdepth<-str_remove_all(depth86$seqdepth, "[depth]")
depth86<-merge(depth86, metadata, by="row.names")
names(depth87)<-sapply(strsplit(names(depth87), "_iter"), `[[`, 1)
colnames(depth87)[1] 
depth87$seqdepth<-rep(colnames(depth87)[1], nrow(depth87))
depth87[,1:10]<-NULL
depth87$seqdepth<-str_remove_all(depth87$seqdepth, "[depth]")
depth87<-merge(depth87, metadata, by="row.names")
names(depth88)<-sapply(strsplit(names(depth88), "_iter"), `[[`, 1)
colnames(depth88)[1] 
depth88$seqdepth<-rep(colnames(depth88)[1], nrow(depth88))
depth88[,1:10]<-NULL
depth88$seqdepth<-str_remove_all(depth88$seqdepth, "[depth]")
depth88<-merge(depth88, metadata, by="row.names")
names(depth89)<-sapply(strsplit(names(depth89), "_iter"), `[[`, 1)
colnames(depth89)[1] 
depth89$seqdepth<-rep(colnames(depth89)[1], nrow(depth89))
depth89[,1:10]<-NULL
depth89$seqdepth<-str_remove_all(depth89$seqdepth, "[depth]")
depth89<-merge(depth89, metadata, by="row.names")
names(depth90)<-sapply(strsplit(names(depth90), "_iter"), `[[`, 1)
colnames(depth90)[1] 
depth90$seqdepth<-rep(colnames(depth90)[1], nrow(depth90))
depth90[,1:10]<-NULL
depth90$seqdepth<-str_remove_all(depth90$seqdepth, "[depth]")
depth90<-merge(depth90, metadata, by="row.names")
names(depth91)<-sapply(strsplit(names(depth91), "_iter"), `[[`, 1)
colnames(depth91)[1] 
depth91$seqdepth<-rep(colnames(depth91)[1], nrow(depth91))
depth91[,1:10]<-NULL
depth91$seqdepth<-str_remove_all(depth91$seqdepth, "[depth]")
depth91<-merge(depth91, metadata, by="row.names")
names(depth92)<-sapply(strsplit(names(depth92), "_iter"), `[[`, 1)
colnames(depth92)[1] 
depth92$seqdepth<-rep(colnames(depth92)[1], nrow(depth92))
depth92[,1:10]<-NULL
depth92$seqdepth<-str_remove_all(depth92$seqdepth, "[depth]")
depth92<-merge(depth92, metadata, by="row.names")
names(depth93)<-sapply(strsplit(names(depth93), "_iter"), `[[`, 1)
colnames(depth93)[1] 
depth93$seqdepth<-rep(colnames(depth93)[1], nrow(depth93))
depth93[,1:10]<-NULL
depth93$seqdepth<-str_remove_all(depth93$seqdepth, "[depth]")
depth93<-merge(depth93, metadata, by="row.names")
names(depth94)<-sapply(strsplit(names(depth94), "_iter"), `[[`, 1)
colnames(depth94)[1] 
depth94$seqdepth<-rep(colnames(depth94)[1], nrow(depth94))
depth94[,1:10]<-NULL
depth94$seqdepth<-str_remove_all(depth94$seqdepth, "[depth]")
depth94<-merge(depth94, metadata, by="row.names")
names(depth95)<-sapply(strsplit(names(depth95), "_iter"), `[[`, 1)
colnames(depth95)[1] 
depth95$seqdepth<-rep(colnames(depth95)[1], nrow(depth95))
depth95[,1:10]<-NULL
depth95$seqdepth<-str_remove_all(depth95$seqdepth, "[depth]")
depth95<-merge(depth95, metadata, by="row.names")
names(depth96)<-sapply(strsplit(names(depth96), "_iter"), `[[`, 1)
colnames(depth96)[1] 
depth96$seqdepth<-rep(colnames(depth96)[1], nrow(depth96))
depth96[,1:10]<-NULL
depth96$seqdepth<-str_remove_all(depth96$seqdepth, "[depth]")
depth96<-merge(depth96, metadata, by="row.names")
names(depth97)<-sapply(strsplit(names(depth97), "_iter"), `[[`, 1)
colnames(depth97)[1] 
depth97$seqdepth<-rep(colnames(depth97)[1], nrow(depth97))
depth97[,1:10]<-NULL
depth97$seqdepth<-str_remove_all(depth97$seqdepth, "[depth]")
depth97<-merge(depth97, metadata, by="row.names")
names(depth98)<-sapply(strsplit(names(depth98), "_iter"), `[[`, 1)
colnames(depth98)[1] 
depth98$seqdepth<-rep(colnames(depth98)[1], nrow(depth98))
depth98[,1:10]<-NULL
depth98$seqdepth<-str_remove_all(depth98$seqdepth, "[depth]")
depth98<-merge(depth98, metadata, by="row.names")
names(depth99)<-sapply(strsplit(names(depth99), "_iter"), `[[`, 1)
colnames(depth99)[1] 
depth99$seqdepth<-rep(colnames(depth99)[1], nrow(depth99))
depth99[,1:10]<-NULL
depth99$seqdepth<-str_remove_all(depth99$seqdepth, "[depth]")
depth99<-merge(depth99, metadata, by="row.names")
names(depth100)<-sapply(strsplit(names(depth100), "_iter"), `[[`, 1)
colnames(depth100)[1] 
depth100$seqdepth<-rep(colnames(depth100)[1], nrow(depth100))
depth100[,1:10]<-NULL
depth100$seqdepth<-str_remove_all(depth100$seqdepth, "[depth]")
depth100<-merge(depth100, metadata, by="row.names")
d1<-rbind(depth1,depth2)
d2<-rbind(d1,depth3)
d3<-rbind(d2,depth4)
d4<-rbind(d3,depth5)
d5<-rbind(d4,depth6)
d6<-rbind(d5,depth7)
d7<-rbind(d6,depth8)
d8<-rbind(d7,depth9)
d9<-rbind(d8,depth10)
d10<-rbind(d9,depth11)
d11<-rbind(d10,depth12)
d12<-rbind(d11,depth13)
d13<-rbind(d12,depth14)
d14<-rbind(d13,depth15)
d15<-rbind(d14,depth16)
d16<-rbind(d15,depth17)
d17<-rbind(d16,depth18)
d18<-rbind(d17,depth19)
d19<-rbind(d18,depth20)
d20<-rbind(d19,depth21)
d21<-rbind(d20,depth22)
d22<-rbind(d21,depth23)
d23<-rbind(d22,depth24)
d24<-rbind(d23,depth25)
d25<-rbind(d24,depth26)
d26<-rbind(d25,depth27)
d27<-rbind(d26,depth28)
d28<-rbind(d27,depth29)
d29<-rbind(d28,depth30)
d30<-rbind(d29,depth31)
d31<-rbind(d30,depth32)
d32<-rbind(d31,depth33)
d33<-rbind(d32,depth34)
d34<-rbind(d33,depth35)
d35<-rbind(d34,depth36)
d36<-rbind(d35,depth37)
d37<-rbind(d36,depth38)
d38<-rbind(d37,depth39)
d39<-rbind(d38,depth40)
d40<-rbind(d39,depth41)
d41<-rbind(d40,depth42)
d42<-rbind(d41,depth43)
d43<-rbind(d42,depth44)
d44<-rbind(d43,depth45)
d45<-rbind(d44,depth46)
d46<-rbind(d45,depth47)
d47<-rbind(d46,depth48)
d48<-rbind(d47,depth49)
d49<-rbind(d48,depth50)
d50<-rbind(d49,depth51)
d51<-rbind(d50,depth52)
d52<-rbind(d51,depth53)
d53<-rbind(d52,depth54)
d54<-rbind(d53,depth55)
d55<-rbind(d54,depth56)
d56<-rbind(d55,depth57)
d57<-rbind(d56,depth58)
d58<-rbind(d57,depth59)
d59<-rbind(d58,depth60)
d60<-rbind(d59,depth61)
d61<-rbind(d60,depth62)
d62<-rbind(d61,depth63)
d63<-rbind(d62,depth64)
d64<-rbind(d63,depth65)
d65<-rbind(d64,depth66)
d66<-rbind(d65,depth67)
d67<-rbind(d66,depth68)
d68<-rbind(d67,depth69)
d69<-rbind(d68,depth70)
d70<-rbind(d69,depth71)
d71<-rbind(d70,depth72)
d72<-rbind(d71,depth73)
d73<-rbind(d72,depth74)
d74<-rbind(d73,depth75)
d75<-rbind(d74,depth76)
d76<-rbind(d75,depth77)
d77<-rbind(d76,depth78)
d78<-rbind(d77,depth79)
d79<-rbind(d78,depth80)
d80<-rbind(d79,depth81)
d81<-rbind(d80,depth82)
d82<-rbind(d81,depth83)
d83<-rbind(d82,depth84)
d84<-rbind(d83,depth85)
d85<-rbind(d84,depth86)
d86<-rbind(d85,depth87)
d87<-rbind(d86,depth88)
d88<-rbind(d87,depth89)
d89<-rbind(d88,depth90)
d90<-rbind(d89,depth91)
d91<-rbind(d90,depth92)
d92<-rbind(d91,depth93)
d93<-rbind(d92,depth94)
d94<-rbind(d93,depth95)
d95<-rbind(d94,depth96)
d96<-rbind(d95,depth97)
d97<-rbind(d96,depth98)
d98<-rbind(d97,depth99)
d99<-rbind(d98,depth100)
names(d99)[1] <- "SampleID"
names(d99)[names(d99) == "mean"] <- "observedASVs"
d99$seqdepth<-as.numeric(d99$seqdepth)
write.table(d99, file = "raref.txt",sep="\t",col.names= T, row.names=F)
quit("no")