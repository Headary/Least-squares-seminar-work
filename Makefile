
.PHONY: all
all: build/seminarka.pdf

DEP=seminarka.tex seminarka.cls sources.bib \
	$(wildcard sekce/*.tex) \
	$(patsubst %.src.plt, %.tex, $(wildcard graf/*.src.plt)) \
	$(patsubst %.src.svg, %.eps, $(wildcard figures/*.src.svg))

build/seminarka.pdf: $(DEP)
	latexmk -pdflatex -jobname=build/seminarka seminarka.tex

figures/%.eps: figures/%.src.svg
	inkscape $< -o $@

graf/ctverce.tex: graf/ctverce.src.plt graf/ctverce.dat
graf/%.tex: graf/%.src.plt
	cd graf && gnuplot $(<F)
	sed -i -e "s/\\includegraphics\[\(.*\)\]{\(.*\)}}/\\includegraphics\[\1\]{graf\/\2.eps}}/" $@
