#!/bin/bash

dir="/home/facom/Documents/GIT/Projetos/imports/importsLinhaJava"

while read -r pasta || [[ -n "$pasta" ]] 
do
	while read -r line || [[ -n "$line" ]] 
	do

		filtro=$(echo "$line" | sed 's/;$//')
		linha=$(echo "$filtro" | tr ';' ',') >> $dir/1-$pasta.txt
			

	done<"$dir/$pasta.txt" #nome do projeto

	rm $dir/$pasta.txt
	mv $dir/1-$pasta.txt $dir/$pasta.txt

done<"lista-nome.txt" #nome do projeto