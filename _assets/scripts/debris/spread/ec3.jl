include("spread.jl")
POLLSTER = "Emerson College"
N = 1000
B = 41
T = 43
TYPE_POLL = "3-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
