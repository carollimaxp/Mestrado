#pega todos os imports e junta em um arquivo para ver quantas vezes ele apareceu em todos os projetos

for (( i = 1; i < 51; i++ )); do
	cat imports/imports-$i.txt >> tudo-1.txt
done

cat tudo-1.txt | sort | uniq -c > tudo-resultado1.txt

sort -k1 tudo-resultado1.txt > tudo-resultado1-fim.txt


