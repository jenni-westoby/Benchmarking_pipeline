RSEM_TPM<-read.table("RSEM_TPM_sorted.txt", row.names=1, header=T)
row.names(RSEM_TPM)<-gsub("_.*", "", row.names(RSEM_TPM))

truth_TPM<-read.table("ground_truth_TPM_sorted.txt", row.names=1, header=T)
express_TPM<-read.table("eXpress_tpm_sorted.txt", row.names=1, header=T)
kallisto_TPM<-read.table("kallisto_tpm_sorted.txt", row.names=1, header=T)
SAlign_TPM<-read.table("Salmon_Alignment_TPM_tidy_sorted.txt", row.names=1, header=T)
SQuasi_TPM<-read.table("Salmon_Quasi_TPM_sorted.txt", row.names=1, header=T)
SSMEM_TPM<-read.table("Salmon_SMEM_TPM_sorted.txt", row.names=1, header=T)

RSEM_Counts<-read.table("RSEM_counts_sorted.txt", row.names=1, header=T)
row.names(RSEM_Counts)<-gsub("_.*", "", row.names(RSEM_Counts))

truth_Counts<-read.table("ground_truth_counts_sorted.txt", row.names=1, header=T)
express_Counts<-read.table("eXpress_counts_sorted.txt", row.names=1, header=T)
kallisto_Counts<-read.table("kallisto_counts_sorted.txt", row.names=1, header=T)

RSEM_fpkm<-read.table("RSEM_FPKM_sorted.txt", row.names=1, header=T)
row.names(RSEM_fpkm)<-gsub("_.*", "", row.names(RSEM_fpkm))

truth_fpkm<-read.table("ground_truth_FPKM_sorted.txt", row.names=1, header=T)
express_fpkm<-read.table("eXpress_fpkm_sorted.txt", row.names=1, header=T)

truth_TPM<-transform(truth_TPM, mean=rowMeans(truth_TPM))

hundred_truth_TPM<-truth_TPM[-which(apply(truth_TPM, 1, function(x)sum(x!=0))==86),]
zeros<-truth_TPM[ rowSums(truth_TPM ==0) == 86, ]
hundred_truth_TPM<-subset(truth_TPM, !(rownames(truth_TPM) %in% rownames(zeros)))
hundred_RSEM_TPM<-subset(RSEM_TPM, !(rownames(RSEM_TPM) %in% rownames(zeros)))
hundred_express_TPM<-subset(express_TPM, !(rownames(express_TPM) %in% rownames(zeros)))
hundred_kallisto_TPM<-subset(kallisto_TPM, !(rownames(kallisto_TPM) %in% rownames(zeros)))
hundred_SAlign_TPM<-subset(SAlign_TPM, !(rownames(SAlign_TPM) %in% rownames(zeros)))
hundred_SQuasi_TPM<-subset(SQuasi_TPM, !(rownames(SQuasi_TPM) %in% rownames(zeros)))
hundred_SSMEM_TPM<-subset(SSMEM_TPM, !(rownames(SSMEM_TPM) %in% rownames(zeros)))

eighty<-truth_TPM[ rowSums(truth_TPM ==0) >= 69, ]
eighty_truth_TPM<-subset(truth_TPM, !(rownames(truth_TPM) %in% rownames(eighty)))
eighty_RSEM_TPM<-subset(RSEM_TPM, !(rownames(RSEM_TPM) %in% rownames(eighty)))
eighty_express_TPM<-subset(express_TPM, !(rownames(express_TPM) %in% rownames(eighty)))
eighty_kallisto_TPM<-subset(kallisto_TPM, !(rownames(kallisto_TPM) %in% rownames(eighty)))
eighty_SAlign_TPM<-subset(SAlign_TPM, !(rownames(SAlign_TPM) %in% rownames(eighty)))
eighty_SQuasi_TPM<-subset(SQuasi_TPM, !(rownames(SQuasi_TPM) %in% rownames(eighty)))
eighty_SSMEM_TPM<-subset(SSMEM_TPM, !(rownames(SSMEM_TPM) %in% rownames(eighty)))

