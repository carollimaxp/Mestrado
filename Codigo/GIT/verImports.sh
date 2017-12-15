##!/bin/bash

dir="/home/facom/Documents/Teste/GIT/Projetos/gitDiff"

while read -r linha || [[ -n "$linha" ]]
do	
	echo "$linha"
	linhaU=$(cat $dir/maisImports_nomes.txt | more | grep "$linha")

	if [ $? -ne 0 ]; then
		echo "Não $linhaU"
	else
		echo "Não"
	fi
done<$dir/imports_nomes.txt