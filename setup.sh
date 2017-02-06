#!/bin/bash
#Note users will require a github account and need to have virtualenv installed
#!/bin/bash
#Note users will require a github account and need to have virtualenv installed

setup(){

  #First make a directory in which simulation data and programs will be kept
  mkdir ./Simulation

  #Install programs in directory
  cd Simulation

  #Install RSEM
  wget https://github.com/deweylab/RSEM/archive/v1.3.0.tar.gz
  tar -xvzf v1.3.0.tar.gz
  rm v1.3.0.tar.gz
  cd RSEM-1.3.0
  make
  make install prefix=.
  cd ..
  if ! command -v ./RSEM-1.3.0/rsem-generate-data-matrix >/dev/null 2>&1; then
    echo "Failed to install RSEM"
    exit 1
  else
    echo "Successfully installed RSEM"
  fi

  #Install cufflinks
  wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz
  tar -xvzf cufflinks-2.2.1.Linux_x86_64.tar.gz
  rm cufflinks-2.2.1.Linux_x86_64.tar.gz
  if ! command -v ./cufflinks-2.2.1.Linux_x86_64/cufflinks >/dev/null 2>&1; then
    echo "Failed to install cufflinks"
    exit 1
  else
    echo "Successfully installed cufflinks"
  fi

  #Install Sailfish
  wget https://github.com/kingsfordgroup/sailfish/releases/download/v0.6.3/Sailfish-0.6.3-Linux_x86-64.tar.gz
  tar -xvzf Sailfish-0.6.3-Linux_x86-64.tar.gz
  rm Sailfish-0.6.3-Linux_x86-64.tar.gz
  export LD_LIBRARY_PATH=`pwd`/Sailfish-0.6.3-Linux_x86-64/lib:$LD_LIBRARY_PATH
  export PATH=`pwd`/Sailfish-0.6.3-Linux_x86-64/bin:$PATH
  if ! command -v ./Sailfish-0.6.3-Linux_x86-64/bin/sailfish -h; then
    echo "Failed to install Sailfish"
    exit 1
  else
    echo "Successfully installed Sailfish"
  fi


  #Install eXpress
  wget http://bio.math.berkeley.edu/eXpress/downloads/express-1.5.1/express-1.5.1-linux_x86_64.tgz
  tar -xvzf express-1.5.1-linux_x86_64.tgz
  rm express-1.5.1-linux_x86_64.tgz
  if ! command -v ./express-1.5.1-linux_x86_64/express >/dev/null 2>&1; then
    echo "Failed to install eXpress"
    exit 1
  else
    echo "Successfully installed eXpress"
  fi

  #Install Salmon
  wget https://github.com/COMBINE-lab/salmon/releases/download/v0.7.2/Salmon-0.7.2_linux_x86_64.tar.gz
  tar -xvzf Salmon-0.7.2_linux_x86_64.tar.gz
  rm Salmon-0.7.2_linux_x86_64.tar.gz
  if ! command -v ./Salmon-0.7.2_linux_x86_64/bin/salmon >/dev/null 2>&1; then
    echo "Failed to install Salmon"
    exit 1
  else
    echo "Successfully installed Salmon"
  fi

  #Install Kallisto
wget https://github.com/pachterlab/kallisto/releases/download/v0.43.0/kallisto_linux-v0.43.0.tar.gz
tar -xvzf kallisto_linux-v0.43.0.tar.gz
rm kallisto_linux-v0.43.0.tar.gz
if ! command -v ./kallisto_linux-v0.43.0/kallisto >/dev/null 2>&1; then
  echo "Failed to install Kallisto"
  exit 1
else
  echo "Successfully installed Kallisto"
fi

#Install STAR
git clone https://github.com/alexdobin/STAR.git
if ! command -v ./STAR/bin/Linux_x86_64/STAR >/dev/null 2>&1; then
  echo "Failed to install STAR"
  exit 1
else
  echo "Successfully installed STAR"
fi

#Install samtools
wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2
bzip2 -d samtools-1.3.1.tar.bz2
tar -xvf samtools-1.3.1.tar
rm samtools-1.3.1.tar
cd samtools-1.3.1/
./configure --prefix=`pwd`
make
make install
cd ..
if ! command -v ./samtools-1.3.1/samtools >/dev/null 2>&1; then
  echo "Failed to install SAMtools"
  exit 1
else
  echo "Successfully installed SAMtools"
fi

  #Install RSeQC
  virtualenv venv
  source venv/bin/activate
  pip install RSeQC
  if ! command -v  >/dev/null 2>&1; then
    echo "Failed to install RSeQC"
    exit 1
  else
    echo "Successfully installed RSeQC"
  fi
  deactivate

  #Make a directory for RNA-seq data including raw and simulated data
  mkdir data
  cd data
  mkdir simulated
  cd ..

  #Make a directory for quality control statistics for raw and simulated data
  mkdir QC_stats
  cd QC_stats
  mkdir raw
  mkdir simulated
  mkdir temp_raw
  mkdir temp_simulated
  cd ..

  mkdir indices
  mkdir indices/STAR
  mkdir indices/Salmon_SMEM
  mkdir indices/Salmon_quasi
  mkdir indices/Kallisto
  mkdir indices/Sailfish

  mkdir bamfiles
  mkdir bamfiles/raw
  mkdir bamfiles/simulated

  mkdir time_stats

  mkdir ref
  mkdir results_matrices

}

"$@"
