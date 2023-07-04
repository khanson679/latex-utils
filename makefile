TEX := $(wildcard test/*-test.tex)
PDF := $(TEX:.tex=.pdf)
BUILDDIR := build
# TESTDOCS := khabstract-test kharticle-test khbeamer-test khhandout-test \
# 	khplain-test khslides-test
# TEX := $(addsuffix .tex, $(TESTDOCS))
# PDF := $(addsuffix .pdf, $(TESTDOCS))
LATEX := latexmk -pdf -outdir=build -interaction=batchmode

all: $(PDF)

%.pdf : %.tex
	$(LATEX) $<

.PHONY: cleanaux clean
cleanaux:
	$(LATEX) -c $(TEX)
clean:
	rm -rf $(BUILDDIR)
