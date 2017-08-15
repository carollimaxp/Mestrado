#!/bin/bash

#junta todos arquivos em 1 só
while read -r pasta || [[ -n "$pasta" ]] 
do 
	cd ~/pmd-bin-5.4.1/bin/
	./run.sh pmd -d ~/Documentos/GIT/Projetos/$pasta/ -f text -R rulesets/java/naming.xml #> ~/Documentos/GIT/$pasta.txt
	cd ~/Documentos/
	cat *.txt > $pasta.txt
	mv $pasta.txt > ~/Documentos/GIT/Teste/PMD/
	rm *.txt

done<"lista-nome.txt"