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
header = ["Scenario", "Electoral Votes", "Biden Total", "Trump Total", "Result"]
pretty_table(without_states["PA"]; backend = Val(:html), header = header, standalone = false)
"""
function without_states(lost::Vector{String})
    filter(row -> all(!occursin(state, row.combo) for state in lost) && row.result == "Biden", outcomes)
end
#------------------------------------------------------------------
"""
  metahelp()

shows MetaFrame structure and give example

mutable struct MetaFrame
    meta::Dict{Symbol, Any}
    data::DataFrame
end

# Example usage
df = DataFrame(name=["John", "Jane"], age=[28, 34])
meta_info = Dict(:source => "Survey Data", :year => 2021)

df = MetaFrame(meta_info, df)

meta_info = Dict(
  :source => "Census Bureau, Current Population Survey, November 2022", 
  :title  =>  "Table 4c. Reported Voting and Registration of the Total Voting-Age Population, by Age, for States: November 2022",
  :url => "https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-586.html", 
  :title => "Table 4c. Reported Voting and Registration of the Total Voting-Age Population, by Age, for States: November 2022")
"""
function metahelp()
  println("Display with ?metahelp")
end
#------------------------------------------------------------------

function radix(df::DataFrame)
	for col in names(df)
	    if eltype(df[:, col]) == Int64
	        df[:, col] = format.(df[:, col], commas=true)
	    end
	end
end

