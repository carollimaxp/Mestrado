#!/bin/bash

dir="/home/facom/Documents/GIT/Projetos"

dir_teste="/home/facom/Documents/Teste/GIT/TESTE"

find $dir/todospntJava/*.txt > "$dir/teste-pntJ.txt"

echo " **** pntJ **** "

while read -r jva || [[ -n "$jva" ]] 
	do #/home/facom/Documents/GIT/Projetos/todospntJava/ActionBarSherlock.txt
	i=$((0))
	while read -r line || [[ -n "$line" ]] 
		do #/home/facom/Documents/GIT/Projetos/ActionBarSherlock/actionbarsherlock-fest/src/main/java/org/fest/assertions/api/com/actionbarsherlock/app/ActionBarAssert.java

			mails=$(echo $line | tr "/" "\n")

			#var1=$(echo $pntJava | awk -F " " '{print $1,$2,$3}')
			projetos1=$( echo "$jva" | awk  -F "/" '{print $1,$2,$3,$4,$5,$6,$7,$8}' )
			set -- $projetos1
			projeto=$(echo "$7" | awk  -F "." '{print $1}')
			set -- $projeto
			echo "Nome do projeto $projeto"

			caminho=""
			pjava=""
			classe=""

			for addr in $mails
			do

			    if echo "$addr" | egrep "*.java$"; 
			    then
			    	filtro=$(echo "$addr" | sed 's/.java$//' )
				else
			    	caminho=$caminho/$addr	
			    	#classe=$classe.$addr # troquei pq existem nomes de arquivos com pontos no meio
				fi
				
			done

			echo "Caminho  *****  $caminho/"
			
			mkdir $dir_teste/$projeto
			
			#git log --pretty=format:%H,%an,%ad $dir$caminho/$pjava >> ~/Documents/Teste/GIT/$projetos/$nomeJ.txt
			#cd $caminho
			i=$(($i+1))
			
			echo "$i $caminho/$filtro"

			#echo "$classe.$filtro" >> ~/Documents/Teste/GIT/TESTE/$projeto/$i.txt
			echo "$caminho/$filtro" >> $dir_teste/$projeto/$i.txt

			cd $caminho
			git log --pretty=format:%H,%an,%ai $caminho/$filtro.java >> $dir_teste/$projeto/$i.txt  #
			#i=$(($i+1))


		done < "$jva" 

	done < "$dir/teste-pntJ.txt"