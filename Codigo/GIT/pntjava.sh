#!/bin/bash

#procura dentro das pastas os .java

dir="/home/facom/Documents/GIT/Projetos"


while read -r line || [[ -n "$line" ]] 
	do 
	
		#procura os *.java
		i=$(($i+1))
		echo $i
		#cd $dir/$line
		find $dir/$line -name "*.java" >> /home/facom/Documents/GIT/Projetos/todospntJava/$line.txt	
		
	done < "tudo.txt"
