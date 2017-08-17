#!/bin/bash

#clean data by removing speech marks and file names before loading into R for analysis

cd Simulation/results_matrices

#Sailfish
sed 's/\"//g' Sailfish_TPM.txt | sed 's|Simulation/Sailfish_results/||g' | sed 's|/quant.sf||g' > clean_Sailfish_TPM.txt

#Salmon
sed 's/\"//g' Salmon_align_TPM.txt | sed 's|Simulation/Salmon_results/Salmon_Alignment_Results/||g' | sed 's|/quant.sf||g' > clean_Salmon_align_TPM.txt
sed 's/\"//g' Salmon_SMEM_TPM.txt | sed 's|Simulation/Salmon_results/Salmon_SMEM_results/||g' | sed 's|/quant.sf||g' > clean_Salmon_SMEM_TPM.txt
sed 's/\"//g' Salmon_quasi_TPM.txt | sed 's|Simulation/Salmon_results/Salmon_quasi_results/||g' | sed 's|/quant.sf||g' > clean_Salmon_quasi_TPM.txt

#Kallisto
sed 's/\"//g' Kallisto_TPM.txt | sed 's|Simulation/Kallisto_results/||g' | sed 's|/abundance.tsv||g' > clean_Kallisto_TPM.txt

#eXpress
sed 's/\"//g' eXpress_TPM.txt | sed 's|Simulation/eXpress_results/||g' | sed 's|/results.xprs||g' > clean_eXpress_TPM.txt

#RSEM
sed 's/\"//g' RSEM_TPM.txt | sed 's|Simulation/RSEM_results/||g' | sed 's|.isoforms.results||g' > clean_RSEM_TPM.txt

#ground truth
sed 's/\"//g' ground_truth_TPM.txt | sed 's|Simulation/data/simulated/||g' | sed 's|.sim.isoforms.results||g' > clean_ground_truth_TPM.txt
