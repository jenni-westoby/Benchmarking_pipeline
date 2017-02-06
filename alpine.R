source("https://bioconductor.org/biocLite.R")
biocLite("alpine")
vignette("alpine")
biocLite("alpineData")
library("alpineData")
library(GenomicAlignments)

#Note - the chunk of code below is specific to the tutorial and should not be run on my own data

dir <- system.file("extdata",package="alpineData")
metadata <- read.csv(file.path(dir,"metadata.csv"),
                     stringsAsFactors=FALSE)
metadata[,c("Title","Performer","Date","Population")]

ERR188297()

library(rtracklayer)
dir <- system.file(package="alpineData", "extdata")
for (sample.name in metadata$Title) {
  # the reads are accessed with functions named
  # after the sample name. the following line calls
  # the function with the sample name and saves
  # the reads to `gap`
  gap <- match.fun(sample.name)()
  file.name <- file.path(dir,paste0(sample.name,".bam"))
  export(gap, con=file.name)
}
bam.files <- file.path(dir, paste0(metadata$Title, ".bam"))
names(bam.files) <- metadata$Title
stopifnot(all(file.exists(bam.files)))

#This code onwards is relevant

biocLite("ensembldb")
library(ensembldb)
