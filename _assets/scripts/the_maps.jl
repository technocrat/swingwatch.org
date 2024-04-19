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
        textfont=attr(size=12, color="black"),
        mode="text",
        showlegend=false,
        hoverinfo="none"
    )

    # Create the layout for the map
    layout = PlotlyJS.Layout(
        title="The 94 Swing State Electoral Votes",
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
    PlotlyJS.savefig(fig, "electoral_map.png")
end

const STATES = ["NV", "MI", "WI", "NC", "AZ", "PA", "GA"]
const LIGHT_PURPLE = "rgba(200, 150, 255, 0.7)"

votes = Dict(
    "NV" => 6,
    "MI" => 16,
    "WI" => 10,
    "NC" => 15,
    "AZ" => 11,
    "PA" => 20,
    "GA" => 16
)

data = [votes[state] for state in STATES]

electoral_map(data, LIGHT_PURPLE)