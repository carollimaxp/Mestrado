#!/bin/bash
dir="/home/facom/Documents/GIT/Projetos"

while read -r pasta || [[ -n "$pasta" ]] 
	do
		cd $dir/$pasta 
		git log --full-diff -p --raw --minimal > /home/facom/Documents/Teste/GIT/gitDiff/$pasta.txt

	done < "cont-lista1.txt" 
	#done < "cont-lista2.txt"
	#done < "cont-lista3.txt"