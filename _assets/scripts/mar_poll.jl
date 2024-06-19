@enum State PA GA NC MI AZ WI NV
@enum Month mar apr may jun jul aug sep oct


STATE       = State
prior_month = "mar"
mon         = mar
MON         = "mar"
Mon         = "mar"
st          = "NV"
ST          =  NV

include("mar_poll_head.jl")
prior_poll = BSON.load("../objs/"*"$st"*"_2020_p_sample.bson")
@load "../objs/"*"$MON"*"_Polls.bson" months

current_month = remove_empties(months[mon])

include("polls_foot.jl")

