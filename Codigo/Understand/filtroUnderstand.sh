#!/bin/bash

dir="/home/facom/Resultados"
destino="/home/facom/Documents/Teste"

#echo "Kind,Name,AvgCyclomatic,AvgCyclomaticModified,AvgCyclomaticStrict,AvgEssential,AvgLine,AvgLineBlank,AvgLineCode,AvgLineComment,CountClassBase,CountClassCoupled,CountClassDerived,CountDeclClass,CountDeclClassMethod,CountDeclClassVariable,CountDeclFile,CountDeclFunction,CountDeclInstanceMethod,CountDeclInstanceVariable,CountDeclMethod,CountDeclMethodAll,CountDeclMethodDefault,CountDeclMethodPrivate,CountDeclMethodProtected,CountDeclMethodPublic,CountInput,CountLine,CountLineBlank,CountLineCode,CountLineCodeDecl,CountLineCodeExe,CountLineComment,CountOutput,CountPath,CountPathLog,CountSemicolon,CountStmt,CountStmtDecl,CountStmtExe,Cyclomatic,CyclomaticModified,CyclomaticStrict,Essential,Knots,MaxCyclomatic,MaxCyclomaticModified,MaxCyclomaticStrict,MaxEssential,MaxEssentialKnots,MaxInheritanceTree,MaxNesting,MinEssentialKnots,PercentLackOfCohesion,RatioCommentToCode,SumCyclomatic,SumCyclomaticModified,SumCyclomaticStrict,SumEssential" >> $destino/under-Filtrado-T.csv

while read -r classes  #org.junit.Test
	do


		var1=$(echo $classes | awk -F "," '{print $1,$2}')   
		set -- $var1

		classes=$2

		echo $classes


		while read -r linha || [[ -n "$linha" ]]
		do	
			echo "$linha"
			linhaU=$(cat $destino/Understand/Tools/$linha | more | grep "\"$classes\",")

			#echo "$arqCSV"

			if [ $? -ne 0 ]; then
				echo "nao"
			else
				echo "$linhaU" >> $destino/Understand/under-Filtrado-Inter.csv
			fi

		#done < "$destino/under-CSV-T.txt"
		done < "$destino/tudo.txt"	

#done < "$dir/Teste_botton.txt"
done < "$dir/INTER.csv"