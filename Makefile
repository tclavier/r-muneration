CLEAN=*~ *.rtf *.ps *.log *.dvi *.aux *.pdf *.out *.html *.css *.bak *.toc *.pl *.4ct *.4tc *.lg *.sxw *.tmp *.xref *.idv *.tns *.odt
TEXFILES = $(wildcard *.tex)
SVGFILES = $(wildcard *.svg)

all: pdf

%.pdf: %.tex
	pdflatex  $<
	pdflatex  $<

%.png: %.svg
	inkscape -f $< -e $@

clean:
	-rm -f $(CLEAN)

pdf: $(patsubst %.tex,%.pdf,$(TEXFILES)) png
png: $(patsubst %.svg,%.png,$(SVGFILES)) 
tout: pdf 
