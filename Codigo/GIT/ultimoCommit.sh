#!/bin/bash


pop="/home/facom/Documents/Teste/GIT"
pop1="/home/facom/Resultados/Resultados_atualizados"

#dir="/home/facom/Documents/Teste/GIT/TESTE/gitDiff"
#dir="/home/facom/Documents/Teste/GIT/Tools/gitDiff/MaisImportinline"
dir="/home/facom/Documents/Teste/GIT/Projetos/gitDiff"


while read -r linha || [[ -n "$linha" ]]
do	

	echo "$linha"

	# RxJava/rxjava-contrib/rxjava-android/src/main/java/rx/android/observables/AndroidObservable.java, 
	# 8a648d94af3acf9b48c11ed4719f61133ec07023, 27, Nov, 2013, android.os.Build

	ultimoCommit=$(head -1 "$dir/Imports/$linha") # ultimo commit
	echo $ultimoCommit >> $pop/ultimoCommit.txt

done < "$pop1/projetosInline.txt"
