set terminal epslatex size 15cm,9cm color
set output "ctverce.tex"

f(x) = -(x-6)**2/14 + (x-3)/5 + 5 

set size ratio -1
set xrange [0:14]
set yrange [0:9]
set xtics 1 nomirror
set ytics 1 nomirror
unset key
set border 3
set style rectangle back fc rgb "gray" fs solid 0.5 border -1

load "ctverce2.dat"
plot "ctverce.dat" ls 2 lc rgb "black", f(x) dt 2 lc rgb "black" lw 2
