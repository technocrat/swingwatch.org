const states   = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]
const FLAGRED  = "rgb(178,  34,  52)"
const FLAGBLUE = "rgb( 60,  59, 110)"
const PURPLE   = "rgb(119,  47,  81)"
const GREENBAR = "rgb( 47, 119,  78)"
const LORANGE  = "rgb(225, 170, 110)"

#------------------------------------------------------------------
struct Poll
    harris_support::Float64
    trump_support::Float64
    sample_size::Int64
end
#------------------------------------------------------------------
Month_names = Dict(
	"mar" => "March",
	"apr" => "April",
	"may" => "May",
	"jun" => "June",
	"jul" => "July",
	"jul2" => "July-post",
	"aug1" => "early August",
	"aug2" => "late August",
	"sep1" => "early September",
	"sep2" => "late September",
	"oct1" => "early October",
	"oct2" => "late October",
	"fin" => "final polling")
#------------------------------------------------------------------

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
    result = Int64.(collect(collect([(p.harris_support, p.sample_size) for p in polls])[1]))
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
    ax = Axis(fig[1, 1], xlabel = "Likelihood of Harris win", ylabel = "Number of draws", title = "Model: Harris results in $ST with polling through " * Month_names[Mon])
    
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
@model function poll_model(num_votes::Int64, num_wins::Int64, prior_dist::Distribution)
    # Define the prior using the informed prior distribution
    p ~ prior_dist
    # Define the likelihood with additional uncertainty
    num_wins ~ Binomial(num_votes, p)
end

function consolidate_polls(current_month)
    consolidated = Dict{State, NamedTuple{(:harris_support, :trump_support, :sample_size), Tuple{Float64, Float64, Int64}}}()
    
    for (state, pollsters) in current_month
        total_harris = 0.0
        total_trump = 0.0
        total_sample = 0
        
        for (_, polls) in pollsters
            for poll in polls
                total_harris += poll.harris_support * poll.sample_size
                total_trump += poll.trump_support * poll.sample_size
                total_sample += poll.sample_size
            end
        end
        
        avg_harris = total_harris / total_sample
        avg_trump = total_trump / total_sample
        
        consolidated[state] = (harris_support = avg_harris, trump_support = avg_trump, sample_size = total_sample)
    end
    
    return consolidated
end

    poll_data = consolidate_polls[state]
    
    harris_votes = floor(Int, poll_data.sample_size * (poll_data.harris_support / 100))
    trump_votes = floor(Int, poll_data.sample_size * (poll_data.trump_support / 100))
    
    return (
        harris_votes = harris_votes,
        trump_votes = trump_votes,
        sample_size = poll_data.sample_size
    )
end

function calculate_support(consolidated_polls, state)
  poll_data = consolidated_polls[state]
  
  harris_votes = floor(Int, poll_data.sample_size * (poll_data.harris_support / 100))
  trump_votes =  floor(Int, poll_data.sample_size * (poll_data.trump_support  / 100))
  
  return (
      harris_votes = harris_votes,
      trump_votes  = trump_votes,
      sample_size  = poll_data.sample_size
  )
end

