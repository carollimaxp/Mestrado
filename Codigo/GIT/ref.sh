#!/bin/bash

#pega cada linha do arq ospntjava para interar no while
for (( i = 1; i < 21; i++ )); do
	while read -r line || [[ -n "$line" ]] 
	do 	
				if echo "$line" | egrep "^import[ ]*.*;$"
				then
					echo "$line"
			    	echo "$line" >> /home/carollima/Documentos/GIT/Projetos/imports/imports-$i.txt
			    fi
	done<"imports/imports-ospntjava-$i.txt"
done
