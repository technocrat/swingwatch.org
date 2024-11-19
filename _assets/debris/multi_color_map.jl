using PlotlyJS

const STATES = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]

const VOTES = [6, 10, 11, 16, 15, 19, 16]

const TIED = 269

const FLAGRED = "rgb(178, 34, 52)"

const FLAGBLUE = "rgb(60, 59, 110)"

const PURPLE = "rgb(119, 47, 81)"

const GREENBAR = "rgb(47, 119, 78)"

const STATE_COLORS = Dict(
    "PA" => FLAGRED,
    "NC" => FLAGRED,
    "NV" => PURPLE,
    "MI" => PURPLE,
    "WI" => PURPLE,
    "AZ" => PURPLE,
    "GA" => PURPLE
)

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

function electoral_map_with_colors(data, state_colors)
    # Create the data for the choropleth map
    choropleth_trace = PlotlyJS.choropleth(
        locationmode="USA-states",
        locations=STATES,
        z=data,
        colorscale=[[0, "rgba(0,0,0,0)"], [1, "rgba(0,0,0,0)"]],
        showscale=false,
        marker=attr(line=attr(color="white", width=2)),
        hoverinfo="location+text"
    )

    # Create the data for the state colors
    color_traces = [
        PlotlyJS.choropleth(
            locationmode="USA-states",
            locations=[state],
            z=[1],
            colorscale=[[0, color], [1, color]],
            showscale=false,
            marker=attr(line=attr(color="white", width=2)),
            hoverinfo="none"
        )
        for (state, color) in state_colors
    ]

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
        title= "Without PA & NC: 58 Swing State Electoral Votes (45 required to win)",
        geo=attr(
            scope="usa",
            projection=attr(type="albers usa"),
            showlakes=true,
            lakecolor="rgb(255, 255, 255)"
        )
    )

    # Create the figure with all traces
    fig = PlotlyJS.plot(vcat(choropleth_trace, color_traces..., label_trace), layout)

    # Save the plot as an image file
    PlotlyJS.savefig(fig, "/Users/ro/projects/SwingWatch/_assets/img/maps/no_pa_nc.png")
end

electoral_map_with_colors(data, STATE_COLORS)