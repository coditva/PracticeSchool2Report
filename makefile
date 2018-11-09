TEX_C     = latex
TEX_C_PDF = pdflatex
TEX_C_GLO = makeglossaries

TARGET    = index
GLOSSARY  = glossaryentries.tex
CHAPTERS  = chapters/appendices.tex \
            chapters/conclusions.tex \
            chapters/introduction.tex \
            chapters/main.tex \
            chapters/acknowledgements.tex \
            chapters/references.tex \
            chapters/abstract.tex
DEPS      = ${CHAPTERS} \
			coverpage.sty \
			assets/images/*

.PHONY: all pdf

all: pdf
pdf: ${TARGET}.pdf

${TARGET}.pdf: ${TARGET}.gls ${TARGET}.aux
	${TEX_C_PDF} ${TARGET}

# When making glossaries, we always need the aux file. This is generated in this
# target itself and not added as a dependency because it gets modified when
# creating the .gls file.
${TARGET}.gls: ${GLOSSARY}
	${TEX_C} ${TARGET}
	${TEX_C_GLO} ${TARGET}
	${TEX_C} ${TARGET}

${TARGET}.aux: ${TARGET}.tex ${DEPS} ${GLOSSARY}
	${TEX_C} ${TARGET}

clean:
	rm -rf *.aux *.dvi *.fls *.glg *.glo *.gls *.ist *.pdf *.toc *.out
