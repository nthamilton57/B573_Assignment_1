#!/bin/bash

# Navigate to the User's home directory
cd ~

#Create a directory titled "Informatics_573"
mkdir Informatics_573
#Navigates to the new directory
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

#Label the following section to increase readability
echo -e "File Information\n\n" >> data_summary.txt

# Appends a list of the file name and the file permissions, size, and owner.
for file in chr1_*.fa; do
   echo "File Name: $file" >> data_summary.txt
   echo "File Permissions: $(ls -l "$file" | awk '{print $1}')" >> data_summary.txt
   echo "File Size in Bytes: $(ls -l "$file" | awk '{print $5}')" >> data_summary.txt
   echo "File Owner: $(ls -l "$file" | awk '{print $3}')" >> data_summary.txt
   echo -e "\n" >> data_summary.txt
done

#Prints an empty line to increase readability of the document
echo -e "\n\n" >> data_summary.txt

#Label the following section to increase readability
echo -e "First 10 lines of Each File\n\n" >> data_summary.txt

# Append the first 10 lines of each chromosome 1 assembly to text file using a for loop
for file in chr1_*.fa; do
   echo "First 10 lines of $file:" >> data_summary.txt
   head -n 10 "$file" >> data_summary.txt
   echo -e "\n" >> data_summary.txt
done

#Prints an empty line to increase readability of the document
echo -e "\n\n" >> data_summary.txt

#Label the following section to increase readability
echo -e "Number of Lines of Files\n\n" >> data_summary.txt

# Append the name of the assembly as well as the number of lines using a for loop that loops through each file prints a label and then the number of lines
for file in chr1_*.fa; do
   echo "Number of Lines of $file:" >> data_summary.txt
   wc -l "$file" >> data_summary.txt
   echo -e "\n" >> data_summary.txt
done

