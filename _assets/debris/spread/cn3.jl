include("spread.jl")
POLLSTER = "CNN/ssrs"
TYPE_POLL = "3-way"
N = 1097
B = 34
T = 40
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
