using Plots

const BIDEN_LOW     = 42
const BIDEN_POINT   = 48  
const BIDEN_HIGH    = 54
const TRUMP_LOW     = 32
const TRUMP_POINT   = 38
const TRUMP_HIGH    = 44
const SPACE         = " "
const NL            = "\n"

const NEW_LINEWIDTH = 10 * 6 # bar height

state = "PA\n"
poll  = "Franklin-Marshall"
date  = "Late March"
type  = ["Two-way","Three-way"]
N     = [431,430]
space = " "
title2way = poll * SPACE * date * SPACE * type[1] * SPACE * NL * state * "Preference" * SPACE * "(N =" * SPACE * string(N[1]) *")"
title3way = poll * SPACE * date * SPACE * type[2] * SPACE * state * "Preference" * SPACE * "(N =" * SPACE * string(N[2]) *")"

# Define the x-axis ticks and their labels
const X_TICKS = [TRUMP_LOW, BIDEN_LOW, TRUMP_POINT, BIDEN_POINT,BIDEN_HIGH]
const X_TICK_LABELS = string.(X_TICKS)

# Create the horizontal rectangle chart with increased linewidth and specified x-axis ticks and labels
p = plot(legend=:topright, xlims=(TRUMP_LOW, BIDEN_HIGH), ylims=(0, 0.1), 
         xticks=(X_TICKS, X_TICK_LABELS), size=(600, 400))

# Plotting the segments
plot!([TRUMP_LOW, TRUMP_HIGH], [0, 0], linewidth=NEW_LINEWIDTH, linecolor=:red, label="Trump")
plot!([BIDEN_LOW, BIDEN_HIGH], [0, 0], linewidth=NEW_LINEWIDTH, linecolor=:blue, label="Harris")
plot!([TRUMP_HIGH, BIDEN_LOW], [0, 0], linewidth=NEW_LINEWIDTH, linecolor=:purple, label="Overlap")

# Add chart title and labels
title!(fittle)
xlabel!("Approval Rating")

# Show the plot
plot!(p)    

"""
   create_ribbon_chart(result, STATE, TYPE_POLL, POLLSTER; filename=nothing)

Create a ribbon chart visualization to display the ranges and overlap of poll results for two candidates.

# Arguments
- `result`: A tuple containing two ranges (vectors) representing the poll result ranges for the two candidates.
- `STATE::String`: The name of the state for which the poll results are being displayed.
- `TYPE_POLL::String`: The type of poll being displayed (e.g., "General Election", "Primary", etc.).
- `POLLSTER::String`: The name of the pollster or organization that conducted the poll.
- `filename::Union{String, Nothing}=nothing`: An optional filename to save the plot as an image file.

# Returns
- `Plots.Plot`: The ribbon chart plot object.

# Notes
- The function calculates the overlap range and amount between the two candidates' poll result ranges.
- It creates a ribbon chart plot using the Plots.jl package, with the candidates' ranges represented as horizontal bars and the overlap range represented as a third bar.
- The candidate names, overlap amount, and poll details (state, type, and pollster) are annotated on the plot.
- The x-axis ticks are set to the unique values in the combined ranges of the two candidates.
- If a `filename` is provided, the plot is saved as an image file with the specified name.

# Examples
```julia
# Assuming `result` is a tuple containing two ranges (vectors) for Harris and Trump
biden_range = [46.0, 50.0]
trump_range = [45.0, 49.0]
result = (biden_range, trump_range)

ribbon_chart = create_ribbon_chart(result, "Florida", "General Election", "ABC News/Washington Post")
display(ribbon_chart)

# To save the plot as an image file
ribbon_chart = create_ribbon_chart(result, "Florida", "General Election", "ABC News/Washington Post", filename="fl_poll.png")
"""
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
