MAIN = assignment_2

%.pdf: %.tex $(wildcard *.tex) refs.bib
	pdflatex $*.tex
	bibtex $*
	pdflatex $*
	pdflatex $*.tex

all: $(MAIN).pdf

view: all
	xdg-open $(MAIN).pdf

clean:
	rm -f *.log *.aux *.dvi *.toc *.lof *.bbl *.blg *.out *.brf $(MAIN).pdf
count:
	perl texcount.pl *.tex
