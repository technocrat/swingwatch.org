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
    ax = Axis(fig[1, 1], xlabel = "Likelihood of Biden win", ylabel = "Number of draws", title = "Model: Biden wins in $ST from 2020 election before polling")
    
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
