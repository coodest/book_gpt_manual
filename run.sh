#!/bin/bash

# latex="pdflatex"
latex="xelatex"
bibtex="bibtex"
main="main"
target=$main
# parg="-file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=./ ${target}.tex"
parg="-file-line-error -interaction=nonstopmode -synctex=1 -output-directory=./ ${target}.tex"

start=$SECONDS
rm -f *.log
$latex ${parg} 2>&1 > /dev/null
if [ "$target" == "$main" ]; 
then
$bibtex ${target} 2>&1 > /dev/null
fi
$latex ${parg} 2>&1 > /dev/null
$latex ${parg} 2>&1 > /dev/null
rm -f *.aux
rm -f *.bbl
rm -f *.blg
rm -f *.out
rm -f *.cut
echo compile using $(( SECONDS - start )) s