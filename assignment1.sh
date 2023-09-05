#!/bin/bash

# Navigate to the User's home directory
cd ~

# Create a directory titled "Informatics_573" and navigate to it
mkdir Informatics_573
cd Informatics_573

# Download all secondary assemblies for human chromosome 1 from  UCSC Genome browser
# 	-r is recursive which will download all files from links within this url
#	-np is used with -r to stop wget from going to the parent directory when following links
#	-nd means no directories and will make all downloaded files be placed into current working directory
#	-A "chr1_*.gz" accepts only files that follows this pattern 
wget -r -np -nd -A "chr1_*.gz" https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/

# Unzip all the downloaded assemblies
gunzip *.gz

# Create a file called "data_summary.txt"
touch data_summary.txt

# Append a list of all detailed information (file name, size, permissions) using a for loop
for file in chr1_*.fa; do
   echo "File Name: $file" >> data_summary.txt
   ls -l "$file" >> data_summary.txt
done

# Append the first 10 lines of each chromosome 1 assembly to text file using a for loop
for file in chr1_*.fa; do
   echo "First 10 lines of $file:" >> data_summary.txt
   head -n 10 "$file" >> data_summary.txt
done

# Append the name of the assembly as well as the number of lines using a for loop that loops through each file prints a label and then the number of lines
for file in chr1_*.fa; do
   echo "Number of Lines of $file:" >> data_summary.txt
   wc -l "$file" >> data_summary.txt
done

