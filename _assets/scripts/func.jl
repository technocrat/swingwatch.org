function draw_density()
    # Create a new figure with specified resolution
    fig = Figure(size = (600, 400))
    
    # Add an axis to the figure
    ax = Axis(fig[1, 1], xlabel = "Likelihood of Harris win", ylabel = "Number of draws", title = "Model: Harris results in $st with polling through " * Month_names[Mon])
    
    # Plot the full density curve
    lines!(ax, kde_result.x, kde_result.density, color = "#a3b35c", linewidth = 3, label = "Draws")
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

function estimate_high_probability_outcomes(kde, threshold=0.5, num_samples=10000)
    # Sample from the kernel density estimate
    samples = rand(kde, num_samples)
    
    # Count samples above the threshold
    count_above_threshold = sum(samples .> threshold)
    
    # Calculate the proportion
    proportion = count_above_threshold / num_samples
    
    return proportion
end


