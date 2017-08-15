#!/bin/bash

dir="/home/facom/Documents/Teste/GIT/gitDiff"

#entra em cada projeto do Git
while read -r pasta || [[ -n "$pasta" ]] 
do 
	var0=$(echo $pasta | awk -F "." '{print $1,$2}')   
	set -- $var0

	projeto="$1"

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
			echo $commit
		fi

		if echo "$line" | egrep "^Date:[ ]*"
		then 
			var=$(echo $line | awk -F ":[ ]" '{print $1,$2,$3,$4,$5,$6}')   
			set -- $var
			data=$3", "$6
			echo $data
		fi

		if echo "$line" | egrep "^diff[ ]--git[ ]*.*$" # diff --git a/x b/x
		then 
			if [ "$lineImport" != "" ];
			then
				echo "$projeto$path, $lineImport" >> $dir/MaisImportinline/$pasta
				echo " $projeto$path, $lineImport"
				lineImport=""
			fi

			var2=$(echo $line | awk -F " " '{print $1,$2,$3,$4}')   
			set -- $var2

			path=$(echo $4 | sed 's/^b//') #echo x/asclkc | sed 's/^x//' >> /asclkc
			echo "$path"
		fi

		if echo "$line" | egrep "^[+]import[ ]*.*;$" #+import cz.msebera.android.httpclient.client.methods.HttpOptions;
		then
			importtext=$(echo "$line" | sed 's/^[+]import[ ]//' ) #remover +import
			filtro=$(echo "$importtext" | sed 's/;$//' ) # saids: cz.msebera.android.httpclient.client.methods.HttpOptions
			#echo $importtext
			lineImport+="$filtro, " #imports+="$filtro, "
			#echo "$projeto$path, $commit, $data, $importtext"
			echo "$projeto$path, $commit, $data, $filtro" >> $dir/Imports/$pasta #/home/facom/Documents/Teste/GIT/gitDiff/Imports
		fi


	done<"$pasta"

	echo "FIM de Pegar os IMPORTS do $pasta"

done<"todosGitDiff.txt"


