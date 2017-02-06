#!/bin/bash
#Quantification pipeline

benchmark(){

  memory=`pwd`
  #If the wrong number of arguments was passed, print an error message
  if [ $# -eq 1 ]
    then
      #If an appropriate argument was passed
      if [ "$1" == "Kallisto" ] || [ "$1" == "Salmon" ] || [ "$1" == "eXpress" ] || [ "$1" == "RSEM" ] || [ "$1" == "Sailfish" ]; then

        #Make results directory
        mkdir Simulation/$1"_results"

        #If the argument is Salmon, make SMEM, quasi and alignment results directories
        if [ "$1" == "Salmon" ]; then
          cd Simulation/Salmon_results
          mkdir Salmon_Alignment_Results
          mkdir Salmon_SMEM_results
          mkdir Salmon_quasi_results
          cd ../..
        fi

        #Run tool on simulated cells. Each cell is submitted as a seperate job.
        cd Simulation/data/simulated
        for i in $(find . -name '*_1.fastq*' -o -name '*_1.fq*');
        do
          base=`echo $i |awk -F/ '{print $2}'`
          filename=`echo $base |awk -F_ '{print $1}'`
          cd $memory
          #The line below will need to be edited for your LSF job system.
          bsub -n8 -R"span[hosts=1]" -c 99999 -G team_hemberg -q normal -o $TEAM/temp.logs/"output."$filename$1 -e $TEAM/temp.logs/"error."$filename$1 -R"select[mem>200000] rusage[mem=200000]" -M 200000 ./quantify.sh $1 $filename
        done

        #If a data matrix hasn't been made for the ground_truth results, make it
        if [ ! -f Simulation/results_matrices/ground_truth.csv ]; then
          python ./generate.py ground_truth `pwd` Simulation/data/simulated
          chmod +x ground_truth_TPM.sh
          chmod +x ground_truth_FPKM.sh
          chmod +x ground_truth_Counts.sh
          ./ground_truth_Counts.sh
          ./ground_truth_TPM.sh
          ./ground_truth_FPKM.sh
          rm ground_truth_Counts.sh
          rm ground_truth_TPM.sh
          rm ground_truth_FPKM.sh
        fi

      else
        echo "Inappropriate argument passed. If one argument is passed, the following arguments are accepted: Kallisto, Salmon, eXpress and RSEM."
      fi

  # elif [ $# -eq 2 ]; then
  #   if [ "$1" == "Sailfish" ]; then
  #
  #     mkdir Simulation/$1"_results"
  #
  #     cd Simulation/data/simulated
  #     for i in $(find . -name '*_1.fastq*' -o -name '*_1.fq*');
  #     do
  #       base=`echo $i |awk -F/ '{print $2}'`
  #       filename=`echo $base |awk -F_ '{print $1}'`
  #       cd $memory
  #       #The line below will need to be edited for your LSF job system.
  #       bsub -n8 -R"span[hosts=1]" -c 99999 -G team_hemberg -q normal -o $TEAM/temp.logs/"output."$filename$1 -e $TEAM/temp.logs/"error."$filename$1 -R"select[mem>20000] rusage[mem=20000]" -M 20000 ./quantify.sh $1 $filename $2
  #     done
  #
  #   else
  #     echo "Inappropriate argument passed. If two arguments are passed, the first should be Sailfish and the second should be the library type."
  #   fi

  elif [ $# -eq 3 ]; then
    if [ "$1" == "Cufflinks" ]; then

      mkdir Simulation/$1"_results"

      cd Simulation/data/simulated
      for i in $(find . -name '*_1.fastq*' -o -name '*_1.fq*');
      do
        base=`echo $i |awk -F/ '{print $2}'`
        filename=`echo $base |awk -F_ '{print $1}'`
        cd $memory
        #The line below will need to be edited for your LSF job system.
        bsub -n8 -R"span[hosts=1]" -c 99999 -G team_hemberg -q normal -o $TEAM/temp.logs/"output."$filename$1 -e $TEAM/temp.logs/"error."$filename$1 -R"select[mem>20000] rusage[mem=20000]" -M 20000 ./quantify.sh $1 $filename $2 $3
      done
    else
      echo "Inappropriate argument passed. If three arguments are provided, the first should be Cufflinks, the second should be the path to the reference gtf file and the third should be the library type."
    fi

  else
    echo "Wrong number of arguments passed. One or three arguments are accepted."
  fi



}

"$@"
