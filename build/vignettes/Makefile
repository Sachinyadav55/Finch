build:
	R CMD Rscript -e "library(knitr); knit('Finch.Rnw')"
	latex Finch.tex
	bibtex Finch.aux
	latex Finch.tex
	latex Finch.tex
	dvipdf Finch.dvi

clean:
	#rm -rf *.tex *.dvi *.pdf

