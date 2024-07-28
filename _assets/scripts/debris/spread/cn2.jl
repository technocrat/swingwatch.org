include("spread.jl")
POLLSTER = "CNN/ssrs"
N = 1097
B = 42
T = 50 
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
