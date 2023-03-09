#!/bin/bash

directory=$1
if [ -n $directory ] 
	then
		cd $directory
		echo 'begin'
		rm -R *.bak | rm -R *.tmp | rm -R *.backup
	else
		echo 'directory not found'
fi