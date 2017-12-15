#!/bin/bash

#dir="/media/facom/CarolLima1/Mestrado/gitDiff"
dir="/home/facom/Documents/Teste/GIT"

#entra em cada projeto do Git
while read -r pasta || [[ -n "$pasta" ]] 
do 
	cp $dir/Projetos/gitDiff/$pasta /media/facom/Carol/gitDiff/

done < "$dir/Teste_import-3.txt"
