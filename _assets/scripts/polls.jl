include("polls_head.jl")

mon       = "apr"
st        = "AZ"
ST        = AZ

@load "../objs/"*"$mon"*"_Polls.bson" months
current_month     = remove_empties(months[apr])

# mon       = "apr"
# mon       = "may"
# mon       = "jun"
# mon       = "jul"
# mon       = "aug"
# mon       = "sep"
# mon       = "oct"

# april     = remove_empties(months[apr])
# may       = remove_empties(months[may])
# june      = remove_empties(months[jun])
# july      = remove_empties(months[jul])
# august    = remove_empties(months[aug])
# september = remove_empties(months[sep])
# october   = remove_empties(months[oct])

# st = "PA"
# st = "GA"
# st = "NC"
# st = "MI"
# st = "AZ"
# st = "WI"
# st = "NV"

# ST = PA
# ST = GA
# ST = NC
# ST = MI
# ST = AZ
# ST = WI
# ST = NV

include("polls_foot.jl")

