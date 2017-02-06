#!/bin/bash

#Function that makes the RSEM reference. Takes the path to the reference genome
#gtf file as its first argument and the path to the reference genome fasta file as
#its second argument
make_ref(){

  #Check correct number of arguments were passed
  if [ $# -ne 2 ]
    then
      echo "Incorrect number of arguments supplied. Two arguments should be passed to this function, the first the path to the reference gtf file and the second the path to the reference fasta file."
      exit 1
  fi

  #Build the reference
  ./Simulation/RSEM-1.3.0/rsem-prepare-reference --gtf $1 \
                         --star \
                         --star-path Simulation/STAR/bin/Linux_x86_64/ \
                         -p 8 \
                         $2 Simulation/ref/reference
}

"$@"
