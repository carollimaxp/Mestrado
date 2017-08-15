#!/bin/bash

dir="/home/carollima/Documentos"
while read -r line || [[ -n "$line" ]] 
	do
			
		#primeiro argumento do txt
		class=$(cat $dir/$line | head -1 $dir/$line |cut -d ',' -f 1)
		#echo $class	

		while read -r linha || [[ -n "$linha" ]] 
		do		
			primeiraLinha=$(cat $dir/$line | head -1 $dir/$line)
			#echo $primeiraLinha
			if [[ $primeiraLinha = $linha ]]; 
			then
				echo $linha >> $dir/GIT/Teste/PMD/Projeto1/$line
			else
				echo $class', '$linha >> $dir/GIT/Teste/PMD/Projeto1/$line
			fi
		done < $dir/$line
	 
	done<"text.txt"
 

