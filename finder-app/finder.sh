#!/bin/sh
## TO DO: 
# Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr
# 1) Exits with return value 1 error and print statements if any of the parameters above were not specified
# 2) Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
# 3) Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).

# Test 1
#echo "number of args: $#"
if [ $# != 2 ]
then
	echo "ERROR: Invalid Number of Arguments."
	echo "Total number of arguments should be 2."
	echo "The order of the arguments should be:"
	echo "	1)File Directory Path."
	echo "	2)String to be searched in the specified directory path/"
	exit 1
fi

filesdir="$1"
searchstr="$2"
# Test 2 
if  [ -d "$filesdir" ]
then
	echo "found directory"
else
	echo "ERROR: Invalid arguement"
	echo "Entered argument is not a valid directory"
	exit 1
fi

#Test 3

X=$( ls "$filesdir" | wc -l )
Y=$( grep -r "$searchstr" "$filesdir" | wc -l )
echo "The number of files are ${X} and the number of matching lines are ${Y} "

