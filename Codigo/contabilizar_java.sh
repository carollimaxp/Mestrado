#contabilizar .java

dir="/home/facom/Documents/GIT/Projetos/todospntJava"
dir1="/home/facom/Resultados"

while read -r pasta || [[ -n "$pasta" ]] 
do 

	linha=$(wc -l $dir/$pasta)

	var0=$(echo $linha | awk -F " " '{print $1,$2}')   
	set -- $var0 

	projeto=$2
	#linha=$(($1+1))

	echo "$1, $pasta" >> $dir1/arqJava1.txt

done<"/home/facom/Resultados/tdsjava.txt" #nome das Bibliotecas