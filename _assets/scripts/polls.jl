@enum State PA GA NC MI AZ WI NV
STATE = State
mon       = "apr"
st        = "AZ"
ST        =  AZ
include("polls_head.jl")

@load "../objs/"*"$mon"*"_Polls.bson" months

current_month = remove_empties(months[apr])

include("polls_foot.jl")

