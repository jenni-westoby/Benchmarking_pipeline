#!/usr/bin/env python

import glob, os
import sys

program = sys.argv[1]
working_dir = sys.argv[2]
results = sys.argv[3]

def writefile(program, file_ext, function, unit):

    string = ""
    results_dir = working_dir + "/" + results
    file_path = working_dir + "/" + program + "_" + unit + ".sh"
    os.chdir(working_dir)
    for file in glob.glob(file_ext):
        string = string + " " + file

    string = "./" + function + " " + string + " > Simulation/results_matrices/" + program + "_" + unit + ".txt"
    with open(file_path, 'w') as t:
        t.write("#!/bin/bash\n")
        t.write(string)

if program == "RSEM":
    writefile("RSEM", "Simulation/RSEM_results/*.isoforms.results", "rsem-generate-data-matrix4", "Counts")
    writefile("RSEM", "Simulation/RSEM_results/*.isoforms.results", "rsem-generate-data-matrix5", "TPM")
    writefile("RSEM", "Simulation/RSEM_results/*.isoforms.results", "rsem-generate-data-matrix6", "FPKM")

elif program == "ground_truth":
    writefile("ground_truth", "Simulation/data/simulated/*.isoforms.results", "rsem-generate-data-matrix4", "Counts")
    writefile("ground_truth", "Simulation/data/simulated/*.isoforms.results", "rsem-generate-data-matrix5", "TPM")
    writefile("ground_truth", "Simulation/data/simulated/*.isoforms.results", "rsem-generate-data-matrix6", "FPKM")

elif program == "Kallisto":
    writefile("Kallisto", "Simulation/Kallisto_results/*/abundance.tsv", "rsem-generate-data-matrix3", "Counts")
    writefile("Kallisto", "Simulation/Kallisto_results/*/abundance.tsv", "rsem-generate-data-matrix4", "TPM")
    
elif program == "Kallisto_real":
    writefile("Kallisto_real", "Simulation/Kallisto_real_results/*/abundance.tsv", "rsem-generate-data-matrix3", "Counts")
    writefile("Kallisto_real", "Simulation/Kallisto_real_results/*/abundance.tsv", "rsem-generate-data-matrix4", "TPM")

elif program == "Salmon_align":
    writefile("Salmon_align", "Simulation/Salmon_results/Salmon_Alignment_Results/*/quant.sf", "rsem-generate-data-matrix3", "TPM")

elif program == "Salmon_quasi":
    writefile("Salmon_quasi", "Simulation/Salmon_results/Salmon_quasi_results/*/quant.sf", "rsem-generate-data-matrix3", "TPM")

elif program == "Salmon_SMEM":
    writefile("Salmon_SMEM", "Simulation/Salmon_results/Salmon_SMEM_results/*/quant.sf", "rsem-generate-data-matrix3", "TPM")

elif program == "Updated_Salmon_Alignment_Results":
    writefile("Updated_Salmon_Alignment_Results", "Simulation/Salmon_results/Updated_Alignment_Results/*/quant.sf", "rsem-generate-data-matrix3", "TPM")

elif program == "Sailfish":
    writefile("Sailfish", "Simulation/Sailfish_results/*/quant.sf", "rsem-generate-data-matrix3", "TPM")

elif program == "eXpress":
    #writefile("eXpress", "Simulation/eXpress_results/*/results.xprs", "rsem-generate-data-matrix6", "Counts")
    #writefile("eXpress", "Simulation/eXpress_results/*/results.xprs", "rsem-generate-data-matrix10", "FPKM")
    writefile("eXpress", "Simulation/eXpress_results/*/results.xprs", "rsem-generate-data-matrix13", "TPM")

else:
    print "Wrong argument supplied, try again."
