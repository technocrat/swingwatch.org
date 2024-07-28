include("spread.jl")
POLLSTER = "Bloomberg/Morning Consult"
N = 698
B = 43
T = 47
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
