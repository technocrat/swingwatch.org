
function find_combinations(target::Int64)
    less_than_target    = Set()
    equal_to_target     = Set()
    greater_than_target = Set()
    for i in 1:length(swing_col)
        for combination in combinations(collect(keys(swing_col)), i)
            sum_values = sum(swing_col[state] for state in combination)
            if sum_values < target
                push!(less_than_target, combination)
            elseif sum_values == target
                push!(equal_to_target, combination)
            else
                push!(greater_than_target, combination)
            end
        end
    end
    return (
        less_than_target    = collect(less_than_target),
        equal_to_target     = collect(equal_to_target),
        greater_than_target = collect(greater_than_target)
    )
end
#------------------------------------------------------------------

function electoral_map(data,kindof)
    if kindof == "pop"
        pastel  = greens
        titular = titlecase(kindof *"ular")
    else
        pastel = purples
        titular = "Electoral"
    end

    color_scale = [
        (0.0, pastel[1]),
        (0.2, pastel[2]),
        (0.4, pastel[3]),
        (0.6, pastel[4]),
        (0.8, pastel[5]),
        (1.0, pastel[6])
    ]
    # Create the data for the choropleth map
    data = choropleth(
        locationmode = "USA-states",
        locations = states,
        z = data,
        colorscale = color_scale,
        colorbar = attr(
            title = titular * "Votes",
            #tickvals = unique(input),
            #ticktext = string.(unique(input))
        ),
        zmin = minimum(input),
        zmax = maximum(input)
    )

    # Create the layout for the map
    layout = Layout(
        title = titular * " Vote by Swing State",
        geo = attr(
            scope = "usa",
            projection_type = "albers usa",
            showlakes = true,
            lakecolor = "rgb(255, 255, 255)"
        )
    )
# Create the plot
    plot(data, layout)
end

#------------------------------------------------------------------
# Function to determine the result based on the value of `biden`
function determine_result(biden_value)
    if biden_value    == 269
        return "tie"
    elseif biden_value < 269
        return "Trump"
    else
        return "Harris"
    end
end
