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

# Append file_name to each row (will be used for date)
cd log/

for f in *_play.log; do
 	echo "Processing $f"
 	awk -v var="$f" '{print $0,"\t",var}' $f > ${f}.fn
done

# Remove all log files to save space
rm *.log

# cat all log with filename to one file
cat *_play.log.fn > all_play.log.fn
