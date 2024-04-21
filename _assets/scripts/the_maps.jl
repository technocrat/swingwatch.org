using PlotlyJS

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

