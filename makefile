TARGET = index

.PHONY: all
all: ${TARGET}.pdf

${TARGET}.pdf: ${TARGET}.glg
	latexmk -pdf index.tex

${TARGET}.glg: ${TARGET}.aux
	makeglossaries  index

${TARGET}.aux: index.tex
	latex index.tex
