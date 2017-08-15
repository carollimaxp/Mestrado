#!/bin/bash

#pegar os arquivos com a classe na frente mandar os metodos, classe e variaveis para arquivos e fazer media
dir="/home/carollima/Documentos/GIT/Teste/PMD/Projeto1/Temp"
find $dir/*.txt > temp.txt

while read -r line || [[ -n "$line" ]] 
	do
		while read -r linha || [[ -n "$linha" ]] 
		do
			class=$(cat $line | head -1 $line |cut -d ',' -f 1) #pega a classe
			mediaClass=$(cat $line | head -1 $line |cut -d ',' -f 3) #pega tamanho da classe

			if echo "$linha" | egrep "*variable:*"
				then
					tamV=$(awk '{print $NF}')
					somaVar=$((somaVar+tamV))
					#echo "Soma: $somaVar, tam: $tamV"
			    fi
	 		if echo "$linha" | egrep "*method:*"
				then
					#tamM=$(awk '{print $NF}')
				    echo $linha
					#tam=$(awk '{print $NF}') 
					#somaTamMet=$(($somaTamMet+$tam))
					#echo "$linha  Soma: $somaTamMet, tam: $tam"
			    fi
	 	done < $line

 		#echo $class', '$mediaClass 
		#echo $class', '$somaTamMet 
		#echo $class', '$somaTamVar 

	done<"$dir/text.txt"

