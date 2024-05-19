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
# base = CSV.read("../objs/2020vote.csv", DataFrame)
base =  CSV.read("/Users/ro/projects/swingwatch/_assets/objs/2024vote.csv", DataFrame)

# see CreateOutcomes.jl for production of outcome.csv
objs    = "../objs/"
outcome = CSV.read(objs * "outcome.csv",DataFrame)

# pa_outcome = outcome[(occursin.("PA", outcome.combo)) .& (outcome.votes .== 269), :]

# pa_outcome = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== "Tie"), :]

red_states = STATES

"""
   show_results(outcome::DataFrame, state::String, result::String)

Display the results of an election outcome DataFrame for a specific state and result type in a markdown-formatted table.

# Arguments
- `outcome::DataFrame`: A DataFrame containing election outcome data, with columns for state combinations, results, and other relevant information.
- `state::String`: The name of the state for which to display results.
- `result::String`: The type of result to display (e.g., "winner", "margin", etc.).

# Returns
- `String`: A markdown-formatted string representing a table containing the requested results.

# Notes
- This function filters the `outcome` DataFrame to include only rows where the state combination contains the specified `state` and the `result` column matches the specified `result` string.
- The filtered rows are then converted to a markdown table using the `pretty_table` function from the PrettyTables.jl package.
- The `show_subheader` option is set to `false` to exclude column headers from the markdown table.

# Examples
```julia
# Assuming `outcome` is a DataFrame with columns named "combo", "result", and others
maryland_winner = show_results(outcome, "Maryland", "winner")
println(maryland_winner)

georgia_margin = show_results(outcome, "Georgia", "margin")
println(georgia_margin)
"""
function show_results(outcome::DataFrame, state::String, result::String)
    markdown_table = pretty_table(outcome[(occursin.(state, outcome.combo)) .& (outcome.result .== result), :] , backend = Val(:markdown), show_subheader = false)
    return markdown_table
end
# group_counts = combine(groupby(outcome, :result), nrow => :count)