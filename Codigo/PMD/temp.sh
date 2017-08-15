#!/bin/bash

#pegar os arquivos com a classe na frente mandar os metodos, classe e variaveis para arquivos e fazer media
dir="/home/carollima/Documentos/GIT/Teste/PMD/Projeto1"

while read -r line || [[ -n "$line" ]] 
	do
		i=$(($i+1))
		while read -r linha || [[ -n "$linha" ]] 
		do
			
			class=$(cat $line | head -1 $line |cut -d ',' -f 1) #pega a classe
			mediaClass=$(cat $line | head -1 $line |cut -d ',' -f 3) #pega tamanho da classe

			#echo $class, $mediaClass > $dir/Temp/$i-c.txt

			if echo "$linha" | egrep "*variable:*"
				then
					echo $linha >> $dir/Temp/$i-v.txt
			    fi
	 		if echo "$linha" | egrep "*method:*"
				then
					echo $linha >> $dir/Temp/$i-m.txt
			    fi
	 	done < "$line"

	done<"text.txt"

	
