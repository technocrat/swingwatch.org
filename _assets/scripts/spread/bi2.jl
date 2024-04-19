include("spread.jl")
POLLSTER = "Big Data"
B = 41
T = 46
N = 1218
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
