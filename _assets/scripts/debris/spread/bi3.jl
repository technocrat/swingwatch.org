include("spread.jl")
POLLSTER = "Big Data"
N = 1218
B = 40
T = 44
TYPE_POLL = "3-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)

