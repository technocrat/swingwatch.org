include("spread.jl")
POLLSTER = "WSJ"
N = 600
B = 45
T = 48
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
