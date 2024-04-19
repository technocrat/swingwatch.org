using Combinatorics
using CSV
using DataFrames

const STATES  = ["FL","NV", "WI", "AZ", "GA", "MI", "PA", "NC"]
const VOTES   = [30, 6, 10, 11, 16, 16, 20, 16]
const COLLEGE = 538
const VICTORY = 270
const TIE     = 269

# Initialize an object to hold the collected combinations
combos = Dict()

# To collect combinations for n = 1:8
for n in 1:8
    # Generate combinations of length n
    combinations_n = combinations(STATES, n)
    # Collect combinations and store them in the dictionary
    combos[n] = collect(combinations_n)
end

const BLUE    = 212
const RED     = 187

base      = CSV.read("../objs/2020vote.csv", DataFrame)
base.vote = base.biden_col .+ base.trump_col
base.pop  = base.biden_pop .+ base.trump_pop
base.pct  = base.biden_pop ./ base.pop
base = base[:,[1,4,5,6,7,8,9]]
new_names = ["st","biden","trump","margin","vote","pop","pct"]
rename!(base, Symbol.(new_names))

# create an iterable 
votes  = Dict(state => base[findfirst(isequal(state), base.st), :vote][1] for state in STATES)

# biden won 6 of the 7 swing states
blues     = 212
# trump won NC
reds      = 187

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

# discard variables used to check arithmetic
outcome = outcome[:,1:4]

# create variable to show results
outcome.result = Vector{String}(undef, size(outcome, 1))

outcome.result[outcome[:,:biden] .< TIE]  .= "Trump"
outcome.result[outcome[:,:biden] .== TIE] .= "Tie"
outcome.result[outcome[:,:biden] .> TIE]  .= "Biden"

states = collect(keys(votes))

