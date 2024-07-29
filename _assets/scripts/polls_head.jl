using BSON: @load, @save
using BSON
using Colors
using Combinatorics
using CSV
using DataFrames
using Distributions
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


# @enum State PA GA NC MI AZ WI NV
# STATE = State
@enum Pollster begin
    ag
    aj
    am
    bi2
    bi3
    bl2
    bl3
    cb2
    cb3
    cn2
    cn3
    ea
    ec2
    ec3
    ep
    eu
    fm2
    fm3
    fo2
    fo3
    hi2
    hi3
    hp
    ia
    ma2
    ma3
    mi2
    mi3
    mq
    mr2
    mr3
    ns
    pp
    ny
    qi2
    qi3
    rr
    si2
    si3
    sp2
    sp3
    su2
    su3
    tr
    wa2
    wa3
    ws
    wsl
    wss
    yg
end
#------------------------------------------------------------------
const states   = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]
const FLAGRED  = "rgb(178,  34,  52)"
const FLAGBLUE = "rgb( 60,  59, 110)"
const PURPLE   = "rgb(119,  47,  81)"
const GREENBAR = "rgb( 47, 119,  78)"
const LORANGE  = "rgb(225, 170, 110)"
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
Month_names = Dict(
	"mar" => "March",
	"apr" => "April",
	"may" => "May",
	"jun" => "June",
	"jul" => "July",
	"aug" => "August",
	"sep" => "September",
	"oct" => "October")
#------------------------------------------------------------------
margins = CSV.read("../objs/margins.csv", DataFrame)
margin = first(margins[margins.st .== st, :pct])
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
function process_polls(polls::Vector{Poll})
    result = Int64.(collect(collect([(p.biden_support, p.sample_size) for p in polls])[1]))
    return [Int64(floor(result[1] / 100 * result[2])), result[2]]
end
#------------------------------------------------------------------

"""
    draw_density()

Draw a density plot of the parameter `p` with a shaded credible interval.

# Returns
- `fig`: A `Figure` object containing the density plot.

# Description
This function creates a density plot of the parameter `p` using the `kde_result` and `p_vec` variables,
which are assumed to be available in the current scope. The plot includes a shaded region representing
the credible interval specified by `posterior_interval`.

The density curve is plotted in green (`#a3b35c`) with a stroke width of 8. The shaded credible interval
is filled in orange (`#e1aa6e`).

The x-axis label is set to "p", the y-axis label is set to "Density", and the plot title is set to
"Density Plot of p for $ST", where `$ST` is a string variable assumed to be available in the current scope.

The x-axis limits are set to the extrema of `p_vec`, and the y-axis limits are set to start from 0.

A legend is added to the plot using `axislegend(ax)`.

# Example
```julia
# Assume kde_result, p_vec, posterior_interval, and ST are available in the current scope
fig = draw_density()
"""
function draw_density()
    # Create a new figure with specified resolution
    fig = Figure(size = (600, 400))
    
    # Add an axis to the figure
    ax = Axis(fig[1, 1], xlabel = "Likelihood of Biden win", ylabel = "Number of draws", title = "Model: Biden results in $ST from 2020 election and polling through " * Month_names[Mon])
    
    # Plot the full density curve
    lines!(ax, kde_result.x, kde_result.density, color = "#a3b35c", linewidth = 3, strokewidth = 4, strokecolor = GREENBAR, label = "Draws")
    
    # Find the indices corresponding to the posterior interval
    indices = findall((posterior_interval[1] .<= kde_result.x) .& (kde_result.x .<= posterior_interval[2]))
    
    # Extract the x and y values within the posterior interval
    x_region = kde_result.x[indices]
    y_region = kde_result.density[indices]
    
    # Fill the specific area under the curve
    band!(ax, x_region, fill(0, length(x_region)), y_region, color = (LORANGE), label = "Credible Interval")
    
    # Find the y-value corresponding to the specified x-value
    y_value = kde_result.density[argmin(abs.(kde_result.x .- margin))]
    
    # Add a vertical line at the specified x-value from 0 to the y-value
    vlines!(ax, [margin], [0, y_value], color = FLAGBLUE, linestyle = :dash, linewidth = 4, label = "2020 Actual")
    
    # Add a legend to the plot
    axislegend(ax)
    
    # Adjust the plot limits to fit the density line
    Makie.xlims!(ax, extrema(p_vec))
    Makie.ylims!(ax, 0, nothing)
    
    # Display the figure
    fig
end
#------------------------------------------------------------------