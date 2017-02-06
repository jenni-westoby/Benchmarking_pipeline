#!/usr/bin/Rscript

#prior to logging in to R, need to generate anno.txt, a txt file with the names of all the samples in a column

library(scater, quietly = TRUE)
library(knitr)
options(stringsAsFactors = FALSE)

molecules <- read.table("isoform2.csv", sep="\t", header=T)
molecules <- data.frame(molecules[,-1], row.names=molecules[,1])

anno <- read.table("anno.txt", sep = "\t", header = TRUE)
#remember to make rownames
rownames(anno)<-anno$V31

pheno_data <- new("AnnotatedDataFrame", anno)
rownames(pheno_data) <- pheno_data$V1
umi <- scater::newSCESet(
     countData = data.frame(molecules),
     phenoData = pheno_data
)

keep_feature <- rowSums(counts(umi) > 0) > 0
umi <- umi[keep_feature, ]

umi <- scater::calculateQCMetrics(
    umi)
