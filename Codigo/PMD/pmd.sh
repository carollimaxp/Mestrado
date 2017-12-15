#!/bin/bash

dir="/home/facom/Documents/GIT/Bibliotecas"


#junta todos arquivos em 1 só
while read -r pasta || [[ -n "$pasta" ]] 
do 
	echo $pasta

	cd ~/pmd-bin-5.4.1/bin/
	#./run.sh pmd -d ~/Documents/GIT/Projetos/$pasta/ -f text -R rulesets/java/naming.xml #> ~/Documentos/GIT/$pasta.txt
	./run.sh pmd -d  $dir/$pasta -f text -R rulesets/java/naming.xml #> ~/Documentos/GIT/$pasta.txt
	cd ~/Documents/PMD/

	#bash /home/facom/Documents/Codigo/PMD/colocar-class.sh

	cat *.txt > /home/facom/Documents/Teste/PMD/Tools/$pasta.txt

	echo $pasta.txt

	rm *.txt

done< $dir/bib.txt