sixty<-truth_TPM[ rowSums(truth_TPM ==0) >= 52, ]
sixty_truth_TPM<-subset(truth_TPM, !(rownames(truth_TPM) %in% rownames(sixty)))
sixty_RSEM_TPM<-subset(RSEM_TPM, !(rownames(RSEM_TPM) %in% rownames(sixty)))
sixty_express_TPM<-subset(express_TPM, !(rownames(express_TPM) %in% rownames(sixty)))
sixty_kallisto_TPM<-subset(kallisto_TPM, !(rownames(kallisto_TPM) %in% rownames(sixty)))
sixty_SAlign_TPM<-subset(SAlign_TPM, !(rownames(SAlign_TPM) %in% rownames(sixty)))
sixty_SQuasi_TPM<-subset(SQuasi_TPM, !(rownames(SQuasi_TPM) %in% rownames(sixty)))
sixty_SSMEM_TPM<-subset(SSMEM_TPM, !(rownames(SSMEM_TPM) %in% rownames(sixty)))

forty<-truth_TPM[ rowSums(truth_TPM ==0) >= 35, ]
forty_truth_TPM<-subset(truth_TPM, !(rownames(truth_TPM) %in% rownames(forty)))
forty_RSEM_TPM<-subset(RSEM_TPM, !(rownames(RSEM_TPM) %in% rownames(forty)))
forty_express_TPM<-subset(express_TPM, !(rownames(express_TPM) %in% rownames(forty)))
forty_kallisto_TPM<-subset(kallisto_TPM, !(rownames(kallisto_TPM) %in% rownames(forty)))
forty_SAlign_TPM<-subset(SAlign_TPM, !(rownames(SAlign_TPM) %in% rownames(forty)))
forty_SQuasi_TPM<-subset(SQuasi_TPM, !(rownames(SQuasi_TPM) %in% rownames(forty)))
forty_SSMEM_TPM<-subset(SSMEM_TPM, !(rownames(SSMEM_TPM) %in% rownames(forty)))

twenty<-truth_TPM[ rowSums(truth_TPM ==0) >= 18, ]
twenty_truth_TPM<-subset(truth_TPM, !(rownames(truth_TPM) %in% rownames(twenty)))
twenty_RSEM_TPM<-subset(RSEM_TPM, !(rownames(RSEM_TPM) %in% rownames(twenty)))
twenty_express_TPM<-subset(express_TPM, !(rownames(express_TPM) %in% rownames(twenty)))
twenty_kallisto_TPM<-subset(kallisto_TPM, !(rownames(kallisto_TPM) %in% rownames(twenty)))
twenty_SAlign_TPM<-subset(SAlign_TPM, !(rownames(SAlign_TPM) %in% rownames(twenty)))
twenty_SQuasi_TPM<-subset(SQuasi_TPM, !(rownames(SQuasi_TPM) %in% rownames(twenty)))
twenty_SSMEM_TPM<-subset(SSMEM_TPM, !(rownames(SSMEM_TPM) %in% rownames(twenty)))

zeros<-truth_TPM[ rowSums(truth_TPM ==0) >= 1, ]
zero_truth_TPM<-subset(truth_TPM, !(rownames(truth_TPM) %in% rownames(zeros)))
zero_RSEM_TPM<-subset(RSEM_TPM, !(rownames(RSEM_TPM) %in% rownames(zeros)))
zero_express_TPM<-subset(express_TPM, !(rownames(express_TPM) %in% rownames(zeros)))
zero_kallisto_TPM<-subset(kallisto_TPM, !(rownames(kallisto_TPM) %in% rownames(zeros)))
zero_SAlign_TPM<-subset(SAlign_TPM, !(rownames(SAlign_TPM) %in% rownames(zeros)))
zero_SQuasi_TPM<-subset(SQuasi_TPM, !(rownames(SQuasi_TPM) %in% rownames(zeros)))
zero_SSMEM_TPM<-subset(SSMEM_TPM, !(rownames(SSMEM_TPM) %in% rownames(zeros)))

