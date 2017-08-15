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
			echo $line | sed -ri 's/^.home.carollima.Documentos.GIT.Projetos/ /g' >> $i-$linha
		done<"$linha"

	while read -r line || [[ -n "$line" ]] 
		do
			#remover os .java
			echo $line | sed -e 's/.java/ /g' >> $i-$linha
		done<"$linha"

	while read -r line || [[ -n "$line" ]] 
		do
			#troca / por .
			echo $line | tr '/' '.' >> $linha
			
		done<"$i-$linha"

	rm $i-$linha

done< "csv.txt"