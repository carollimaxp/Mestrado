#!/bin/bash

dir="/home/facom/Documents/PMD"

while read -r lin || [[ -n "$lin" ]] 
	do
			
		#primeiro argumento do txt
		class=$(cat $lin | head -1 $lin |cut -d ',' -f 1)
		#echo $lin
		#echo $class	
		while read -r linha || [[ -n "$linha" ]] 
		do
			primeiraLinha=$(cat $lin | head -1 $lin)
			#echo $primeiraLinha
			if [[ $primeiraLinha = $linha ]]; 
			then
				echo $linha >> /home/facom/Documents/Teste/PMD/$class.txt
			else
				echo $class','$linha >>  /home/facom/Documents/Teste/PMD/$class.txt
			fi
		done < "$lin"

	 
	done < "text.txt"