
#sort -rk4 Contabilizado/tudo-fim.txt > Contabilizado/pronto.txt
#uniq Contabilizado/tudo-fim.txt > Contabilizado/pronto.txt
#echo "pronto"

#em cada projeto dar o sort e uniq; depois junta todos os projeto em seguida sort e uniq

for (( i = 1; i < 51; i++ )); do
	cat imports/imports-$i.txt| sort | uniq > imports/out-$i.txt #ordenado
	#uniq --skip-char=7 imports/out-$i.txt > imports/out-u-$i.txt #unico
	echo "$i"
	cat imports/out-u-$i.txt >> tudo-parcial-1.txt #unicos de cada projeto
done

cat tudo-parcial-1.txt | sort | uniq -c > tudo-resultado2.txt
cat tudo-resultado2.txt | sort -rk1 > tudo-resultado2-fim.txt
