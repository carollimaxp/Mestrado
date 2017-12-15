#!/bin/bash

while read -r pasta || [[ -n "$pasta" ]] 
do 
	echo $pasta
	rm -r /home/facom/Documents/GIT/Projetos/$pasta #git
	#rm -r /home/facom/Documents/Teste/GIT/Projetos/$pasta #gitlog

done < "/home/facom/Documents/tudo9.txt"