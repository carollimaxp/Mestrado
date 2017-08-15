#!/bin/bash

dir="/home/facom/Documents/Teste/GIT/gitDiff"

#entra em cada projeto do Git
while read -r pasta || [[ -n "$pasta" ]] 
do 

	i=$(($i+1))
	echo $pasta,$i

	#pega cada linha do arq ospntjava para interar no while
	while read -r line || [[ -n "$line" ]] 
	do 	
		#\([a-z0-9]\+\.\)\{1,3\}
		if echo "$line" | egrep "^commit[ ][a-z0-9]{40}$" #+import cz.msebera.android.httpclient.client.methods.HttpOptions;
		then
			commit=$line
			echo "$commit"
			echo "$commit" >> $dir/commit/$pasta #/home/facom/Documents/Teste/GIT/gitDiff/Imports
		fi

	done<"$pasta"

	echo "FIM de Pegar os IMPORTS do $pasta"

done<"todosGitDiff.txt"


