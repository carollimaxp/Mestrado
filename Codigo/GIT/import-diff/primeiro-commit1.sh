#!/bin/bash


pop="/home/facom/Documents/Teste/GIT"

#dir="/home/facom/Documents/Teste/GIT/TESTE/gitDiff"
#dir="/home/facom/Documents/Teste/GIT/Tools/gitDiff/MaisImportinline"
dir="/home/facom/Documents/Teste/GIT/Projetos/gitDiff"

# Para os Projetos
#dir="/home/facom/Documents/GIT/Projetos"

#Para as Bibliotecas
#dir1="/home/facom/Documents/GIT/Bibliotecas/imports/importsLinhaJava"

echo "INTER"

while read -r pasta || [[ -n "$pasta" ]] 
do 
	
	var_aux=$(echo $pasta | awk -F "," '{print $1,$2}')   
	set -- $var_aux

	filtro=$2

	filtro1=$(echo "$2" | tr '.' '-' ) #android.os.Build -> android-os-Build
 	echo $filtro1

	while read -r linha || [[ -n "$linha" ]]
		do	

			echo "$filtro1, $linha"
			linhaL=$(cat "$dir/Imports/$linha" | more | grep "$filtro$" ) 

			# RxJava/rxjava-contrib/rxjava-android/src/main/java/rx/android/observables/AndroidObservable.java, 
			# 8a648d94af3acf9b48c11ed4719f61133ec07023, 27, Nov, 2013, android.os.Build
			primeiroCommit=$(tail -1 "$dir/Imports/$linha") # primeiro commit

			var1=$(echo $primeiroCommit | awk -F "," '{print $1,$2,$3,$4,$5,$6}')   
			set -- $var1

			primeiraHash="$2"
			dataCommit="$3/$4/$5"

			primeiro="$primeiraHash, $dataCommit" # hash e Data do primeiro commit
			echo " ***** $primeiro"

			linhaL=$(cat "$dir/Imports/$linha" | more | grep "$filtro$" ) # $pastas = API

			if [ $? -ne 0 ]; then
				echo "nao"
			else
				echo "$linhaL" > $dir/FirstImport/INTER/aux1.txt
				ultimaL=$(tail -1 "$dir/FirstImport/INTER/aux1.txt") #>> $dir/FirstImport/$filtro1.txt

				#RxJava/rxjava-contrib/rxjava-android/src/main/java/rx/android/observables/AndroidObservable.java, 8a648d94af3acf9b48c11ed4719f61133ec07023, 27/Nov/2013, android.os.Build

				var0=$(echo $ultimaL | awk -F "," '{print $1,$2,$3,$4,$5,$6}')   
				set -- $var0 

				resto="$1, $2, $3/$4/$5, $6" #RxJava/rxjava-contrib/rxjava-android/src/main/java/rx/android/observables/AndroidObservable.java, 8a648d94af3acf9b48c11ed4719f61133ec07023, 27/Nov/2013, android.os.Build

				nomeProjeto=$(echo $1 | awk -F "/" '{print $1}')   
				set -- $nomeProjeto

				#RxJava, RxJava/rxjava-contrib/rxjava-android/src/main/java/rx/android/observables/AndroidObservable.java, 
				#8a648d94af3acf9b48c11ed4719f61133ec07023, 27/Nov/2013, android.os.Build

				echo "$1, $primeiro, $resto" >> $dir/FirstImport/INTER/$filtro1.txt

				#echo "$ultimaL" >> $dir/FirstImport/$filtro1.txt
				#contagem=$(cat "$linhaL" | wc -l )
				#echo "***** $ultimaL"

			fi

		done < "$pop/tudo_import.txt"

		rm $dir/FirstImport/INTER/aux1.txt

done<"/home/facom/Resultados/INTER.csv" #nome das Bibliotecas  