#!/bin/bash
dir="/home/facom/Documents/GIT/Projetos"

while read -r lista || [[ -n "$lista" ]] 
		do 

	while read -r line || [[ -n "$line" ]] 
		do 
		
			#baixa projetos
			#i=$(($i+1))
			echo $line
			git clone https://github.com/$line
			echo "Terminou o clone $line"
		
		done < "$lista"

	while read -r line || [[ -n "$line" ]] 
		do 
			#mkdir $dir/todospntJava/$line
			#procura os *.java
			#i=$(($i+1))
			echo $line
			arq=$(find $line -name "*.java" | sort -u) 
			echo "$arq" >> todospntJava/$line-ospntjava.txt #arq com os .java
		
		done < "cont-$lista"

	#entra em cada projeto do Git
	#while read -r pasta || [[ -n "$pasta" ]] 
	#	do 
		#dir="/home/carollima/Documentos/GIT/Projetos/$pasta"
			#i=$(($i+1))
	#		echo $pasta

			#pega cada linha do arq ospntjava para interar no while
	#		while read -r line || [[ -n "$line" ]] 
	#		do 
				#echo $line
				#entra no .java e pega todos os imports
	#			while read -r pntJava || [[ -n "$pntJava" ]]
	#			do
					
	#				if echo "$pntJava" | egrep "^import[ ]*.*;$"
	#				then
	#					echo "$pntJava"
	#			    	echo "$pntJava" >> imports/imports-$pasta-ospntjava.txt
	#			    fi
	#
	#			done<"$line"
	#
	#		done<"todospntJava/$pasta-ospntjava.txt"
#
#			echo "FIM de Pegar os IMPORTS do $pasta"
#
#		done<"cont-$lista"


	#Não foi na primeira vez -- fazer manualmente
	#while read -r pasta || [[ -n "$pasta" ]] 
	#	do
	#		rmdir $dir/$pasta
	#	done<"$dir/cont-$lista.txt"

done<"$dir/lista.txt"




