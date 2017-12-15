#!/bin/bash

dir="/home/facom/Documents/Teste/GIT/"

while read -r pasta || [[ -n "$pasta" ]] 
do 

	projeto=$(cat $dir/Teste_import.txt | more | grep "$pasta")

	if [ "$projeto" = "" ];
	then
		echo $pasta >> $dir/Teste_maisinline.txt
	fi

	#echo $projeto, $pasta >> $dir/Teste.txt

done < "$dir/Teste.txt"

echo "Tudo Gitdiff"