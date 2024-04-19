ST = "MI"
#------------------------------------------------------------------
POLLSTER = "Big Data"
B = 41
T = 46
N = 1218
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
TYPE_POLL = "3-way"
B = 40
T = 44
result = spread(B,T,N)
#------------------------------------------------------------------
POLLSTER = "Bloomberg/Morning Consult"
N = 698
B = 43
T = 47
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
B = 38
T = 43
TYPE_POLL = "3-way"
result = spread(B,T,N)
#------------------------------------------------------------------
POLLSTER = "CNN/ssrs"
N = 1097
B = 42
T = 50 
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
TYPE_POLL = "3-way"
B = 34
T = 40
result = spread(B,T,N)
#------------------------------------------------------------------
POLLSTER = "Emerson College"

N = 1000
B = 44
T = 45
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
B = 41
T = 43
TYPE_POLL = "3-way"
result = spread(B,T,N)
#------------------------------------------------------------------
POLLSTER = "Highpoint"
N =
B =
T =
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
B =
T =
TYPE_POLL = "3-way"
result = spread(B,T,N)
#------------------------------------------------------------------
POLLSTER = "Marist"
N =
B =
T =
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
B =
T =
TYPE_POLL = "3-way"
result = spread(B,T,N)
#------------------------------------------------------------------
POLLSTER = "Quinnipiac University"
N = 1487
B = 45
T = 48
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
B = 36
T = 41
TYPE_POLL = "3-way"
result = spread(B,T,N)
#------------------------------------------------------------------
POLLSTER = "Spry"
N = 709
B = 44
T = 48
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
TYPE_POLL = "3-way"
B = 40
T = 43
result = spread(B,T,N)

#------------------------------------------------------------------
POLLSTER = Suquehanna
N =
B =
T =
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
B =
T =
TYPE_POLL = "3-way"
result = spread(B,T,N)
#------------------------------------------------------------------
POLLSTER = "WSJ"
N = 600
B = 45
T = 48
TYPE_POLL = "2-way"
result = spread(B,T,N)
create_ribbon_chart(result, ST, TYPE_POLL, POLLSTER)
B = 40
T = 48
TYPE_POLL = "3-way (long)"
result = spread(B,T,N)

B = 37
T = 39
TYPE_POLL = "3-way (short)"
result = spread(B,T,N)

#------------------------------------------------------------------
