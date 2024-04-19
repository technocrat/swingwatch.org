include("spread.jl")
POLLSTER = "Emerson College"
N = 1000
B = 44
T = 46
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