correlation<-function(x,y) {
        (diag(cor(y,x,method="spearman")))
}

hundred_RSEM_cor<-correlation(hundred_RSEM_TPM, hundred_truth_TPM)
hundred_express_cor<-correlation(hundred_express_TPM, hundred_truth_TPM)
hundred_kallisto_cor<-correlation(hundred_kallisto_TPM, hundred_truth_TPM)
hundred_SAlign_cor<-correlation(hundred_SAlign_TPM, hundred_truth_TPM)
hundred_SQuasi_cor<-correlation(hundred_SQuasi_TPM, hundred_truth_TPM)
hundred_SSMEM_cor<-correlation(hundred_SSMEM_TPM, hundred_truth_TPM)
correlation<-function(x,y) {
        (diag(cor(y,x,method="spearman")))
}

hundred_RSEM_cor<-correlation(hundred_RSEM_TPM, hundred_truth_TPM)
hundred_express_cor<-correlation(hundred_express_TPM, hundred_truth_TPM)
hundred_kallisto_cor<-correlation(hundred_kallisto_TPM, hundred_truth_TPM)
hundred_SAlign_cor<-correlation(hundred_SAlign_TPM, hundred_truth_TPM)
hundred_SQuasi_cor<-correlation(hundred_SQuasi_TPM, hundred_truth_TPM)
hundred_SSMEM_cor<-correlation(hundred_SSMEM_TPM, hundred_truth_TPM)

eighty_RSEM_cor<-correlation(eighty_RSEM_TPM, eighty_truth_TPM)
eighty_express_cor<-correlation(eighty_express_TPM, eighty_truth_TPM)
eighty_kallisto_cor<-correlation(eighty_kallisto_TPM, eighty_truth_TPM)
eighty_SAlign_cor<-correlation(eighty_SAlign_TPM, eighty_truth_TPM)
eighty_SQuasi_cor<-correlation(eighty_SQuasi_TPM, eighty_truth_TPM)
eighty_SSMEM_cor<-correlation(eighty_SSMEM_TPM, eighty_truth_TPM)

sixty_RSEM_cor<-correlation(sixty_RSEM_TPM, sixty_truth_TPM)
sixty_express_cor<-correlation(sixty_express_TPM, sixty_truth_TPM)
sixty_kallisto_cor<-correlation(sixty_kallisto_TPM, sixty_truth_TPM)
sixty_SAlign_cor<-correlation(sixty_SAlign_TPM, sixty_truth_TPM)
sixty_SQuasi_cor<-correlation(sixty_SQuasi_TPM, sixty_truth_TPM)
sixty_SSMEM_cor<-correlation(sixty_SSMEM_TPM, sixty_truth_TPM)

forty_RSEM_cor<-correlation(forty_RSEM_TPM, forty_truth_TPM)
forty_express_cor<-correlation(forty_express_TPM, forty_truth_TPM)
forty_kallisto_cor<-correlation(forty_kallisto_TPM, forty_truth_TPM)
forty_SAlign_cor<-correlation(forty_SAlign_TPM, forty_truth_TPM)
forty_SQuasi_cor<-correlation(forty_SQuasi_TPM, forty_truth_TPM)
forty_SSMEM_cor<-correlation(forty_SSMEM_TPM, forty_truth_TPM)

twenty_RSEM_cor<-correlation(twenty_RSEM_TPM, twenty_truth_TPM)
twenty_express_cor<-correlation(twenty_express_TPM, twenty_truth_TPM)
twenty_kallisto_cor<-correlation(twenty_kallisto_TPM, twenty_truth_TPM)
twenty_SAlign_cor<-correlation(twenty_SAlign_TPM, twenty_truth_TPM)
twenty_SQuasi_cor<-correlation(twenty_SQuasi_TPM, twenty_truth_TPM)
twenty_SSMEM_cor<-correlation(twenty_SSMEM_TPM, twenty_truth_TPM)

