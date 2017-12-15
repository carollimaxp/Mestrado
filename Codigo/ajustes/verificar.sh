#!/bin/bash

pop="/home/facom/Resultados"

dir="/home/facom/Resultados/Resultados_atualizados"
#dir="/home/facom/Git-Mestrado/api_popularity_paper/data/popularity"

while read -r api || [[ -n "$api" ]] 
do 

	var1=$(echo $api | awk -F "," '{print $1,$2}')   
	set -- $var1

	num=$1
	#value=$1
		
	aux=$(cat "$dir/INTER_metrics.csv" | more | grep "\b$2\b")

	if [ $? -ne 0 ]; then
		echo "$2" >> $pop/Resultados_atualizados/nobot2.txt
	else
		#echo "$aux" 
		var=$(echo $aux | awk -F "[ ]" '{print $1,$2}')   
		set -- $var	
		#echo $num >> $pop/Resultados_atualizados/nobot2.txt
	fi

done<"$pop/Resultados_atualizados/INTER.csv" #nome das Bibliotecas