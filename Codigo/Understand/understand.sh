#!/bin/bash


dir="/home/facom/Documents/Teste/Understand"
while read -r pasta || [[ -n "$pasta" ]] 
do 
	echo "create -languages java $dir/$pasta.udb" >> $dir/understand_bib.txt	
	echo "add /home/facom/Documents/GIT/Bibliotecas/$pasta $dir/$pasta.udb" >> $dir/understand_bib.txt
	echo "settings -metrics all $dir/$pasta.udb" >> $dir/understand_bib.txt
	echo "settings -metricsOutputFile $dir/$pasta.csv $dir/$pasta.udb" >> $dir/understand_bib.txt
	echo "analyze $dir/$pasta.udb" >> $dir/understand_bib.txt
	echo "report $dir/$pasta.udb" >> $dir/understand_bib.txt
	echo "metrics $dir/$pasta.udb" >> $dir/understand_bib.txt
	echo " " >> $dir/understand_bib.txt

done<"/home/facom/Documents/api-projetos.txt"
#"/home/carollima/Documentos/GIT/Codigo/lista-nome.txt"


