#!/bin/bash

latex  -interaction=nonstopmode  article.tex
bibtex article
latex  -interaction=nonstopmode  article.tex
bibtex article
latex  -interaction=nonstopmode  article.tex
latex  -interaction=nonstopmode  article.tex
latex  -interaction=nonstopmode  article.tex

dvips -o article.ps article.dvi
ps2pdf article.ps article.pdf
./Clean.sh
