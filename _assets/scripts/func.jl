"""
    draw_density()

Generates and returns a density plot figure visualizing the posterior distribution of the likelihood of Harris winning in a specific state, based on current polling data.

The plot includes:
- **KDE Line Plot**: The kernel density estimate (KDE) of the posterior draws, plotted as a solid line.
- **Credible Interval Shading**: A shaded area under the KDE curve representing the credible interval of the posterior distribution.
- **Actual Margin Line**: A vertical dashed line indicating the actual margin from the 2020 election.
- **Axis Labels and Title**: Customizable labels for the x-axis and y-axis, and a title that includes the state and polling date.
- **Legend**: A legend explaining the plotted elements.
- **Axis Limits**: Adjusted x-axis limits based on `p_vec` and y-axis limits starting from zero.

**Dependencies**:
- `kde_result`: An object containing `x` and `density` arrays from a KDE computation.
- `posterior_interval`: A tuple or array containing the lower and upper bounds of the credible interval.
- `margin`: A numerical value representing the actual margin from the 2020 election.
- `p_vec`: An array of possible probability values used to set x-axis limits.
- `st`: A string representing the state being analyzed.
- `Mon`: An integer representing the current month index.
- `Month_names`: An array of month names.
- `LORANGE`: A color constant for the credible interval shading.
- `FLAGBLUE`: A color constant for the actual margin line.

**Returns**:
- `fig` (`Makie.Figure`): A Makie Figure object containing the constructed density plot.

**Note**:
This function relies on global variables defined outside its scope. Ensure all dependencies are properly defined before calling this function.
"""
function draw_density()
    fig      = Figure(size = (600, 400))
    ax       = Axis(fig[1, 1], xlabel = "Likelihood of Harris win", ylabel = "Number of draws",
                     title = "Model: Harris results in $st with polling through " * Month_names[Mon])
    lines!(ax, kde_result.x, kde_result.density, color = "#a3b35c", linewidth = 3, label = "Draws")
    indices  = findall((posterior_interval[1] .<= kde_result.x) .& (kde_result.x .<= posterior_interval[2]))
    x_region = kde_result.x[indices]
    y_region = kde_result.density[indices]
    band!(ax, x_region, fill(0, length(x_region)), y_region, color = (LORANGE), label = "Credible Interval")
    # Draw a vertical line at x = 0.5 with label "Even odds"
    vlines!(ax, [0.5], color = :red, linestyle = :dash, linewidth = 2, label = "Even odds")
    axislegend(ax)
    Makie.xlims!(ax, extrema(p_vec))
    Makie.ylims!(ax, 0, nothing)
    fig
end

"""
    estimate_high_probability_outcomes(kde, threshold=0.5, num_samples=10000)

Estimates the proportion of samples from a given kernel density estimate (KDE) that are greater than a specified threshold.

**Parameters**:
- `kde`: A KDE object from which samples can be drawn using the `rand` function.
- `threshold` (`Float64`, default = 0.5): The threshold value above which samples are considered high-probability outcomes.
- `num_samples` (`Int`, default = 10000): The number of random samples to draw from the KDE for estimation.

**Returns**:
- `proportion` (`Float64`): The estimated proportion of samples exceeding the threshold.

**Example**:
```julia
kde = some_kde_function(data)
prob = estimate_high_probability_outcomes(kde, threshold=0.7, num_samples=5000)
println("Proportion of outcomes above 0.7: ", prob)
Notes:

The function uses Monte Carlo sampling; results may vary slightly with each run due to randomness.
Ensure that kde is a valid KDE object compatible with rand.
""" 
function estimate_high_probability_outcomes(kde, threshold=0.5, num_samples=10000)
    samples               = rand(kde, num_samples)
    count_above_threshold = sum(samples .> threshold)
    proportion            = count_above_threshold / num_samples
    return proportion
end

function flip!(df, state)
    i = findfirst(df.po .== state)
    df[i, :harris], df[i, :trump] = df[i, :trump], df[i, :harris]
    return df
end

function tally()
  spread.spread = spread.margin .- spread.pop_harris ./ (spread.pop_harris .+ spread.pop_trump)
end

