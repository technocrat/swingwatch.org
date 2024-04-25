using PlotlyJS

"""
   electoral_map(data, color)

Create a choropleth map of the United States, colored by the provided data and color scheme, with state labels and a title.

# Arguments
- `data::Vector{<:Real}`: A vector of numeric values representing the data to be displayed on the map, with one value for each state.
- `color::AbstractString`: A color string (e.g., "red", "#FF0000") representing the color to be used for the map.

# Returns
- `PlotlyJS.SyncPlot`: The Plotly.js figure object representing the electoral map.

# Notes
- This function uses the Plotly.js library to create an interactive choropleth map of the United States.
- The `data` vector must have one value for each state, and the values will be used to color the states based on the provided `color` scheme.
- The map includes state labels with the corresponding data values.
- The map has a title "The 93 Swing State Electoral Votes".
- The map is saved as a PNG image file at the path "/Users/ro/projects/SwingWatch/_assets/img/maps/electoral_map.png".
- This function assumes the existence of a constant `STATES` containing the two-letter abbreviations for all U.S. states.

# Example
```julia
# Assuming `STATES` is a vector of two-letter state abbreviations
data = rand(length(STATES)) # Generates random data for each state
electoral_map(data, "blue") # Create a blue electoral map with the random data
"""
function electoral_map(data, color)
    # Create the data for the choropleth map
    choropleth_trace = PlotlyJS.choropleth(
        locationmode="USA-states",
        locations=STATES,
        z=data,
        colorscale=[[0, color], [1, color]],
        showscale=false,
        marker=attr(line=attr(color="white", width=2)),
        hoverinfo="location+text"
    )

    # Create the data for the state labels
    label_trace = PlotlyJS.scattergeo(
        locationmode="USA-states",
        locations=STATES,
        text=data,
        textfont=attr(size=12, color="white"),
        mode="text",
        showlegend=false,
        hoverinfo="none"
    )

    # Create the layout for the map
    layout = PlotlyJS.Layout(
        title="The 93 Swing State Electoral Votes",
        geo=attr(
            scope="usa",
            projection=attr(type="albers usa"),
            showlakes=true,
            lakecolor="rgb(255, 255, 255)"
        )
    )

    # Create the figure with both traces
    fig = PlotlyJS.plot([choropleth_trace, label_trace], layout)

    # Save the plot as an image file
    PlotlyJS.savefig(fig, "/Users/ro/projects/SwingWatch/_assets/img/maps/electoral_map.png")
end

const STATES       = ["NV", "MI", "WI", "NC", "AZ", "PA", "GA"]
const LIGHT_PURPLE = "rgba(200, 150, 255, 0.7)"

votes = Dict(
    "NV" => 6,
    "MI" => 15,
    "WI" => 10,
    "NC" => 16,
    "AZ" => 11,
    "PA" => 19,
    "GA" => 16
)

data = [votes[state] for state in STATES]
const PURPLE   = "#772F51"

electoral_map(data, PURPLE)

