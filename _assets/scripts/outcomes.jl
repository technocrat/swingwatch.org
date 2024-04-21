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
base    = CSV.read("../objs/2020vote.csv", DataFrame)
base =  CSV.read("/Users/ro/projects/swingwatch/_assets/objs/2024vote.csv", DataFrame)

# see CreateOutcomes.jl for production of outcome.csv
objs    = "../objs/"
outcome = CSV.read(objs * "outcome.csv",DataFrame)

# pa_outcome = outcome[(occursin.("PA", outcome.combo)) .& (outcome.votes .== 269), :]

# pa_outcome = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== "Tie"), :]

red_states = STATES

function show_results(outcome::DataFrame, state::String, result::String)
    markdown_table = pretty_table(outcome[(occursin.(state, outcome.combo)) .& (outcome.result .== result), :] , backend = Val(:markdown), show_subheader = false)
    return markdown_table
end
# group_counts = combine(groupby(outcome, :result), nrow => :count)