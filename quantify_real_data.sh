
#!/bin/bash

Kallisto() {

      #make a directory for the results of Kallisto for each cell
      filename=$1
      mkdir Simulation/Kallisto_results_real_data/$filename

      ./Simulation/kallisto_linux-v0.43.1/kallisto quant -i Simulation/indices/Kallisto/transcripts.idx --threads=8 --output-dir=Simulation/Kallisto_results_real_data/$filename $TEAM/BLUEPRINT_prac/$filename'_1.fq.gz' $TEAM/BLUEPRINT_prac/$filename'_2.fq.gz'

      echo "target_id       length  eff_length      est_counts      tpm" >> Simulation/Kallisto_results_real_data/$filename/abundancesorted.tsv
      tail -n +2 Simulation/Kallisto_results_real_data/$filename/abundance.tsv | sort -n -k1.8 >> Simulation/Kallisto_results_real_data/$filename/abundancesorted.tsv
      mv Simulation/Kallisto_results_real_data/$filename/abundancesorted.tsv Simulation/Kallisto_results_real_data/$filename/abundance.tsv

}

"$@"
