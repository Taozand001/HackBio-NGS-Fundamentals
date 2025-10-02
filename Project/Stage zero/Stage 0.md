Project 1: BASh Basic

#!/bin/bash 
   
    #question 1
echo "Taofeek"

      #question 2    making a new directory
mkdir Taofeek

      #question 3  make another directory 'biocomputing' and change to it with one command line
mkdir biocomputing && cd biocomputing

      #question 4   downloading multiple files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna 
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk 
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

       #question 5    move the .fna file to folder named Taofeek
mv wildtype.fna Taofeek/

       #question 6   delete the duplicate file
rm wildtype.gbk.1

       #question 7    confirming if its a mutant or a wild type
grep 'tatatata' ../Taofeek/wildtype.fna

       #question 8   printing matching lines into a new file
grep 'tatatata' wildtype.fna > mutant_files.txt

       #question 9  counting the number of lines excluding header in the gbk file
sed '1d' wildtype.gbk | wc -l

       #question 10  printing the sequence length of the gbk file
grep 'LOCUS' wildtype.gbk

       #question 11   printing the source organism of the gbk file
grep 'SOURCE' wildtype.gbk

       #question 12   listing the gene names of the gbk file
grep '/gene' wildtype.gbk

      #question 13   clearing terminal and printing the history of commands executed
clear && history

#question 14       list the files in the two folders
ls biocomputing/ Taofeek/

Project 2: Installing Bioinformatics Software on the Terminal

#!/bin/bash

#question 1         activate base conda
conda activate base

 #question 2        create conda environment named 'funtools'
conda create -n 'funtools'

 #question 3        activate 'funtools'
conda activate funtools

 #question 4       Install 'Figlet' using conda 
conda install figlet -y

 #question 5       run figlet 'your name'
figlet 'Taofeek'
 
 #question 6-13 install all packages through bioconda channel
conda install -c bioconda bwa blast samtools bedtools spades.spy bcftools fastp multiqc
