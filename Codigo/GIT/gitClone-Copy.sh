#!/bin/bash

while read -r line || [[ -n "$line" ]] 
	do 
	
		#baixa projetos
		i=$(($i+1))
		echo $i
		git clone https://github.com/$line
	
	done < "lista8.txt"
	#done < "lista1.txt"
