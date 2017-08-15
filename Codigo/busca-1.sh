#!/bin/bash

dir="/home/facom/Documents/GIT/Teste"

cd $dir
find */*.csv > /home/facom/Documents/RxJava.txt

while read -r line || [[ -n "$line" ]] 
	do
		
		while read -r linha || [[ -n "$linha" ]] 
		do		
			if echo "$linha" | egrep "Public[ ]Class*"
				then
					echo "$line"
			    	echo "$line" >> $dir/filtro.txt
			    fi
		done < $line	    
	 
	done<"/home/facom/Documents/GIT/RxJava.txt"

