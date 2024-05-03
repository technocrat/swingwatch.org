"""
    without_states(lost::Vector{String}) -> DataFrame

Find and return rows from the `outcomes` DataFrame where the `combo` column does not contain any of the states specified in the `lost` vector and where the result is "Biden".

# Arguments
- `lost::Vector{String}`: A vector of strings where each string represents a state to be excluded from the `combo` column.

# Returns
- `DataFrame`: A DataFrame containing rows that meet the criteria.

# Examples
```julia
without_states(["PA", "NC"])
"""
function without_states(lost::Vector{String})
    filter(row -> all(!occursin(state, row.combo) for state in lost) && row.result == "Biden", outcomes)
end

header = ["Scenario", "Electoral Votes", "Biden Total", "Trump Total", "Result"]
pretty_table(without_states["PA"]; backend = Val(:html), header = header, standalone = false)