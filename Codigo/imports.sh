#!/bin/bash

#entra em cada projeto do Git
while read -r pasta || [[ -n "$pasta" ]] 
do 
dir="/home/carollima/Documentos/GIT/Projetos/$pasta"
	i=$(($i+1))
	echo $pasta,$i

	#pega cada linha do arq ospntjava para interar no while
	while read -r line || [[ -n "$line" ]] 
	do 
		#entra no .java e pega todos os imports
		while read -r pntJava || [[ -n "$pntJava" ]]
		do
			
			if echo "$pntJava" | egrep "import[ ]*.*;"
			then
				echo "$pntJava"
		    	echo "$pntJava" >> /home/carollima/Documentos/GIT/Projetos/imports/imports-ospntjava-$i.txt
		    fi

		done<"$line"

	done<"todospntJava/ospntjava-$i.txt"

	echo "FIM de Pegar os IMPORTS do $pasta"

done<"lista-nome.txt"


