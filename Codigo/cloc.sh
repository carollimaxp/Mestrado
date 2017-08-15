#!/bin/bash

while read -r pasta || [[ -n "$pasta" ]] 
do 
	cloc --out ~/Documentos/GIT/Teste/Cloc/$pasta.txt ~/Documentos/GIT/Projetos/$pasta/
done<"lista-nome.txt"