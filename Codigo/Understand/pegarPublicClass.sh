#!/bin/bash

des="/home/facom"
dir="/home/facom/Documents/Teste/Understand"

while read -r line || [[ -n "$line" ]] 
	do
			
		if echo "$line" | egrep "Public[ ]Class*"
			then
				echo "$line"
		    	echo "$line" >> $dir/filtro_u.txt
		fi

		if echo "$line" | egrep "Public[ ]Abstract[ ]Class*"
			then
				echo "$line"
		    	echo "$line" >> $dir/filtro_u.txt
		fi

		if echo "$line" | egrep "Public[ ]Interface*"
			then
				echo "$line"
		    	echo "$line" >> $dir/filtro_u.txt
		fi

		if echo "$line" | egrep "Public[ ]Generic[ ]Interface*"
			then
				echo "$line"
		    	echo "$line" >> $dir/filtro_u.txt
		fi

	done<"$des/guava.csv"