include("spread.jl")
POLLSTER = "Bloomberg/Morning Consult"
N = 698
B = 38
T = 43
TYPE_POLL = "3-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
