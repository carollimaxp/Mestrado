#!/bin/bash
dir="/home/facom/Documents/GIT/Projetos"

find $dir/todospntJava/*.txt > pntJ.txt

while read -r jva || [[ -n "$jva" ]] 
	do #/home/facom/Documents/GIT/Projetos/todospntJava/ActionBarSherlock.txt

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

			    if echo "$addr" | egrep "*.java"; 
			    then 
			    	pjava=$(echo $addr)
			    	nomeJ=$(echo $addr |cut -d "." -f 1 )
			    	#nomeJ=${nome[1]} 
			    	#nomeJ=$(echo ${nome[0]} )
			    	echo "Nome do .java   *****  $nomeJ"

				else
			    	caminho=$caminho/$addr
			    	#if [ ["$addr" != "home"] || ["$addr" != "facom"] || ["$addr" != "Documents"] || ["$addr" !=  "GIT"] || ["$addr" != "Projetos"] || ["$addr" != "ActionBarSherlock"] ];
			    	#then	
			    		classe=$classe.$addr
			    	#fi
			    	#echo $caminho
				fi
				
			done

			echo "Caminho  *****  $caminho/$pjava"
			
			mkdir ~/Documents/Teste/GIT/$projeto
			echo "$classe.$nomeJ" >> ~/Documents/Teste/GIT/$projeto/$nomeJ.txt 
			#git log --pretty=format:%H,%an,%ad $dir$caminho/$pjava >> ~/Documents/Teste/GIT/$projetos/$nomeJ.txt
			cd $caminho
			git log --pretty=format:%H,%an,%ai $caminho/$pjava  >> ~/Documents/Teste/GIT/$projeto/$nomeJ.txt #ISO8601  2015-11-17 17:50:01 +0100
			
			#git log --pretty=format:%h,%cN,%cD

		done < "$jva" 

	done < "pntJ-n.txt" 