Project 1: BASh Basic

# 1. print your name
echo 'Taofeek'

# 2. Create a folder titled your name
mkdir 'Taofeek'

# 3. Create another new directory titled biocomputing and change to that directory with one line of command
mkdir 'biocomputing' && cd 'biocomputing'

# 4. Download 3 files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

# 5. move '.fna' file to the folder named Taofeek
mv wildtype.fna Taofeek/

# 6. delete the duplicate '.gbk' file
rm wildtype.gbk.1 

# 7. confirm if the .fna file is mutant or wild type (tatatata vs tata)
 grep 'tatatata' wildtype.fna 

# 8. If mutant, print all matching lines into a new file
grep 'tatatata' wildtype.fna > mutant_line.txt

# 9.  Count number of lines (excluding header) in the .gbk file
tail -n 5749 wildtype.gbk

# 10.  Print the sequence length of the .gbk file. (Use the LOCUS tag in the first line)
 head -n 1 wildtype.gbk | awk '{print $3}'

# 11.  Print the source organism of the .gbk file. (Use the SOURCE tag in the first line)
head -n 6 wildtype.gbk | awk '{print $2}'

# 12. List all the gene names of the .gbk file. Hint {grep '/gene='}
grep 'gene' wildtype.gbk

# 13. Clear your terminal space and print all commands used today
clear 
history

# 14. List files in the two folder
  ls biocomputing/ Taofeek/

Project 2: Installing Bioinformatics Software on the Terminal

# 1. Activate your base conda environment
 conda activate base

# 2. Create a conda environment named funtools
conda create -n "funtools"

# 3. Activate the funtools environment
conda activate funtools

# 4. Install Figlet using conda or apt-get
 sudo apt-get install figlet -y

# 5.  Run figlet <your name>
figlet Taofeek

# 6. Install bwa through the bioconda channel 
conda install -c bioconda bwa

# 7. Install blast through the bioconda channel
conda install -c bioconda blast

# 8.  Install samtools through the bioconda channel
conda install -c bioconda samtools

# 9.  Install bedtools through the bioconda channel
conda install -c bioconda bedtools 

# 10. Install spades.py through the bioconda channel
conda install -c bioconda spades.py

# 11.  Install bcftools through the bioconda channe
conda install -c bioconda bcftools

# 12. Install fastp through the bioconda channel
conda install -c bioconda fastp

# 13. Install multiqc through the bioconda channel
 conda install -c bioconda multiqc
