#!/bin/bash

dir="/home/facom/Documents/Teste/CodeAnalyzer/Tools"

while read -r classes #|| [[ -n "$classes" ]] #org.junit.Test
do	
	
	linhaU=$(cat $dir/$classes | more | grep ".java,")
	if [ $? -ne 0 ] 
	then
		echo "nao"
	else
		echo "$linhaU" >> $dir/$classes
	fi

done<"$dir/code-bib.txt"