#!/bin/bash

while read -r line || [[ -n "$line" ]] 
	do 
	
		#baixa projetos
		i=$(($i+1))
		echo $i
		git clone $line
	
	done < "/home/facom/Documents/GIT/Bibliotecas/headersPOP.txt"
	#done < "lista1.txt"
