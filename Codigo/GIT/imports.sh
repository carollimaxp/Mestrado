#!/bin/bash

# Para os Projetos
dir="/home/facom/Documents/GIT/Projetos"

#Para as Bibliotecas
#dir="/home/facom/Documents/GIT/Bibliotecas"

#para substituir ; por , e remover , do final  tr ';' ',' | sed 's/[;]$//' 
#remover a primeira coluna

#entra em cada projeto do Git
while read -r pasta || [[ -n "$pasta" ]] 
do 
	i=$(($i+1))
	echo "$pasta, $i"

	#pega cada linha do arq ospntjava para interar no while
	while read -r line || [[ -n "$line" ]] 
	do 
		imports=""
		#echo "imports : $imports"
		#imports+="$line, " #nome da classe
		#entra no .java e pega todos os imports
		while read -r pntJava || [[ -n "$pntJava" ]]
		do
			
			if echo "$pntJava" | egrep "^import[ ]*.*;$"
			then
				echo "$pasta"

				var1=$(echo $pntJava | awk -F " " '{print $1,$2,$3}')   
				set -- $var1

				if [ "" == "$3" ]; #não pega os static
				then
					#remover o ;
					filtro=$(echo "$2" | sed 's/;$//' )
					imports+="$filtro,"
					echo "$filtro" >> $dir/imports/$pasta.txt
				#else
					#remover o ;
					#filtro1=$(echo "$3" | sed 's/;$//' )
					#imports+="$2 $filtro1, "
					#echo "$2 $filtro1, " >> /home/facom/Documents/GIT/Projetos/imports/$pasta.txt
				fi
		    fi

		done<"$line"

		
		semvirg=$(echo "$imports" | sed 's/,$//')
		echo "$semvirg" >> $dir/imports/importsLinhaJava/$pasta.txt

	done<"$dir/todospntJava/$pasta.txt" #caminho completo 

	echo "FIM de Pegar os IMPORTS do $pasta"

#done<"$dir/bib.txt" #nome das Bibliotecas
done < "/home/facom/Documents/tudo8.txt" #nome dos Projeto


