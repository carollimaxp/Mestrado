#!/bin/bash

#dir="/Volumes/CarolLima1/Mestrado/gitDiff"
dir="/home/facom/Documents/Teste/GIT/Projetos/gitDiff"
destino="/home/facom/Documents/Teste/GIT"

#entra em cada projeto do Git
while read -r pasta || [[ -n "$pasta" ]] 
do 
	#var0=$(echo $pasta | awk -F "." '{print $1,$2}')   
	#set -- $var0

	projeto="$pasta"

	i=$(($i+1))
	echo $projeto,$i

	lineImport=""

	#pega cada linha do arq ospntjava para interar no while
	while read -r line || [[ -n "$line" ]] 
	do 

		if echo "$line" | egrep "^commit[ ][a-z0-9]{40}$"
		then
			#commit=$line
			var1=$(echo $line | awk -F " " '{print $1,$2}')   
			set -- $var1	
			commit=$2
			#echo $commit
		fi

		if echo "$line" | egrep "^Date:[ ]*" # [ ] Sun Mar 20 14:55:25 2016 +0100
		then 
			var=$(echo $line | awk -F ":[ ]" '{print $1,$2,$3,$4,$5,$6}')   
			set -- $var
			data=$4", "$3", "$6 # day/month/year
			#echo $data
		fi

		if echo "$line" | egrep "^diff[ ]--git[ ]*.*.java$" # diff --git a/x b/x
		then 
			if [ "$lineImport" != "" ];
			then
				linhasemVirgula=$(echo $lineImport | sed 's/,$//')
				echo "$linhasemVirgula" >> $dir/MaisImportinline/$pasta
				#echo "Sem Vírgula: $linhasemVirgula"
				lineImport=""
			fi

			var2=$(echo $line | awk -F " " '{print $1,$2,$3,$4}')   
			set -- $var2

			path=$(echo $4 | sed 's/^b//') #echo x/asclkc | sed 's/^x//' >> /asclkc
			#aux=$(echo $path | sed 's/.java$//') 

			echo "Path : $path"
		fi

		if echo "$line" | egrep "^[+]import[ ]*.*;$" #+import cz.msebera.android.httpclient.client.methods.HttpOptions;
		then
			
			var1=$(echo $line | awk -F " " '{print $1,$2,$3}')   
			set -- $var1

			if [ "" == "$3" ]; #não pega os static
				then
				
				importtext=$(echo "$line" | sed 's/^[+]import[ ]//' ) #remover +import
				filtro=$(echo "$importtext" | sed 's/;$//' ) # saids: cz.msebera.android.httpclient.client.methods.HttpOptions
				#echo $importtext
				lineImport+="$filtro, " #imports+="$filtro, "
				#echo "$projeto$path, $commit, $data, $importtext"
				echo "Projeto --> $projeto"
				echo "$projeto$path, $commit, $data, $filtro" >> $dir/Imports/$pasta #/home/facom/Documents/Teste/GIT/gitDiff/Imports
			fi
		fi

	done<"$dir/$pasta"

	echo "FIM de Pegar os IMPORTS do $projeto"

done < "$destino/Teste_import-1.txt"

echo "Teste Imports-1"
#done<"$dir/bib-Diff.txt"

