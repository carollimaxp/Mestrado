#!/bin/bash

dir="/home/carollima/Documentos/GIT/scitools/Teste"
while read -r line || [[ -n "$line" ]] 
	do
			
		if echo "$line" | egrep "Public[ ]Class*"
			then
				echo "$line"
		    	echo "$line" >> $dir/filtro.txt
		    fi
	 
	done<"$dir/RxJava.csv"