#@enum State PA GA NC MI AZ WI NV
#@enum Month mar apr may jun jul jul2 aug1 aug2 sep oct


STATE       = State
prior_month = "aug2"
mon         = hyp
MON         = "hyp"
Mon         = "hyp"
st          = "AZ"
ST          =  AZ

include("polls_head.jl")
prior_poll = BSON.load("../objs/"*"$st"*"_"*"$prior_month"*"_p_sample.bson")
#@load "../objs/"*"$MON"*"_polls.bson" months # comes up empty
margin  = first(margins[margins.st .== st, :pct])

current_month = remove_empties(months[mon])
# 
include("polls_foot.jl")


