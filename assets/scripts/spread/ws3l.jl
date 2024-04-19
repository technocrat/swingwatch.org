include("spread.jl")
POLLSTER = "WSJ"
N = 600
B = 40
T = 48
TYPE_POLL = "3-way (long)"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)

