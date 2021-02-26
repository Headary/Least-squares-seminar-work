
f(x) = exp(x)/2.5 + 1
g(x,min,max)=( (x>=min && x<=max)? f(x) : (1/0) )

set key left
set xrange[0:4]
set yrange [0:*]

set border 3
set xtics nomirror
set ytics nomirror

set xlabel "$x$"
set ylabel "$y$" norotate offset 3,0

set style line 1 lc rgb "#000000" lw 4
set style line 2 lc rgb "#000000" lw 4 dt 2 ps 2

#set arrow 1 from graph 0,0.92 to graph 0,1 filled size screen 0.2,3
#set arrow 2 from graph 0.92,0 to graph 1,0 filled size screen 0.2,3

plot g(x,0.5,3.5) title "$f(x)$" ls 1, \
    "deltas.src.dat" using 1:(f($1)):(0):2 with vectors nohead ls 2 notitle, \
    "deltas.src.dat" using ($1-0.15):(f($1)+$2/2):3 with labels notitle, \
    "deltas.src.dat" using 1:(f($1)+$2) ls 2 pt 6 notitle, \
    "deltas.src.dat" using 1:(f($1)) ls 2 pt 7 notitle
