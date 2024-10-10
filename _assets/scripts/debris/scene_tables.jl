
h1 = "Harris wins"
h2 = "Tie"
h3 = "Trump wins"


const STATES = ["NV", "MI", "WI", "NC", "AZ", "PA", "GA"]
const FULL   = ["Nevada","Michigan","Wisconsin","North Carolina","Arizona","Pennsylvania","Georgia"]

state_dict = Dict(zip(STATES, FULL)) 

new_names = [
 "States won by Harris ",
 "Electoral Votes",
 "Harris Votes",
 "Trump Votes",
 "Result"]

# ST = "WI"

h1

pretty_table(outcome[(occursin.(ST, outcome.combo)) .& (outcome.result .== "Harris"), :], backend = Val(:html), header = new_names, standalone = false)

h2

pretty_table(outcome[(occursin.(ST, outcome.combo)) .& (outcome.result .== "Tie"), :], backend = Val(:html), header = new_names, standalone = false)

h3 

pretty_table(outcome[(occursin.(ST, outcome.combo)) .& (outcome.result .== "Trump"), :], backend = Val(:html), header = new_names, standalone = false)

h4 = "Harris wins without $state_dict[ST]"

pretty_table(outcome[.!(occursin.(ST, outcome.combo)) .& (outcome.result .== "Harris"), :], backend = Val(:html), header = new_names, standalone = false)

