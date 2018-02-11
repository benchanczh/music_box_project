#!/bin/bash

# Download files
wget -i links.txt

# Create a subfolder which is called log
mkdir log

# Extract all files with extension ".tar.gz"
# Rename each extracted file after its archive's basename
# Move extracted files to folder log
# Then remove the archive
for file in *.tar.gz; do
	tar -xf $file
    mv *.log log/$(basename $file .tar.gz)
    rm $file
done

# Extract all files with extension ".gz"
# Rename each extracted file after its archive's basename
# Move extracted files to folder log
# Then remove the archive
for file in *.gz; do
	tar -xf $file
	mv *.log log/$(basename $file .gz)
	rm $file
done

# Move all files with extension ".uids" to folder log
for file in *.uids; do
	mv $file log/$file
done