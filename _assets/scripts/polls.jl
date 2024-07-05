@enum State PA GA NC MI AZ WI NV
@enum Month mar apr may jun jul aug sep oct


STATE       = State
prior_month = "may"
mon         = jun
MON         = "jun"
Mon         = "jun"
st          = "NV"
ST          =  NV

include("polls_head.jl")
prior_poll = BSON.load("../objs/"*"$st"*"_"*"$prior_month"*"_p_sample.bson")
@load "../objs/"*"$MON"*"_Polls.bson" months

current_month = remove_empties(months[mon])

include("polls_foot.jl")

