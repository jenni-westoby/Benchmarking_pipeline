#!/bin/bash

#cd into directory you want to put files in
cd /lustre/scratch108/compgen/team218/jw28/kolod

#download files into directory
cat /lustre/scratch108/compgen/team218/jw28/weblinks.txt | /lustre/scratch108/compgen/team218/jw28/parallel --gnu "wget -t 100 {}"
