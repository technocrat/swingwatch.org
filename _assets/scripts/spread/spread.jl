using Plots
using Dates

const FLAGRED  = "#B22234"
const FLAGBLUE = "#3C3B6E"
const PURPLE   = "#772F51"
const PLUG     = 0.012

include("moe.jl")

gr()

function spread(Harris::Int64,Trump::Int64,N::Int64)
  biden_lo = Harris/100 - (moe(N) + PLUG)
  biden_hi = Harris/100 + (moe(N) + PLUG)
  biden_pk = [biden_lo,Harris/100,biden_hi] .* 100
  biden_bk = Int.(round.(biden_pk,digits = 0))
  trump_lo = Trump/100 - (moe(N) + PLUG)
  trump_hi = Trump/100 + (moe(N) + PLUG)
  trump_pk = [trump_lo,Trump/100,trump_hi] .* 100
  trump_bk = Int.(round.(trump_pk,digits = 0))
  return(biden_bk,trump_bk)
end

function create_ribbon_chart(result, STATE, TYPE_POLL, POLLSTER; filename=nothing)
    biden_range = result[1]
    trump_range = result[2]
    
    # Calculate the overlap range
    overlap_start = max(biden_range[1], trump_range[1])
    overlap_end = min(biden_range[end], trump_range[end])
    overlap_range = [overlap_start, overlap_end]
    
    # Calculate the overlap amount
    overlap_amount = overlap_range[end] - overlap_range[1]
    
    # Create the ribbon chart
    p = plot(size=(800, 300), legend=false, grid=false, yaxis=false, bottom_margin=10Plots.mm, top_margin=15Plots.mm)
    
    # Plot Harris's and Trump's ranges
    plot!([biden_range[1], biden_range[end]], [1.2, 1.2], linewidth=10, color=FLAGBLUE)
    plot!([trump_range[1], trump_range[end]], [0.2, 0.2], linewidth=10, color=FLAGRED)
    
    # Plot the overlap range
    plot!([overlap_range[1], overlap_range[end]], [0.7, 0.7], linewidth=10, color=PURPLE)
    
    # Add candidate names and overlap amount annotation
    annotate!((biden_range[1] + biden_range[end]) / 2, 1.2, text("BIDEN", :center, 12, :white))
    annotate!((trump_range[1] + trump_range[end]) / 2, 0.2, text("TRUMP", :center, 12, :white))
    annotate!((overlap_range[1] + overlap_range[end]) / 2, 0.7, text("$(overlap_amount) pts", :center, 12, :white))
    
    # Set tick positions and labels
    tick_values = sort(unique(vcat(biden_range, trump_range)))
    xticks!(tick_values, string.(tick_values))
    
    # Add title
    title!("$STATE, $TYPE_POLL by $POLLSTER")
    
    # Adjust the y-axis limits
    ylims!((-0.5, 2.0))
    
    # Save the plot to a file if a filename is provided
    if filename !== nothing
        savefig(p, filename)
    end
    
    return p
end

"""
# Example usage

38,41,600
40,44,600

result = spread(43,47,1000)
STATE = "North Carolina"
TYPE_POLL = "2-way"
POLLSTER = "Susquehanna Polling"
create_ribbon_chart(result, STATE, TYPE_POLL, POLLSTER)
"""

