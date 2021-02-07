set terminal epslatex size 15cm,9cm color
set output "ctverce.tex"

f(x) = x/2

set size ratio -1
set xrange [-0.5:15.5]
set yrange [-0.5:*]
set xtics 1 nomirror
set ytics 1 nomirror
unset key
set border 3
set style rectangle back fc rgb "gray" fs solid 0.4 border -1

load "ctverce2.dat"
plot "ctverce.dat" ls 2 lc rgb "black", f(x) dt 2 lc rgb "black" lw 2
