
set key top left width -4
set grid

set xlabel "\\popi{\\Delta T}{\\C}"
set ylabel "\\popi{E}{mV}" norotate offset 2,0

set xrange [0:100]
set yrange [0:*]

a = 0.0361673
f(x) = a*x

set style line 3 lc rgb "black"

plot "data.src.dat" u 1:2 ls 1 pt 2 lw 3 title "1. měření",\
    ""              u 1:3 ls 2 pt 4 lw 3 title "2. měření",\
    [0:85] f(x)           ls 3 dt 2 lw 3 title "Proložení bodů"
