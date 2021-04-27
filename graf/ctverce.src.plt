f(x) = -(x-6)**2/14 + (x-3)/5 + 5 

set size ratio -1
set xrange [0:14]
set yrange [0:9]
set xtics 1 nomirror
set ytics 1 nomirror
unset key
set border 3
set style rectangle back fc rgb "black" fs solid 0.2 border -1

set xlabel "$x$"
set ylabel "$y$" norotate offset 3,0

load "ctverce2.src.dat"
plot "ctverce.src.dat" pt 2 lc rgb "black" lw 2, f(x) dt 2 lc rgb "black" lw 4
