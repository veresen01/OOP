#!/bin/bash

directory=$1

if [ -z $directory ]
then
	echo "Specify a directory"
	exit 1
fi

if [ ! -d $directory ]
then 
	echo "Not a directory!"
	exit 1
fi

filelist=$(ls $directory)

for file in $filelist
do
	owner=$(ls -l $directory/$file | awk '{print $3}')
	if [ ! -d $owner ]
	then
		mkdir $owner
		chown -R $owner:$owner $owner
	fi
	cp -p $directory/$file $owner
done