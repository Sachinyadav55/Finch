build:
	R CMD Rscript -e "library(knitr); knit('kmerDistance.Rnw')"
	latex kmerDistance.tex
	bibtex kmerDistance.aux
	latex kmerDistance.tex
	latex kmerDistance.tex
	dvipdf kmerDistance.dvi

clean:
	rm -rf *.tex *.dvi *.pdf

