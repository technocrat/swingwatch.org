include("spread.jl")
POLLSTER = "Spry"
TYPE_POLL = "3-way"
N = 709
B = 40
T = 43
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
