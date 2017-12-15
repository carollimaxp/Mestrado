#!/bin/bash

#dir="/home/facom/Documents/GIT/Bibliotecas"
dir="/home/facom/Documents/GIT/Projetos"

while read -r pasta || [[ -n "$pasta" ]] 
	do
		i=$(($i+1))
		echo "$pasta, $i"
		cd $dir/$pasta 
		#git log --full-diff -p --raw --minimal > /home/facom/Documents/Teste/GIT/Tools/gitDiff/$pasta.txt #historico
		git log --first-parent --full-diff -p --raw --minimal > /home/facom/Documents/Teste/GIT/Projetos/gitDiff/$pasta.txt #historico

	#done < "$dir/bib.txt" 
	done < "/home/facom/Documents/tudo9.txt"
	#done < "cont-lista3.txt"