zero_RSEM_cor<-correlation(zero_RSEM_TPM, zero_truth_TPM)
zero_express_cor<-correlation(zero_express_TPM, zero_truth_TPM)
zero_kallisto_cor<-correlation(zero_kallisto_TPM, zero_truth_TPM)
zero_SAlign_cor<-correlation(zero_SAlign_TPM, zero_truth_TPM)
zero_SQuasi_cor<-correlation(zero_SQuasi_TPM, zero_truth_TPM)
zero_SSMEM_cor<-correlation(zero_SSMEM_TPM, zero_truth_TPM)

cor<-matrix(c(100, mean(hundred_RSEM_cor), mean(hundred_express_cor), mean(hundred_kallisto_cor), mean(hundred_SAlign_cor), mean(hundred_SQuasi_cor), mean(hundred_SSMEM_cor), 80, mean(eighty_RSEM_cor), mean(eighty_express_cor), mean(eighty_kallisto_cor), mean(eighty_SAlign_cor), mean(eighty_SQuasi_cor), mean(eighty_SSMEM_cor), 60, mean(sixty_RSEM_cor), mean(sixty_express_cor), mean(sixty_kallisto_cor), mean(sixty_SAlign_cor), mean(sixty_SQuasi_cor), mean(sixty_SSMEM_cor), 40, mean(forty_RSEM_cor), mean(forty_express_cor), mean(forty_kallisto_cor), mean(forty_SAlign_cor), mean(forty_SQuasi_cor), mean(forty_SSMEM_cor), 20, mean(twenty_RSEM_cor), mean(twenty_express_cor), mean(twenty_kallisto_cor), mean(twenty_SAlign_cor), mean(twenty_SQuasi_cor), mean(twenty_SSMEM_cor), 0, mean(zero_RSEM_cor), mean(zero_express_cor), mean(zero_kallisto_cor), mean(zero_SAlign_cor), mean(zero_SQuasi_cor), mean(zero_SSMEM_cor)), ncol=7, byrow=T)
colnames(cor) <- c("percent", "RSEM", "eXpress", "Kallisto", "Salmon Align", "Salmon Quasi", "Salmon SMEM")
RSEmsd<-c(sd(hundred_RSEM_cor), sd(eighty_RSEM_cor), sd(sixty_RSEM_cor), sd(forty_RSEM_cor), sd(twenty_RSEM_cor), sd(zero_RSEM_cor))
expresssd<-c(sd(hundred_express_cor), sd(eighty_express_cor), sd(sixty_express_cor), sd(forty_express_cor), sd(twenty_express_cor), sd(zero_express_cor))
kallistosd<-c(sd(hundred_kallisto_cor), sd(eighty_kallisto_cor), sd(sixty_kallisto_cor), sd(forty_kallisto_cor), sd(twenty_kallisto_cor), sd(zero_kallisto_cor))
SAlignsd<-c(sd(hundred_SAlign_cor), sd(eighty_SAlign_cor), sd(sixty_SAlign_cor), sd(forty_SAlign_cor), sd(twenty_SAlign_cor), sd(zero_SAlign_cor))
SQuasisd<-c(sd(hundred_SQuasi_cor), sd(eighty_SQuasi_cor), sd(sixty_SQuasi_cor), sd(forty_SQuasi_cor), sd(twenty_SQuasi_cor), sd(zero_SQuasi_cor))
SSMEMsd<-c(sd(hundred_SSMEM_cor), sd(eighty_SSMEM_cor), sd(sixty_SSMEM_cor), sd(forty_SSMEM_cor), sd(twenty_SSMEM_cor), sd(zero_SSMEM_cor))
cor<-cbind(cor, expresssd)
cor<-cbind(cor, kallistosd)
cor<-cbind(cor, SAlignsd)
cor<-cbind(cor, SQuasisd)
cor<-cbind(cor, SSMEMsd)

