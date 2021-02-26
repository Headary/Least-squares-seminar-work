
set key top left width -4
set grid

set xlabel "\\popi{\\Delta T}{\\C}"
set ylabel "\\popi{E}{mV}" norotate offset 2,0

set xrange [0:100]
set yrange [0:*]

f(x) = a*x
g(x) = b*x

fit f(x) "data.src.dat" u 1:2 via a
fit g(x) "data.src.dat" u 1:3 via b

plot "data.src.dat" u 1:2 ls 1 pt 2 lw 3 title "1. měření",\
    ""              u 1:3 ls 2 pt 4 lw 3 title "2. měření",\
    [0:85] f(x)           ls 1 dt 2 lw 3 title "1. funkce",\
    [0:85] g(x)           ls 2 dt 3 lw 3 title "2. funkce"
