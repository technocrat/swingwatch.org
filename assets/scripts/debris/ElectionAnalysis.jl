module ElectionAnalysis

# purpose create a dataframe `outcomes` with variables state containing states # that vote in combination in the sample space, the collective electoral votes
# and whether that results in a Biden win, loss or draw

using CSV
using DataFrames
using Colors
using Combinatorics
using HTTP
using PlotlyJS

"""
# Export public functions and types
export find_combinations, electoral_map, determine_result
"""

# Include your code files
include("/Users/ro/projects/outcomes/code/constants.jl")
include("/Users/ro/projects/outcomes/code/utils.jl")

# module code

# see intake.jl for production of 2020vote.csv
base      = CSV.read("./objs/2020vote.csv", DataFrame)
base      = base[:,[1,4,5]]
base.vote = base.biden_col .+ base.trump_col
new_names = ["st","biden","trump","vote"]
rename!(base, Symbol.(new_names))

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
blues     = sum(base.biden) - sum(collect(values(votes)))
# trump won NC
reds      = sum(base.trump) - votes["NC"]

# expand to dataframe to show each combination with the total
# vote count 

outcome = DataFrame(
    combo = [join(combo, ", ", " and ") for combos_list in values(combos) for combo in combos_list],
    votes = [sum(votes[state] for state in combo) for combos_list in values(combos) for combo in combos_list]
)

outcome.biden    = outcome.votes .+ blues
outcome.trump    = COLLEGE .- outcome.biden
outcome.total    = outcome.biden .+ outcome.trump
outcome.check    = outcome.total .- COLLEGE
sort!(outcome,:votes)
all(outcome.check .== 0)

outcome = outcome[:,1:4]]

outcome.result = Vector{String}(undef, size(outcome, 1))

outcome.result[outcome[:,:biden] .< TIE]  .= "Trump"
outcome.result[outcome[:,:biden] .== TIE] .= "Tie"
outcome.result[outcome[:,:biden] .> TIE]  .= "Biden"

end # end of module
