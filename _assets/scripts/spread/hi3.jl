include("spread.jl")
POLLSTER = "Highpoint"
N = 0
B = 0
T = 0
if(N == 0 | B == O | T == 0)
	println("No data")
else
	TYPE_POLL = "2-way"
	result = spread(B,T,N)
	create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
end
