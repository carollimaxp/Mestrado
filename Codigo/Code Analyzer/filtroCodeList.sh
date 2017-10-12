#!/bin/bash

dir="/home/facom/Resultados"
destino="/home/facom/Documents/Teste"

#echo "Kind,Name,AvgCyclomatic,AvgCyclomaticModified,AvgCyclomaticStrict,AvgEssential,AvgLine,AvgLineBlank,AvgLineCode,AvgLineComment,CountClassBase,CountClassCoupled,CountClassDerived,CountDeclClass,CountDeclClassMethod,CountDeclClassVariable,CountDeclFile,CountDeclFunction,CountDeclInstanceMethod,CountDeclInstanceVariable,CountDeclMethod,CountDeclMethodAll,CountDeclMethodDefault,CountDeclMethodPrivate,CountDeclMethodProtected,CountDeclMethodPublic,CountInput,CountLine,CountLineBlank,CountLineCode,CountLineCodeDecl,CountLineCodeExe,CountLineComment,CountOutput,CountPath,CountPathLog,CountSemicolon,CountStmt,CountStmtDecl,CountStmtExe,Cyclomatic,CyclomaticModified,CyclomaticStrict,Essential,Knots,MaxCyclomatic,MaxCyclomaticModified,MaxCyclomaticStrict,MaxEssential,MaxEssentialKnots,MaxInheritanceTree,MaxNesting,MinEssentialKnots,PercentLackOfCohesion,RatioCommentToCode,SumCyclomatic,SumCyclomaticModified,SumCyclomaticStrict,SumEssential" >> $destino/UnderstandFiltrado1.csv

while read -r classes  #org.junit.Test
	do


		var1=$(echo $classes | awk -F "," '{print $1,$2}')   
		set -- $var1

		classes=$(echo $2 | tr '.' '/')
		classes=$classes.java
		echo $classes

		while read -r linha || [[ -n "$linha" ]]
		do	
			echo "$linha"
			linhaU=$(cat $destino/CodeAnalyzer/Tools/$linha | more | grep "$classes,")

			#echo "$arqCSV"

			if [ $? -ne 0 ]; then
				echo "nao"
			else
				echo "$linhaU" >> $destino/CodeAnalyzer/code-Filtrado-B.csv
			fi

		#done < "$destino/code-CSV-T.txt"	
		done < "$destino/tudo.txt"	

#done < "$dir/Bottom.csv"
done < "$dir/inter_teste.txt"
