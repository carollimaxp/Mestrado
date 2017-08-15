#!/bin/bash

dir="/home/carollima/Documentos/GIT/Teste/Understand"
while read -r pasta || [[ -n "$pasta" ]] 
do 
	echo "create -languages java /home/carollima/Documentos/GIT/Teste/Understand/$pasta.udb" >> $dir/understand.txt	
	echo "add /home/carollima/Documentos/GIT/Projetos/$pasta /home/carollima/Documentos/GIT/Teste/Understand/$pasta.udb" >> $dir/understand.txt
	echo "settings -metrics all $dir/$pasta.udb" >> $dir/understand.txt
	echo "settings -metricsOutputFile $dir/$pasta.csv $dir/$pasta.udb" >> $dir/understand.txt
	echo "analyze $dir/$pasta.udb" >> $dir/understand.txt
	echo "report $dir/$pasta.udb" >> $dir/understand.txt
	echo "metrics $dir/$pasta.udb" >> $dir/understand.txt

done<"/home/carollima/Documentos/GIT/Codigo/lista-nome.txt"





