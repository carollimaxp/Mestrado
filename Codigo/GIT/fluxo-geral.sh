#!/bin/bash

dir="/home/facom/Documents/Codigo/GIT"
dir1="/home/facom/Documents/GIT/Projetos"

cd $dir1

bash $dir/gitClone-Copy.sh

cd $dir

bash $dir/pntjava.sh
bash $dir/imports.sh
bash $dir/gitDiff.sh
bash $dir/GitLog.sh
bash $dir/removepasta.sh