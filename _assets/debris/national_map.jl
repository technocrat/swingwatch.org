using PlotlyJS

#const STATES = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]
const STATES = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "ME1", "ME2", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NE1", "NE2", "NE3", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]

# const VOTES = [6, 10, 11, 16, 15, 19, 16]

# const TIED = 269

const FLAGRED = "rgb(178, 34, 52)"

const FLAGBLUE = "rgb(60, 59, 110)"

const PURPLE = "rgb(119, 47, 81)"

const GREENBAR = "rgb(47, 119, 78)"

const STATE_COLORS = Dict(
    "PA"  => PURPLE,
    "NC"  => PURPLE,
    "NV"  => PURPLE,
    "MI"  => PURPLE,
    "WI"  => PURPLE,
    "AZ"  => PURPLE,
    "GA"  => PURPLE,
    "CA"  => FLAGBLUE,
    "CO"  => FLAGBLUE,
    "CT"  => FLAGBLUE,
    "DC"  => FLAGBLUE,
    "DE"  => FLAGBLUE,
    "HI"  => FLAGBLUE,
    "IL"  => FLAGBLUE,
    "MA"  => FLAGBLUE,
    "MD"  => FLAGBLUE,
    "ME"  => FLAGBLUE,
    "ME1" => FLAGBLUE,
    "MI"  => FLAGBLUE,
    "MN"  => FLAGBLUE,
    "NE2" => FLAGBLUE,
    "NH"  => FLAGBLUE,
    "NJ"  => FLAGBLUE,
    "NM"  => FLAGBLUE,
    "NY"  => FLAGBLUE,
    "OR"  => FLAGBLUE,
    "RI"  => FLAGBLUE,
    "VA"  => FLAGBLUE,
    "VT"  => FLAGBLUE,
    "WA"  => FLAGBLUE,
    "AK"  => FLAGRED,
    "AL"  => FLAGRED,
    "AR"  => FLAGRED,
    "FL"  => FLAGRED,
    "IA"  => FLAGRED,
    "ID"  => FLAGRED,
    "IN"  => FLAGRED,
    "KS"  => FLAGRED,
    "KY"  => FLAGRED,
    "LA"  => FLAGRED,
    "ME2" => FLAGRED,
    "MO"  => FLAGRED,
    "MS"  => FLAGRED,
    "MT"  => FLAGRED,
    "NC"  => FLAGRED,
    "ND"  => FLAGRED,
    "NE"  => FLAGRED,
    "NE1" => FLAGRED,
    "NE3" => FLAGRED,
    "OH"  => FLAGRED,
    "OK"  => FLAGRED,
    "SC"  => FLAGRED,
    "SD"  => FLAGRED,
    "TN"  => FLAGRED,
    "TX"  => FLAGRED,
    "UT"  => FLAGRED,
    "WV"  => FLAGRED,
    "WY"  => FLAGRED
    )

votes = Dict(
    "AK" =>   3,
    "AL" =>   9,
    "AR" =>   6,
    "FL" =>  30,
    "IA" =>   6,
    "ID" =>   4,
    "IN" =>  11,
    "KS" =>   6,
    "KY" =>   8,
    "LA" =>   8,
    "ME2" =>  1,
    "MO" =>  10,
    "MS" =>   6,
    "MT" =>   4,
    "NC" =>  16,
    "ND" =>   3,
    "NE" =>   1,
    "NE1" =>  1,
    "NE3" =>  2,
    "OH" =>  17,
    "OK" =>   7,
    "SC" =>   9,
    "SD" =>   3,
    "TN" =>  11,
    "TX" =>  40,
    "UT" =>   6,
    "WV" =>   4,
    "WY" =>   3,
    "AZ" =>  11,
    "CA" =>  54,
    "CO" =>  10,
    "CT" =>   7,
    "DC" =>   3,
    "DE" =>   3,
    "GA" =>  16,
    "HI" =>   4,
    "IL" =>  19,
    "MA" =>  11,
    "MD" =>  10,
    "ME" =>   2,
    "ME1" =>  1,
    "MI" =>  15,
    "MN" =>  10,
    "NE2" =>  1,
    "NH" =>   4,
    "NJ" =>  14,
    "NM" =>   5,
    "NV" =>   6,
    "NY" =>  28,
    "OR" =>   8,
    "PA" =>  19,
    "RI" =>   4,
    "VA" =>  13,
    "VT" =>   3,
    "WA" =>  12,
    "WI" =>  10
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
        title= "93 Swing State Electoral Votes (45 required to win)",
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
    PlotlyJS.savefig(fig, "/Users/ro/projects/SwingWatch/_assets/img/maps/base.png")
end

electoral_map_with_colors(data, STATE_COLORS)
