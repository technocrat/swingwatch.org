include("spread.jl")
POLLSTER = Suquehanna
N =
B =
T =
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
