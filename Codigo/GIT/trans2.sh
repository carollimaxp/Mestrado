#!/bin/bash

pop="/home/facom/Resultados/Resultados_atualizados"

#dir="/home/facom/Documents/Teste/GIT/TESTE/gitDiff"
dir="/home/facom/Documents/Teste/GIT/Projetos/gitDiff/MaisImportinline"

while read -r api || [[ -n "$api" ]] 
do 

	var1=$(echo $api | awk -F "," '{print $1,$2}')   
	set -- $var1

	filtro1=$(echo "$2" | tr '.' '-' )
	echo $filtro1

	while read -r projetos || [[ -n "$projetos" ]] 
	do 
		i=$(($i+1))
		echo $projetos,$i
		
		aux=$(cat "$dir/$projetos" | more | grep "\b$2\b")

		if [ $? -ne 0 ]; then
			echo "nao"
		else
			linha=$(echo $aux | sed 's/,[ ]/,/g')
			echo $linha >> /home/facom/Resultados/Transaction/TOP/Projeto/$filtro1.txt
			#linha_aux=$linha
			#$(echo "$aux" | tr '\b, \b' ',')
			#linha1=$(echo $linha | sed 's/[ ]/\n/g')
			#echo $linha1
			#echo $linha >> '/home/facom/Resultados/Transaction/TOP/Diff/teste.txt'
		fi

	done<"$pop/projetosInline.txt" #nome das Bibliotecas
	i=$(($i-$i))

	sed 's/ /\n/g' /home/facom/Resultados/Transaction/TOP/Projeto/$filtro1.txt >> /home/facom/Resultados/Transaction/TOP/Diff/$filtro1.txt

done<"$pop/TOP.csv" #nome das Bibliotecas