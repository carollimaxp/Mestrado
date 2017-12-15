#!/bin/bash

dir="/home/facom/Documents/GIT/Bibliotecas"
#dir="/home/facom/Documents/GIT/Projetos"

#dir_teste="/home/facom/Documents/Teste/GIT/Tools"
dir_teste="/home/facom/Documents/Teste/GIT/Bibliotecas"

#find $dir/todospntJava/*.txt > "$dir/bib-pntJ.txt"

pnt="/home/facom/Documents/GIT/Bibliotecas/todospntJava"

echo " **** GitLog **** "

while read -r jva || [[ -n "$jva" ]] 
	do #ActionBarSherlock.txt

	i=$((0))
	
	while read -r line || [[ -n "$line" ]] 
		do #/home/facom/Documents/GIT/Projetos/ActionBarSherlock/actionbarsherlock-fest/src/main/java/org/fest/assertions/api/com/actionbarsherlock/app/ActionBarAssert.java

			mails=$(echo $line | tr "/" "\n")

			projeto=$(echo "$jva" | awk  -F "." '{print $1}')
			set -- $projeto

			#echo "Nome do projeto $projeto"

			caminho=""
			pjava=""
			classe=""

			for addr in $mails
			do

			    if echo "$addr" | egrep "*[.]java$"; 
			    then
			    	filtro=$(echo "$addr" | sed 's/[.]java$//' )
				else
			    	caminho=$caminho/$addr	
			    	#classe=$classe.$addr # troquei pq existem nomes de arquivos com pontos no meio
				fi
			done

			#echo "Caminho  *****  $caminho/"
			
			mkdir $dir_teste/$projeto
			
			#git log --pretty=format:%H,%an,%ad $dir$caminho/$pjava >> ~/Documents/Teste/GIT/$projetos/$nomeJ.txt
			#cd $caminho
			i=$(($i+1))
			
			echo "$i $projeto"

			#echo "$classe.$filtro" >> ~/Documents/Teste/GIT/TESTE/$projeto/$i.txt
			filtro=$(echo "$line" | sed 's/[.]java$//' )
			echo "$filtro" >> $dir_teste/$projeto/$i.txt

			cd $caminho
			git log --first-parent --pretty=format:%H,%an,%ai $line >> $dir_teste/$projeto/$i.txt  
			#i=$(($i+1))

		done < "$pnt/$jva" 

	#done < "tudo5.txt"
done < "$dir/tudo-bib.txt"
	#done < "$dir/bib-pntJ.txt"

	echo " **** GitLog Bib **** "