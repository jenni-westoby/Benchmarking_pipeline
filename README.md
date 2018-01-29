# Benchmarking_pipeline

Prerequisites:

-virtualenv

-github account

-reference genome gtf and fasta files. Note that if your data contains ERRCC spike-ins, you should concatenate the reference genome gtf file with the ERRCC gtf file, and concatenate the reference and ERRCC fastq files (see https://tools.thermofisher.com/content/sfs/manuals/cms_095048.txt)

-directory containing single cell RNA-seq data. This data should be demultiplexed, have any adaptors trimmed and should be in the format of gzipped fastq files.

Note: This pipeline was originally executed on using an LSF based jobs system on a HPC. Commands beginning 'bsub' will have to be altered to enable you to repeat the analysis on a different machine.

To run the pipeline:

1. Execute ./setup.sh setup. This will create a new directory called Simulation into which all the software required for this pipeline will be locally installed. In addition, empty directories are created within the Simulation directory which will eventually contain the RSEM references, various indices, the raw and simulated data, results matrices and graphs. This step will take ~30 minutes - 1 hour depending on your network speed.

2. Execute ./RSEM_ref.sh make_ref /path/to/gtf path/to/fasta, where the gtf and fasta files are the reference genome. This builds the RSEM reference.

3. Execute ./quality_control.sh QC path/to/gtf path/to/fasta path/to/raw/data. This creates a table of quality control statistics. Based on the results of this you can decide which cells you would like to simulate and which you are going to discard.

4. Once you have decided which cells to discard and have a directory containing only the gzipped cells you want to simulate, execute ./simulate.sh run_simulations path/to/raw/data. The simulated cells and their ground truth expression values are saved in Simulation/data/simulated.

5. If you wish, you can also perform quality control on your simulated cells based on read and alignment quality. This is probably wise, as RSEM sometimes generates cells with very few reads. Execute ./quality_control.sh QC path/to/gtf path/to/fasta and delete any problematic cells from the data/simulated directory.

6. Perform any further quality control you would like to perform prior to doing your benchmark. 

7. Before performing the quantification step, delete any cells that you don’t want to include in the benchmark.

8. Execute ./benchmark.sh benchmark name_of_program_you_want_to_test. This will generate results matrices of expression values for the method you are interested in. Repeat for each method you want to test.

9. Execute ./make_matrix.sh make_matrix name_of_program_you_want_to_test. This generates a compact results matrix for each method in results_matrices.

10. Execute ./clean_data.sh to trim filename paths from results matrix column names.

Note - for quality control purposes it is often useful to have expression estimates from the original (unsimulated) data. You can obtain this data by executing ./benchmark_real.sh benchmark Kallisto /path/to/data. This command was also used to generate the real single cell counts data used in the final section of the results, in which the number of isoforms expressed per gene was considered.
