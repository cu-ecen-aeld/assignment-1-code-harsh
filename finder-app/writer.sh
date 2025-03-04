#!/bin/sh
## TO DO: 
# Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr
# 1) Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr
# 2) Exits with value 1 error and print statements if any of the arguments above were not specified
# 3) Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.

write_file=$1
write_str=$2

if [ $# != 2 ]
then
	echo "ERROR: Invalid Number of Arguments."
	echo "Total number of arguments should be 2."
	echo "The order of the arguments should be:"
	echo "	1)Full file path to create"
	echo "	2)String to be written in the specified file"
	exit 1
else
	if [ ! -d "$write_file" ]
	then
		mkdir -p $(dirname "$write_file")
	fi
	touch "$write_file"	
	echo "$write_str" > "$write_file"
fi