dev.new()
pdf("Spearmansrhodrop.pdf")
y<-0:100
plot(cor[,"RSEM"]~cor[,"percent"], type="l", ylim=c(0.75, 1), xlim=rev(range(y)), yaxs="i", xaxs="i", ylab="Spearman's Rho", col="#2C2C8D", xlab="Threshold Percentage of Dropouts Used as Filter", main="Spearman's Rho When a Threshold Percentage\nof Dropouts are Used as a Filter")
lines(cor[,"eXpress"]~cor[,"percent"], col="#6A6A39")
lines(cor[,"Kallisto"]~cor[,"percent"],  col='#949405')
lines(cor[,"Salmon Align"]~cor[,"percent"],  col="#D0D0D0" )
lines(cor[,"Salmon Quasi"]~cor[,"percent"],  col="#A5A5FD")
lines(cor[,"Salmon SMEM"]~cor[,"percent"],  col="#2C2C2C")
arrows(cor[,"percent"], cor[,"RSEM"]-cor[,"RSEmsd"], cor[,"percent"], cor[,"RSEM"]+cor[, "RSEmsd"], length=0.05, angle=90, code=3, col="#2C2C8D")
arrows(cor[,"percent"], cor[,"eXpress"]-cor[,"expresssd"], cor[,"percent"], cor[,"eXpress"]+cor[, "expresssd"], length=0.05, angle=90, code=3, col="#6A6A39")
arrows(cor[,"percent"], cor[,"Kallisto"]-cor[,"kallistosd"], cor[,"percent"], cor[,"Kallisto"]+cor[, "kallistosd"], length=0.05, angle=90, code=3, col='#949405')
arrows(cor[,"percent"], cor[,"Salmon Align"]-cor[,"SAlignsd"], cor[,"percent"], cor[,"Salmon Align"]+cor[, "SAlignsd"], length=0.05, angle=90, code=3, col="#D0D0D0")
arrows(cor[,"percent"], cor[,"Salmon Quasi"]-cor[,"SQuasisd"], cor[,"percent"], cor[,"Salmon Quasi"]+cor[, "SQuasisd"], length=0.05, angle=90, code=3, col="#A5A5FD")
arrows(cor[,"percent"], cor[,"Salmon SMEM"]-cor[,"SSMEMsd"], cor[,"percent"], cor[,"Salmon SMEM"]+cor[, "SSMEMsd"], length=0.05, angle=90, code=3, col="#2C2C2C")
legend(legend=c("RSEM", "eXpress","Kallisto", "Salmon Align", "Salmon Quasi", "Salmon SMEM"), fill=c("#2C2C8D", "#6A6A39",'#949405', "#D0D0D0", "#A5A5FD","#2C2C2C"  ), "bottomright")
dev.off()




nms_RSEM_TPM<-nrmse(filter_truth_TPM, filter_RSEM_TPM)
nms_express_TPM<-nrmse(filter_truth_TPM, filter_express_TPM)
nms_kallisto_TPM<-nrmse(filter_truth_TPM, filter_kallisto_TPM)
nms_SAlign_TPM<-nrmse(filter_truth_TPM, filter_SAlign_TPM)
nms_SQuasi_TPM<-nrmse(filter_truth_TPM, filter_SQuasi_TPM)
nms_SSMEM_TPM<-nrmse(filter_truth_TPM, filter_SSMEM_TPM)


dev.new()
pdf("zerofilteredTPMnmse.pdf")
par(mar=c(9, 4, 4,2))
boxplot(nms_RSEM_TPM, nms_express_TPM, nms_kallisto_TPM, nms_SAlign_TPM, nms_SSMEM_TPM, nms_SQuasi_TPM, las=2, names=c("RSEM", "eXpress", "Kallisto", "Salmon Align", "Salmon SMEM", "Salmon quasi"), ylab="Normalised Mean Square Error", main="Boxplot of Normalised Mean Square Error Between Ground Truth TPM and TPM\nEstimated by Isoform Quantification Tools When Unexpressed Transcripts Are Removed", cex.main=0.9)
mtext(side=1, line=7, text="Tools")
dev.off()

