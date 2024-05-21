using BSON: @load, @save
using Colors
using Combinatorics
using CSV
using DataFrames
using Format
using HTTP
using GLMakie
using KernelDensity
using LinearAlgebra
using MCMCChains
using Missings
using PlotlyJS
using Plots
using PrettyTables
using Printf
using Serialization
using Statistics
using StatsPlots
using Turing
#------------------------------------------------------------------
@enum Month mar apr may jun jul aug sep oct nov
@enum State PA GA NC MI AZ WI NV
STATE = State
@enum Pollster begin
    bi2
    bi3
    bl2
    bl3
    cb2
    cb3
    cn2
    cn3
    ec2
    ec3
    fm2
    fm3
    fo2
    fo3
    hi2
    hi3
    ma2
    ma3
    mi2
    mi3
    mr2
    mr3
    qi2
    qi3
    sp2
    sp3
    su2
    su3
    wa2
    wa3
    ws2
    ws3l
    ws3s
end
#------------------------------------------------------------------
const states   = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]
const FLAGRED  = "rgb(178, 34, 52)"
const FLAGBLUE = "rgb(60, 59, 110)"
const PURPLE   = "rgb(119, 47, 81)"
const GREENBAR = "rgb(47, 119, 78)"
#------------------------------------------------------------------
mutable struct MetaFrame
    meta::Dict{Symbol, Any}
    data::DataFrame
end
#------------------------------------------------------------------
struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int
end
#------------------------------------------------------------------
"""
    filter_empty_entries(dict::Dict{Pollster, Vector{Poll}}) -> Dict{Pollster, Vector{Poll}}

Filter out entries in a dictionary where the values are empty vectors.

# Arguments
- `dict::Dict{Pollster, Vector{Poll}}`: A dictionary where the keys are of type `Pollster` and the values are vectors of type `Poll`.

# Returns
- `Dict{Pollster, Vector{Poll}}`: A new dictionary containing only the entries from the input dictionary where the vectors are not empty.

# Description
The `filter_empty_entries` function iterates over each key-value pair in the provided dictionary. It constructs a new dictionary that includes only those entries where the value (a vector of `Poll` objects) is not empty.

# Example
```julia
# Define types for the example
struct Pollster
    name::String
end

struct Poll
    question::String
    response::String
end

# Create a dictionary with some empty and non-empty vectors
pollster1 = Pollster("Pollster A")
pollster2 = Pollster("Pollster B")
poll1 = Poll("Question 1", "Response 1")
poll2 = Poll("Question 2", "Response 2")

dict = Dict(
    pollster1 => [poll1, poll2],
    pollster2 => []
)

# Filter out entries with empty vectors
filtered_dict = filter_empty_entries(dict)
println(filtered_dict)
# Output:
# Dict{Pollster, Vector{Poll}} with 1 entry:
#   Pollster("Pollster A") => Poll[Poll("Question 1", "Response 1"), Poll("Question 2", "Response 2")]
"""
function remove_empties(the_month::Dict) 
  Dict(state => Dict(pollster => polls for (pollster, polls) in pollsters 
  if !isempty(polls)) for (state, pollsters) in the_month)
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
"""
    radix(df::DataFrame)

Format integer columns in a DataFrame with thousands separators and return a new DataFrame
with the formatted columns appended.

# Arguments
- `df::DataFrame`: The input DataFrame containing the columns to be formatted.

# Returns
- `DataFrame`: A new DataFrame with the original columns and the formatted columns appended.
                The formatted columns have "_formatted" suffix added to their names.

# Example
```julia
julia> using DataFrames

julia> df = DataFrame(A = [1000, 2000, 3000], B = ["text1", "text2", "text3"], C = [4000, 5000, 6000])
3×3 DataFrame
 Row │ A      B      C
     │ Int64  String Int64
─────┼──────────────────────
   1 │  1000  text1   4000
   2 │  2000  text2   5000
   3 │  3000  text3   6000

julia> radix(df)
3×5 DataFrame
 Row │ A      B      C      A_formatted  C_formatted
     │ Int64  String Int64  String       String
─────┼───────────────────────────────────────────────
   1 │  1000  text1   4000  "1,000"      "4,000"
   2 │  2000  text2   5000  "2,000"      "5,000"
   3 │  3000  text3   6000  "3,000"      "6,000"
In the example above, the radix function is applied to a DataFrame df containing integer
columns. The function formats the integer columns with thousands separators and returns a new
DataFrame with the formatted columns appended. The formatted columns have "_formatted" suffix
added to their names.
"""
function radix(df::DataFrame)
  formatted_df = copy(df)
  for col in names(formatted_df)
  if eltype(formatted_df[:, col]) <: Integer
    formatted_col_name = Symbol(string(col) * "_formatted")
    formatted_df[:, formatted_col_name] = map(x -> format(x, commas=true), formatted_df[:, col])
    end
  end
  return formatted_df
end
#------------------------------------------------------------------
"""
    format_table(summary_df::DataFrame)

Format floating-point numbers in a DataFrame to four decimal places and display the table using PrettyTables.jl.

# Arguments
- `summary_df::DataFrame`: The DataFrame containing the data to be formatted and displayed.

# Description
The `format_table` function formats all floating-point numbers in the provided DataFrame to four decimal places. It uses the PrettyTables.jl package to display the formatted table in HTML format. The function applies a formatter to each cell in the DataFrame, checking if the value is of type `Float64` and formatting it accordingly. Non-floating-point values are left unchanged.

# Example
```julia
using DataFrames, PrettyTables, Printf

# Create a sample DataFrame
summary_df = DataFrame(A = [1.123456, 2.234567, 3.345678], B = [4.456789, 5.567890, 6.678901])

# Define the format_table function
function format_table(summary_df::DataFrame)
    formatter = (v, i, j) -> isa(v, Float64) ? @sprintf("%.4f", v) : v
    # Apply the formatter to all columns of the table
    pretty_table(summary_df, 
                 backend = Val(:html), 
                 header = names(summary_df), 
                 formatters = formatter, 
                 standalone = false)
end

# Call the function to format and display the table
format_table(summary_df)
# Formats floating-point numbers to four decimal places in table
"""
function format_table(summary_df::DataFrame)
  formatter = (v, i, j) -> isa(v, Float64) ? @sprintf("%.4f", v) : v
  # Apply the formatter to all columns of the table
  PrettyTables::pretty_table(summary_df, 
             backend = Val(:html), 
             header = names(summary_df), 
             formatters = formatter, 
             standalone = false)
end
#------------------------------------------------------------------
function remove_empties(the_month::Dict) 
  Dict(state => Dict(pollster => polls for (pollster, polls) in pollsters 
  if !isempty(polls)) for (state, pollsters) in the_month)
end
#------------------------------------------------------------------
function process_polls(polls::Vector{Poll})
    result = Int64.(collect(collect([(p.biden_support, p.sample_size) for p in polls])[1]))
    return [Int64(floor(result[1] / 100 * result[2])), result[2]]
end