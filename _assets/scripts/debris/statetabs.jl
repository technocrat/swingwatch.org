using CSV
using DataFrames
using PrettyTables


# Include files
include("constants.jl")
include("utils.jl")

# see CreateOutcomes.jl for production of outcome.csv
# objs    = "../objs/"
# objs    = "/Users/ro/projects/SwingWatch/_src/objs/"
outcome = CSV.read("/Users/ro/projects/SwingWatch/_src/objs/outcome.csv"DataFrame)

header = ["Scenario", "Electoral Votes", "Biden Total", "Trump Total", "Result"]

# pretty_table(outcome; backend = Val(:html), header = header, standalone = false)

pa_loss = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== 
"Trump"), :]
pa_ties = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== "Tie"),   :]
pa_wins = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== "Biden"), :]

println("### Biden wins")


# see intake.jl for production of 2020vote.csv
base      = CSV.read("/Users/ro/projects/SwingWatch/_src/objs/2020vote.csv", DataFrame)
base.vote = base.biden_col .+ base.trump_col
base.pop  = base.biden_pop .+ base.trump_pop
base.pct  = base.biden_pop ./ base.pop
base = base[:,[1,4,5,6,7,8,9]]
new_names = ["st","biden","trump","margin","vote","pop","pct"]
rename!(base, Symbol.(new_names))

pa2020 = base[(occursin.("PA", base.st)), :]

outcome[(occursin.("Trump", outcome.result))
