#!/bin/bash

#rodar a ferramenta ck para as Bibliotecas
dir="/home/facom/Documents/GIT/Bibliotecas"
destino="/home/facom/Documents/Teste/CK/Tools"

while read -r pasta || [[ -n "$pasta" ]] 
do
	echo $pasta
	java -jar /home/facom/Documents/Tools/ck.jar $dir/$pasta $destino/$pasta.csv
	echo "Finalizando $pasta.csv"

#done<"$dir/bib.txt"
done<"/home/facom/Documents/api-projetos.txt"


#falta de memória

java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/junit5 /home/facom/Documents/Teste/CK/Tools/junit5.csv
java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/commons-compress /home/facom/Documents/Teste/CK/Tools/commons-compress.csv
java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/hadoop-20 /home/facom/Documents/Teste/CK/Tools/hadoop-20.csv
java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/groovy-core /home/facom/Documents/Teste/CK/Tools/groovy-core.csv
java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/logging-log4j2 /home/facom/Documents/Teste/CK/Tools/logging-log4j2.csv
java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/reactive-streams-jvm /home/facom/Documents/Teste/CK/Tools/reactive-streams-jvm.csv
java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/JSONassert /home/facom/Documents/Teste/CK/Tools/JSONassert.csv
java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/maven /home/facom/Documents/Teste/CK/Tools/maven.csv
java -jar /home/facom/Documents/Tools/ck.jar /home/facom/Documents/GIT/Bibliotecas/platform_frameworks_support /home/facom/Documents/Teste/CK/Tools/platform_frameworks_support.csv


hadoop-20
commons-compress
groovy-core
logging-log4j2
reactive-streams-jvm
JSONassert
maven
spotbugs