#!/bin/bash


#em cada projeto dar o sort e uniq; depois junta todos os projeto em seguida sort e uniq
dir="/home/facom/Documents/GIT/Projetos/imports"

while read -r pasta || [[ -n "$pasta" ]] 
do

	cat $dir/$pasta.txt | sort | uniq -c > $dir/x1.txt
	#cat $dir/$pasta.txt | sort | uniq >> $dir/contabilizado/unico_$pasta.txt
	cat $dir/x1.txt | sort -n -rk1 > $dir/contabilizado/$pasta.txt

	cat $dir/$pasta.txt | sort | uniq >> $dir/x2.txt # todas as bibliotecas com uma unica repetição

done<"lista-nome.txt" #nome do projeto

#rm $dir/x1.txt

#cat $dir/*.txt > $dir/projeto.txt

cat $dir/x2.txt | sort | uniq -c > $dir/projeto.txt
cat $dir/projeto.txt | sort -n -rk1 > $dir/projeto-R.txt

#cat $dir/projeto.txt | sort | uniq -c > $dir/projeto1.txt
#cat $dir/projeto1.txt | sort -n -rk1 > $dir/projeto-R.txt

rm $dir/projeto.txt
rm $dir/x1.txt


#sort -rk4 Contabilizado/tudo-fim.txt > Contabilizado/pronto.txt
#uniq Contabilizado/tudo-fim.txt > Contabilizado/pronto.txt
#echo "pronto"

#for (( i = 1; i < 51; i++ )); do
#	cat imports/imports-$i.txt| sort | uniq > imports/out-$i.txt #ordenado
	#uniq --skip-char=7 imports/out-$i.txt > imports/out-u-$i.txt #unico
	#echo "$i"
	#cat imports/out-u-$i.txt >> tudo-parcial-1.txt #unicos de cada projeto
#done

#cat tudo-parcial-1.txt | sort | uniq -c > tudo-resultado2.txt
#cat tudo-resultado2.txt | sort -rk1 > tudo-resultado2-fim.txt
