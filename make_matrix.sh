#!/bin/bash

make_matrix() {

  #Make a data matrix of results for the tools just run. Salmon requires special treatment as it was run on three different modes, putting results in three different directories
  if [ "$1" == "Salmon" ]; then
    python ./generate.py Salmon_align `pwd` Simulation/Salmon_results/Salmon_Alignment_Results
    python ./generate.py Salmon_SMEM `pwd` Simulation/Salmon_results/Salmon_SMEM_results    
    python ./generate.py Salmon_quasi `pwd` Simulation/Salmon_results/Salmon_quasi_results
    chmod +x Salmon_align_TPM.sh
    chmod +x Salmon_SMEM_TPM.sh
    chmod +x Salmon_quasi_TPM.sh
    ./Salmon_align_TPM.sh
    ./Salmon_SMEM_TPM.sh
    ./Salmon_quasi_TPM.sh
    rm Salmon_align_TPM.sh
    rm Salmon_SMEM_TPM.sh
    rm Salmon_quasi_TPM.sh

    #Clean up to save space
    #rm -r Simulation/$1"_results"

  elif [ "$1" == "ground_truth" ]; then
    python ./generate.py $1 `pwd` Simulation/data/simulated
    chmod +x $1"_TPM.sh"
    chmod +x $1"_FPKM.sh"
    chmod +x $1"_Counts.sh"
    ./$1"_TPM.sh"
    ./$1"_FPKM.sh"
    ./$1"_Counts.sh"
    rm $1"_TPM.sh"
    rm $1"_FPKM.sh"
    rm $1"_Counts.sh"
  
  elif [ "$1" == "Kallisto" ] || [ "$1" == "eXpress" ] || [ "$1" == "RSEM" ] || [ "$1" == "Sailfish" ]; then
    echo $1
    python ./generate.py $1 `pwd` Simulation/$1"_results"
    echo python ./generate.py $1 `pwd` Simulation/$1"_results"
    if [ "$1" == "eXpress" ] || [ "$1" == "RSEM" ]; then
      chmod +x $1"_TPM.sh"
      chmod +x $1"_FPKM.sh"
      chmod +x $1"_Counts.sh"
      ./$1"_TPM.sh"
      ./$1"_FPKM.sh"
      ./$1"_Counts.sh"
      rm $1"_TPM.sh"
      rm $1"_FPKM.sh"
      rm $1"_Counts.sh"
    else
      chmod +x $1"_TPM.sh"
      chmod +x $1"_Counts.sh"
      ./$1"_TPM.sh"
      ./$1"_Counts.sh"
      rm $1"_TPM.sh"
      rm $1"_Counts.sh"
    fi
    #Clean up to save space
    #rm -r Simulation/$1"_results"
  #If an inappropriate argument was passed, print an error message.
  else
    echo "Inappropriate argument passed. The following arguments are accepted: Kallisto, Salmon, eXpress and RSEM."
  fi
}

"$@"

