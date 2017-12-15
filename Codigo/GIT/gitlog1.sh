#!/bin/bash

dir="/home/facom/Documents/GIT/Bibliotecas"
#dir="/home/facom/Documents/GIT/Projetos"

#dir_teste="/home/facom/Documents/Teste/GIT/Tools"
dir_teste="/home/facom/Documents/Teste/GIT/Bibliotecas"

#find $dir/todospntJava/*.txt > "$dir/bib-pntJ.txt"
pnt="/home/facom/Documents/GIT/Bibliotecas/todospntJava"

echo " **** GitLog **** "

while read -r jva || [[ -n "$jva" ]] 
	do #/home/facom/Documents/GIT/Projetos/todospntJava/ActionBarSherlock.txt

	i=$((0))
	echo "Nome do projeto $jva"
	projeto=$jva
	jva=$pnt/$jva.txt

	while read -r line || [[ -n "$line" ]] 
		do #/home/facom/Documents/GIT/Projetos/ActionBarSherlock/actionbarsherlock-fest/src/main/java/org/fest/assertions/api/com/actionbarsherlock/app/ActionBarAssert.java

			mails=$(echo $line | tr "/" "\n")

			#projetos1=$( echo "$jva" | awk  -F "/" '{print $1,$2,$3,$4,$5,$6,$7,$8}' )
			#set -- $projetos1
			#projeto=$(echo "$7" | awk  -F "." '{print $1}')
			#set -- $projeto

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
			
			echo "$i $projeto --> $caminho/$filtro"

			#echo "$classe.$filtro" >> ~/Documents/Teste/GIT/TESTE/$projeto/$i.txt
			echo "$caminho/$filtro" >> $dir_teste/$projeto/$i.txt

			cd $caminho
			git log --first-parent --pretty=format:%H,%an,%ai $caminho/$filtro.java >> $dir_teste/$projeto/$i.txt  
			#i=$(($i+1))


		done < "$jva" 

	#done < "tudo5.txt"
done < "resto1.txt"
	#done < "$dir/bib-pntJ.txt"

	echo " **** GitLog mongo-java-driver **** "