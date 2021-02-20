
.PHONY: all clean
all: build/seminarka.pdf

clean:
	find build/ -type f -not -name "*.pdf" -exec rm {} \;
	find graf/ -type f -name "*.eps" -exec rm {} \;
	find graf/ -type f -name "*.tex" -exec rm {} \;
	find figures/ -type f -name "*.eps" -exec rm {} \;
	find figures/ -type f -name "*-eps-converted-to.pdf" -exec rm {} \;

DEP=seminarka.tex seminarka.cls sources.bib \
	$(wildcard sekce/*.tex) \
	$(patsubst %.src.plt, %.tex, $(wildcard graf/*.src.plt)) \
	$(patsubst %.src.svg, %.eps, $(wildcard figures/*.src.svg))

build/seminarka.pdf: $(DEP)
	latexmk -xelatex -jobname=build/seminarka seminarka.tex

figures/%.eps: figures/%.src.svg
	inkscape $< -o $@

#graf/ctverce.tex: graf/ctverce.src.plt graf/ctverce.dat
graf/%.tex: graf/%.src.plt
graf/%.tex: graf/%.src.plt graf/%.src.dat
	cd graf && gnuplot -e "set format '$$\"%g\"$$'; set terminal epslatex color size 14.7cm,8.4cm; set output '$(@F)'" $(<F)
	sed -i -e "s/\\includegraphics\[\(.*\)\]{\(.*\)}}/\\includegraphics\[\1\]{graf\/\2.eps}}/" $@
