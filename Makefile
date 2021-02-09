build/seminarka.pdf: seminarka.tex seminarka.cls sources.bib $(wildcard sekce/*.tex) $(patsubst graf/%.plt, graf/%.tex, $(wildcard graf/*.plt))
	latexmk -pdflatex -jobname=build/seminarka seminarka.tex

graf/ctverce.tex: graf/ctverce.plt graf/ctverce.dat
graf/%.tex: graf/%.plt
	cd graf && gnuplot $(<F)
	sed -i -e "s/\\includegraphics\[\(.*\)\]{\(.*\)}}/\\includegraphics\[\1\]{graf\/\2.eps}}/" $@
