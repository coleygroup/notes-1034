.PHONY: all clean build

filename=main
SHELL=/bin/bash

all:
	pdflatex ${filename}
	biber ${filename}
	pdflatex ${filename}
	pdflatex ${filename}

clean:
	rm -f ${filename}.{ps,log,aux,out,dvi,bbl,blg,toc,bcf,run.xml,synctex.gz}
	rm -rf tex/*.aux

build: all clean
