CC      =       pdflatex
BCC     =       bibtex
FLAGS   =       -shell-escape
WHITE		=				$(cat main.tex | sed 's/\\pagecolor{base03}/%/g')

DATE= $(shell date +'%Y-%m-%d')

Color:  Main.tex
				${CC} ${FLAGS} -jobname=Colored Main.tex;
				bibtex Colored;
				${CC} ${FLAGS} -jobname=Colored Main.tex;
				${CC} ${FLAGS} -jobname=Colored Main.tex;


White:  whitetex
				${CC} ${FLAGS} -jobname=White whitetex
				bibtex White;
				${CC} ${FLAGS} -jobname=White whitetex;
				${CC} ${FLAGS} -jobname=White whitetex;

whitetex: Main.tex
			sed 's/\\pagecolor{base03}/%/g' $< >$@;

bibtex:
				${BCC} biblio

clean:
				rm -f *gz *blx* *.bcf *.xml *bak *.out *.log *.aux *.lot *.toc *.bbl *.blg *mk *fls *lof


all: Color White
