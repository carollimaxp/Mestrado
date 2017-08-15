#!/bin/bash

dir="/home/carollima/Documentos"

#find *.csv > csv.txt

while read -r linha || [[ -n "$linha" ]] 
	do
	i=$(($i+1))
	echo $linha

	while read -r line || [[ -n "$line" ]] 
		do
			#remover os .java
			echo $line | sed -ri 's/^./ /' >> $i-$linha
		done<"$linha"

	while read -r line || [[ -n "$line" ]] 
		do
			#troca / por .
			echo $line >> $linha
			
		done<"$i-$linha"

	rm $i-$linha

done< "csv.txt"