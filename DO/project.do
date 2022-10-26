force ld1 0
force ld2 0
force ld3 0
force value 0000
force enter 0
force reset 1
run 5

force clk 0
run
force clk 1
run
examine ld1 ld2 ld3 enter reset clk value unlock


force reset 0
force enter 1
force ld1 0
force ld2 0
force ld3 0
force value 0000
run 6

force clk 0
run
force clk 1
run
examine ld1 ld2 ld3 enter reset clk value unlock


force ld1 1
force ld2 0
force ld3 0
force value 0111
run 4

force clk 0
run
force clk 1
run
examine ld1 ld2 ld3 enter reset clk value unlock


force ld1 0
force ld2 1
force ld3 0
force value 0101
run 4

force clk 0
run
force clk 1
run
examine ld1 ld2 ld3 enter reset clk value unlock


force reset 1
run

force clk 0
run
force clk 1
run
examine ld1 ld2 ld3 enter reset clk value unlock

force reset 0
force ld1 1
force ld2 0
force ld3 0
force value 0111
run 5

force clk 0
run
force clk 1
run
examine ld1 ld2 ld3 enter reset clk value unlock


force ld1 0
force ld2 1
force ld3 0
force value 0101
run 4

force clk 0
run
force clk 1
run
examine ld1 ld2 ld3 enter reset clk value unlock


force ld1 0
force ld2 0
force ld3 1
force value 1001
run 4

force clk 0
run
force clk 1
run
examine ld1 ld2 ld3 enter reset clk value unlock
