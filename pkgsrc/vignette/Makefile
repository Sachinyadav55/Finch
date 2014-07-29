build:
	R CMD Rscript -e "library(knitr); knit('resvec.Rnw')"
	latex resvec.tex
	bibtex resvec.aux
	latex resvec.tex
	latex resvec.tex
	dvipdf resvec.dvi

clean:
	rm -rf *.tex *.dvi *.pdf

