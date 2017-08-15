#!/bin/bash

#pegar os arquivos com a classe na frente mandar os metodos, classe e variaveis para arquivos e fazer media
dir="/home/carollima/Documentos/GIT/Teste/PMD/Projeto1/"
find $dir/*.txt > text.txt

while read -r line || [[ -n "$line" ]] 
	do
		while read -r linha || [[ -n "$linha" ]] 
		do
			class=$(cat $dir/$line | head -1 $dir/$line |cut -d ',' -f 1) #pega a classe
			mediaClass=$(cat $dir/$line | head -1 $dir/$line |cut -d ',' -f 3) #pega tamanho da classe

			if echo "$linha" | egrep "*[ ]variable:*"
				then

					tam=`$(($linha | cut -d ', ' -f 3))`
					somaTamVar=$(($somaTamVar + $tam))
					echo "$linha  Soma: $somaTamVar , tam: $tam"
			    fi
	 		if echo "$linha" | egrep "*[ ]method:*"
				then
					tam=`$((cat $linha | cut -d ', ' -f 3))`
					i=$(($i+1))
					somaTamMet=$(($somaTamMet+$tam))
					echo "$linha  Soma: $somaTamMet, tam: $tam"
			    fi
	 	done < $dir/$line

 		echo $class', '$mediaClass >> $dir/GIT/Teste/PMD/Projeto1/1-$line
		echo $class', '$somaTamMet >> $dir/GIT/Teste/PMD/Projeto1/1-$line
		echo $class', '$somaTamVar >> $dir/GIT/Teste/PMD/Projeto1/1-$line

	done<"$dir/text.txt"