dev.new()
pdf("zerofilteredTPM.pdf")
par(mar=c(9, 4, 4,2))
boxplot(RSEM_cor, express_cor, kallisto_cor, SAlign_cor, SSMEM_cor, SQuasi_cor, las=2, names=c("RSEM", "eXpress", "Kallisto", "Salmon Align", "Salmon SMEM", "Salmon Quasi"), ylab="Spearman's Rank Correlation Coefficient", main="Boxplot of Spearman's Rank Correlation Coefficient Between Ground Truth TPM and TPM\nEstimated by Isoform Quantification Tools When Unexpressed Transcripts Are Removed", cex.main=0.9)
mtext(side=1, line=7, text="Tools")
dev.off()

filter_RSEM_TPM<-RSEM_TPM[rownames(RSEM_TPM) %in% rownames(filter_truth_TPM), ]
barplot(counts, main="Mean Spearman's Rank Correlation Coefficient Between Ground Truth Counts\n and Counts Estimated by Isoform Quantification Tools", xlab="Tools", ylab="Spearman's Rank Corre
lation Coefficient", names.arg=c("kallisto","RSEM","eXpress"), ylim=c(0,1
), cex.main=1)

> dev.new()
> pdf("time2.pdf")
> par(mar=c(9,4,4,2))
> barplot(as.matrix(time), las = 2, names.arg =c("eXpress", "RSEM", "Kallisto", "Salmon Align", "Salmon Quasi", "Salmon SMEM"),  main="Time Spent Aligning Reads and Quantifying Expression\n By Isoform Quantification Tools", ylab="Time in seconds", col=c("grey30","grey"))
> mtext("Tools", side =1, line =7)
> legend("topright", legend=c("Time spent Quantifying Reads","Time spent Aligning Reads"), fill=c("grey", "grey30"))> dev.off()

> dev.new()
> pdf("FPKM_boxplots.pdf")
> par(mar=c(9, 4, 4,2))
> boxplot(RSEM_fpkm_cor, express_fpkm_cor, las=2, names=c("RSEM", "eXpress"), ylab="Spearman's Rank Correlation Coefficent", main="Boxplot of Spearman's Rank Correlation Coefficient Between Ground Truth FPKM\n and FPKM Estimated by Isoform Quantification Tools", cex.main=1)
> mtext(side=1, line=7, text="Tools")
> dev.off()

 dev.new()
 pdf("nmse_TPM.pdf")
par(mar=c(9, 4, 4,2))
boxplot(nms_RSEM_TPM, nms_eXpress_TPM, nms_Kallisto_TPM, nms_SAlign_TPM, nms_Ssmem_TPM, nms_Squasi_TPM, las=2, names=c("RSEM", "eXpress", "Kallisto", "Salmon Align", "Salmon SMEM", "Salmon quasi"), ylab="Normalised Mean Square Error", main="Boxplot of Normalised Mean Square Error Between TPM Estimated\n by Isoform Quantification Tools and Ground Truth TPM", cex.main=1)
mtext(side=1, line=7, text="Tools")
dev.off()


 dev.new()
 pdf("nmse_counts.pdf")
par(mar=c(9, 4, 4,2))
 boxplot(nms_rsem_counts, nms_eXpress_counts,nms_kallisto_counts, las=2, names=c("RSEM", "eXpress", "Kallisto"), ylab="Normalised Mean Square Error", main="Boxplot of Normalised Mean Square Error Between Counts Estimated\n by Isoform Quantification Tools and Ground Truth Counts", cex.main=1)
mtext(side=1, line=7, text="Tools")
dev.off()

 dev.new()
 pdf("nmse_fpkm.pdf")
par(mar=c(9, 4, 4,2))
 boxplot(nms_rsem_fpkm, nms_express_fpkm, las=2, names=c("RSEM", "eXpress"), ylab="Normalised Mean Square Error", main="Boxplot of Normalised Mean Square Error Between FPKM Estimated\n by Isoform Quantification Tools and Ground Truth FPKM", cex.main=1)
mtext(side=1, line=7, text="Tools")
dev.off()
