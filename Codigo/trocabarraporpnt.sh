#!/bin/bash

dir="/home/carollima/Documentos"

find *.csv > csv.txt

while read -r linha || [[ -n "$linha" ]] 
	do
	i=$(($i+1))
	echo $linha
	while read -r line || [[ -n "$line" ]] 
		do
			#remover os .java
			echo $line | sed -e 's/.java/ /g' >> $i.csv	
		done<"$linha"

	while read -r line || [[ -n "$line" ]] 
		do
			#troca / por .
			echo $line | tr '/' '.' >> $i-f.csv	
			
		done<"$i.csv"

	rm $i.csv

done< "csv.txt"