#!/bin/bash
case "$OSTYPE" in
    linux*) 
    echo "linux platform"
    pdflatex="pdflatex"
    bibtex="bibtex";;
esac
main="main"
target=$main
parg="-file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=./ ${target}.tex"

start=$SECONDS
rm -f *.log
$pdflatex ${parg} 2>&1 > /dev/null
if [ "$target" == "$main" ]; 
then
$bibtex ${target} 2>&1 > /dev/null
fi
$pdflatex ${parg} 2>&1 > /dev/null
$pdflatex ${parg} 2>&1 > /dev/null
rm -f *.aux
rm -f *.bbl
rm -f *.blg
rm -f *.out
rm -f *.cut
echo compile using $(( SECONDS - start )) s