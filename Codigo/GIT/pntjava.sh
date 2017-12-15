#!/bin/bash

#procura dentro das pastas os .java
# Para os Projetos
dir="/home/facom/Documents/GIT/Projetos"

#Para as Bibliotecas
#dir="/home/facom/Documents/GIT/Bibliotecas"


while read -r line || [[ -n "$line" ]] 
	do 
	
		#procura os *.java
		i=$(($i+1))
		echo $i
		#cd $dir/$line
		find $dir/$line -name "*.java" > $dir/todospntJava/SemJava/$line.txt	
#		find /home/facom/Documents/GIT/Bibliotecas/intellij-community -name "*.java" > /home/facom/Documents/GIT/Bibliotecas/todospntJava/intellij-community.txt	

		
	done < "$dir/semjava.txt"
