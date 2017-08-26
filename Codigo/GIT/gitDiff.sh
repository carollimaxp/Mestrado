#!/bin/bash
dir="/home/facom/Documents/GIT/Projetos"

while read -r pasta || [[ -n "$pasta" ]] 
	do
		echo "$pasta"
		cd $dir/$pasta 
		git log --full-diff -p --raw --minimal > /home/facom/Documents/Teste/GIT/TESTE/gitDiff/$pasta.txt #historico
		#git log --pretty=format:%H,%an,%ai $caminho/$pjava  >> $dir/$projeto/$nomeJ.txt #ISO8601  2015-11-17 17:50:01 +0100

	done < "$dir/teste.txt" 
	#done < "cont-lista2.txt"
	#done < "cont-lista3.txt"