#!/usr/bin/env python

string=""

with open("/nfs/users/nfs_j/jw28/expression_filtered_cells.csv", 'r') as f:
    for line in f:
        string = string + line.rstrip() + ".genome.sorted.bam,"


string = "python /nfs/users/nfs_j/jw28/miniconda2/pkgs/rseqc-2.6.2-0/bin/geneBody_coverage.py -r $TEAM/mm10_Ensembl_nochr.bed -i " + string + "-o Filtered_coverage_graph_raw -f 'pdf'"


with open("/nfs/users/nfs_j/jw28/coverage_graph_raw.sh", 'w') as t:
        t.write("#!/bin/bash\ncd $TEAM/raw_bamfiles\n")
        t.write(string)
