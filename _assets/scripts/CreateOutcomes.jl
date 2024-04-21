# purpose: create a dataframe `outcomes` with variables state containing states 
# that vote in combination in the sample space, the collective electoral votes
# and whether that results in a Biden win, loss or draw

using CSV
using DataFrames
using Colors
using Combinatorics
using HTTP
using PlotlyJS

# Include files
include("constants.jl")
include("utils.jl")

# see college_table.jl for production of 2024vote.csv
base      = CSV.read("/Users/ro/projects/swingwatch/_assets/objs/2024vote.csv",DataFrame)
# base.vote = base.biden_col .+ base.trump_col
# base.pop  = base.biden_pop .+ base.trump_pop
# base.pct  = base.biden_pop ./ base.pop
# base = base[:,[1,4,5,6,7,8,9]]
# new_names = ["st","biden","trump","margin","vote","pop","pct"]
# rename!(base, Symbol.(new_names))

base.vote = base.biden_col + base.trump_col

# create an iterable 
votes  = Dict(state => base[findfirst(isequal(state), base.st), :vote][1] for state in STATES)
states = collect(keys(votes))

# Initialize an object to hold the collected combinations
combos = Dict()

# To collect combinations for n = 1:7
Dict{Any, Any}()

for n in 1:7
   # Generate combinations of length n
   combinations_n = combinations(STATES, n)
   # Collect combinations and store them in the dictionary
   combos[n] = collect(combinations_n)
end

# biden won 6 of the 7 swing states
blues     = sum(base.biden_col) - sum(collect(values(votes))) + votes["NC"]
# trump won NC
reds      = sum(base.trump_col) - votes["NC"]

# expand to dataframe to show each combination with the total
# vote count 

outcome = DataFrame(
    combo = [join(combo, ", ", " and ") for combos_list in values(combos) for combo in combos_list],
    votes = [sum(votes[state] for state in combo) for combos_list in values(combos) for combo in combos_list]
)

outcome.biden    = outcome.votes .+ blues
outcome.trump    = COLLEGE       .- outcome.biden
outcome.total    = outcome.biden .+ outcome.trump
outcome.check    = outcome.total .- COLLEGE
sort!(outcome,:votes)
all(outcome.check .== 0)

# discard variables used to check arithmetic
outcome = outcome[:,1:4]

# create variable to show results
outcome.result = Vector{String}(undef, size(outcome, 1))

outcome.result[outcome[:,:biden] .< TIE]  .= "Trump"
outcome.result[outcome[:,:biden] .== TIE] .= "Tie"
outcome.result[outcome[:,:biden] .> TIE]  .= "Biden"

# CSV.write(""/Users/ro/projects/swingwatch/_assets/objs/outcome.csv",outcome)
