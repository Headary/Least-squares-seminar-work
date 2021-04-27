
.PHONY: all clean quick
all: build/seminarka.pdf build/seminarka_school_version.pdf build/prezentace.pdf

clean:
	find build/ -type f -not -name "*.pdf" -exec rm {} \;
	find graf/ -type f -name "*.eps" -exec rm {} \;
	find graf/ -type f -name "*.tex" -exec rm {} \;
	find figures/ -type f -name "*.eps" -exec rm {} \;
	find figures/ -type f -name "*-eps-converted-to.pdf" -exec rm {} \;

quick:
	xelatex -output-directory build seminarka.tex

DEP=seminarka.tex seminarka.cls sources.bib \
	$(wildcard sekce/*.tex) \
	$(patsubst %.src.plt, %.tex, $(wildcard graf/*.src.plt)) \
	$(patsubst %.src.svg, %.eps, $(wildcard figures/*.src.svg)) \
	$(wildcard figures/*.jpg)

build/seminarka.pdf: $(DEP)
	latexmk -xelatex -jobname=build/seminarka seminarka.tex

build/seminarka_school_version.pdf: seminarka_school_version.tex $(DEP)
	latexmk -xelatex -jobname=build/seminarka_school_version seminarka_school_version.tex

build/prezentace.pdf: prezentace.tex $(patsubst %.src.plt, %-pres.tex, $(wildcard graf/*.src.plt))
	latexmk -xelatex -jobname=build/prezentace prezentace.tex

figures/%.eps: figures/%.src.svg
	inkscape $< -o $@

gnuplot=cd graf && gnuplot -e "set format '$$\"%g\"$$'; set terminal epslatex color size 16cm,9.5cm; set output '$(@F)'" $(<F)
gnuplot_pres=cd graf && gnuplot -e "set format '$$\"%g\"$$'; set terminal epslatex color size 13.5cm,7cm; set output '$(@F)'" $(<F)

graf/%.tex: graf/%.src.plt graf/%.src.dat
	$(gnuplot)

graf/%.tex: graf/%.src.plt
	$(gnuplot)

graf/%-pres.tex: graf/%.src.plt Makefile
	$(gnuplot_pres)
