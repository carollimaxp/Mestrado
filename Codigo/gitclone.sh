##!/bin/bash

dir="/home/facom/Documents/GIT/Projetos"

while read -r linha || [[ -n "$linha" ]]
do	
	
	while read -r Projetos || [[ -n "$Projetos" ]]
	do	

		linhaU=$(cat $dir/$linha | more | grep "$Projetos")

		if [ $? -ne 0 ]; then
			echo "Não $linhaU"
		else
			git clone https://github.com/$linhaU.git
		fi
	done<$dir/semjava.txt

done<$dir/tudo.txt