include("spread.jl")
POLLSTER = "Quinnipiac University"
N = 1487
B = 36
T = 41
TYPE_POLL = "3-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
