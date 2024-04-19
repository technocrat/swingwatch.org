

h1 = "Biden wins"
h2 = "Ties"
h3 = "Trump wins"


const STATES = ["NV", "MI", "WI", "NC", "AZ", "PA", "GA"]
const FULL   = ["Nevada","Michigan","Wisconsin","North Carolina","Arizona","Pennsylvania","Georgia"]

state_dict = Dict(zip(STATES, FULL)) 

new_names = [
 "Scenario",
 "Electoral Votes",
 "Biden Votes",
 "Trump Votes",
 "Result"]

ST = "WI"

h1

pretty_table(outcome[(occursin.(ST, outcome.combo)) .& (outcome.result .== "Biden"), :], backend = Val(:html), header = new_names, standalone = false)

h2

pretty_table(outcome[(occursin.(ST, outcome.combo)) .& (outcome.result .== "Tie"), :], backend = Val(:html), header = new_names, standalone = false)

h3 

pretty_table(outcome[(occursin.(ST, outcome.combo)) .& (outcome.result .== "Trump"), :], backend = Val(:html), header = new_names, standalone = false)

h4 = "Biden wins without $state_dict[ST]"

pretty_table(outcome[.!(occursin.(ST, outcome.combo)) .& (outcome.result .== "Biden"), :], backend = Val(:html), header = new_names, standalone = false)

