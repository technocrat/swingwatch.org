@enum State PA GA NC MI AZ WI NV
@enum Month mar apr may jun jul jul2 aug sep oct


STATE       = State
prior_month = "jul"
mon         = jul2
MON         = "jul2"
Mon         = "jul2"
st          = "AZ"
ST          =  AZ

#include("polls_head.jl")
prior_poll = BSON.load("../objs/"*"$st"*"_"*"$prior_month"*"_p_sample.bson")
@load "../objs/"*"$MON"*"_polls.bson" months

current_month = remove_empties(months[mon])

include("polls_foot.jl")

