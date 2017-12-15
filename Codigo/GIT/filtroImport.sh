#!/bin/bash

dir="/home/facom/Documents/GIT/Projetos/imports"

while read -r line || [[ -n "$line" ]] 
do 	
	i=$(($i+1))
	echo "$line, $i"

	while read -r imports || [[ -n "$imports" ]] 
	do 	

		if echo "$imports" | egrep "$line,"
		then
			echo "$line"
	    	echo "$line" >> $dir/filtrado/$i.txt
	    
		if echo "$imports" | egrep "[ ]$line,"
		then
			echo "$line"
	    	echo "$line" >> $dir/filtrado/$i.txt
	    fi
	    
	done<"$dir/todosImports.txt"


done<"classe.txt"