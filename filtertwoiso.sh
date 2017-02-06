#!/bin/bash

#put in header
line=$(head -n 1 Kallisto_TPM_formatted.txt)
echo $line >Kallisto_gene_to_transcript_TPM.txt

#For each line in file, if the transcript is also in the gtf, output that line with the gene id into new file
while read p; do
  transcript_id=`echo $p | awk '{print $14}' | sed 's/"//g' | sed 's/;//g'`

  if grep -q $transcript_id /home/jw817/Kallisto_TPM_formatted.txt; then
    gene_id=`echo $p | awk '{print $10}'| sed 's/"//g' | sed 's/;//g'`
    output=$( grep $transcript_id /home/jw817/Kallisto_TPM_formatted.txt )
    echo $gene_id"  "$output >> Kallisto_gene_to_transcript_TPM.txt
  fi

done < /home/jw817/gtf_files/two_isoforms.gtf
