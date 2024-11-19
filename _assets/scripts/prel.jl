using Chain
using Combinatorics
using CSV
using DataFrames
using Distributed
using Distributions
using Loess
using Plots
using PrettyTables
using Printf
using Statistics
using StatsBase

include("enum.jl") # enumerations
include("dict.jl") # dictionaries

month_map = Dict(
    "jan" => 1, "feb" => 2, "mar" => 3, "apr" => 4,
    "may" => 5, "jun" => 6, "jul" => 7, "aug" => 8,
    "sep" => 9, "oct" => 10, "nov" => 11, "dec" => 12
)

yod = [212, 215, 221, 228, 230, 241, 242, 243, 256, 262, 265, 266,
          268, 268, 268, 269, 269, 269, 272, 273, 273, 274, 275, 282,
          284, 287, 290, 291, 294, 295, 296, 300, 300, 302, 303, 304, 305]
camp = yod .- 211
"""
Compute Bayesian posterior given a Beta prior and binomial data
"""
function compute_posterior(α::Float64, β::Float64, successes::Vector{Int}, trials::Vector{Int})
    # Sum up total successes and trials across all polls
    total_successes = sum(successes)
    total_trials = sum(trials)

    # Compute posterior parameters
    post_α = α + total_successes
    post_β = β + total_trials - total_successes

    return Beta(post_α, post_β)
end

"""
Compute weighted normalized Harris proportion from individual poll results, handling missing values
"""
function compute_weighted_margin(hnorm::Vector{Union{Missing, Float64}}, n::Vector{Int})
    # Filter out missing values and their corresponding weights
    valid_indices = .!ismissing.(hnorm)
    valid_hnorms = Float64.(hnorm[valid_indices])
    valid_n = n[valid_indices]
    weights = valid_n ./ sum(valid_n)
    return sum(valid_hnorm .* weights)
end

"""
Convert weighted margin data to effective successes/trials format
Handles missing values by filtering them out
"""
function weighted_margin_to_successes(margin::Vector{Union{Missing, Float64}}, n::Vector{Int})
    # Filter out missing values and their corresponding sample sizes
    valid_indices = .!ismissing.(margin)
    valid_margins = Float64.(margin[valid_indices])
    valid_n       = n[valid_indices]

    # Convert margins to probabilities (0 to 1 scale)
    p = (valid_margins .+ 100) ./ 200

    # Calculate effective sample sizes and successes
    total_n = sum(valid_n)
    weights = valid_n ./ total_n

    # Weighted success count (preserving information about sample sizes)
    weighted_p = sum(p .* weights)
    successes  = round.(Int, p .* valid_n)

    return successes
end

"""
Compute effective sample size for weighted polls
"""
function compute_effective_n(n::Vector{Int})
    weights = n ./ sum(n)
    return round(Int, 1 / sum(weights .^ 2))
end

"""
Analyze polling data with different priors and data selections, using weighted calculations
"""
function analyze_polls(df::DataFrame, actual_margin::Float64;
                      priors::Vector{Tuple{Float64,Float64}}=[(2.0,2.0)],
                      window_sizes::Vector{Int}=[length(df.miss)],
                      credible_level::Float64=0.95)

    results = DataFrame(
        prior_α            = Float64[],
        prior_β            = Float64[],
        window_size        = Int[],
        window_start       = Int[],
        weighted_median    = Float64[],
        lower_ci           = Float64[],
        upper_ci           = Float64[],
        includes_actual    = Bool[],
        distance_to_actual = Float64[],
        effective_n        = Int[],
        valid_polls        = Int[]
    )

    # Sort data by date (assuming it's already in chronological order)
    for (α, β) in priors
        for window in window_sizes
            for start_idx in 1:(length(df.margin)-window+1)
                # Select window of data
                window_data = df[start_idx:(start_idx+window-1), :]

                # Skip windows with all missing values
                if all(ismissing.(window_data.margin))
                    continue
                end

                # Count valid polls in window
                valid_polls = sum(.!ismissing.(window_data.margin))

                # Calculate effective sample size
                valid_indices = .!ismissing.(window_data.margin)
                eff_n = compute_effective_n(window_data.n[valid_indices])

                # Convert margins to successes/trials format with weights
                successes = weighted_margin_to_successes(window_data.margin, window_data.n)

                # Compute weighted posterior
                posterior = compute_posterior(α, β, successes, window_data.n[valid_indices])

                # Calculate weighted statistics
                weighted_median = median(posterior) * 200 - 100  # Convert back to margin scale
                ci = quantile.(posterior, [0.5 - credible_level/2, 0.5 + credible_level/2])
                ci_margins = ci .* 200 .- 100

                # Check if actual margin is in credible interval
                includes = ci_margins[1] <= actual_margin <= ci_margins[2]

                # Distance from weighted median to actual
                distance = abs(weighted_median - actual_margin)

                # Store results
                push!(results, (
                    α, β, window, start_idx, weighted_median,
                    ci_margins[1], ci_margins[2],
                    includes, distance, eff_n, valid_polls
                ))
            end
        end
    end

    return results
end

"""
Find best combinations of prior and data selection based on weighted analysis
"""
function find_best_analyses(results::DataFrame; n_best::Int=5)
    # Sort by distance to actual using weighted metrics
    sorted_results = sort(results, :distance_to_actual)
    return first(sorted_results, n_best)
end

"""
Plot weighted posterior distributions for different analyses
"""
function plot_posteriors(df::DataFrame, actual_margin::Float64, analyses::DataFrame)
    p = plot(title="Weighted Posterior Distributions vs Actual Outcome",
            xlabel="Margin", ylabel="Density")
    vline!([actual_margin], label="Actual", color=:red, linewidth=2)

    for row in eachrow(analyses)
        # Recreate posterior for this analysis using weighted data
        window_data = df[row.window_start:(row.window_start+row.window_size-1), :]
        valid_indices = .!ismissing.(window_data.margin)

        successes = weighted_margin_to_successes(window_data.margin, window_data.n)
        posterior = compute_posterior(row.prior_α, row.prior_β, successes, window_data.n[valid_indices])

        # Create x values for plotting (convert to margin scale)
        x = range(0, 1, length=100) .* 200 .- 100
        y = pdf.(posterior, (x .+ 100) ./ 200) ./ 200

        plot!(x, y,
              label="α=$(row.prior_α), β=$(row.prior_β), window=$(row.window_size) (n_eff=$(row.effective_n), valid=$(row.valid_polls))")
    end

    return p
end

"""
Summarize weighted poll characteristics
"""
function summarize_poll_window(df::DataFrame, start_idx::Int, window_size::Int)
    window_data     = df[start_idx:(start_idx+window_size-1), :]
    valid_indices   = .!ismissing.(window_data.margin)

    weighted_margin = compute_weighted_margin(window_data.margin, window_data.n)
    effective_n     = compute_effective_n(window_data.n[valid_indices])
    total_n         = sum(window_data.n[valid_indices])
    valid_polls     = sum(valid_indices)

    return (
        weighted_margin = weighted_margin,
        effective_n     = effective_n,
        total_n         = total_n,
        n_polls         = window_size,
        valid_polls     = valid_polls,
        start_date      = first(window_data.date),
        end_date        = last(window_data.date)
    )
end

function norm_margin(trump::Int64,harris::Int64)
 normed = [trump,harris] ./ (trump + harris)
 margin = normed[1] - normed[2]
end

function format_as_percentage(x::Float64)
    return @sprintf("%.2f%%", x * 100)
end

function normalize_two_way_race(cast::Int64, cutout::Vector{Float64})
    # Ensure we have exactly two main vote shares
    @assert length(cutout) == 2 "Expected exactly two vote shares"

    # Calculate total vote share accounted for by the two candidates
    total_share = sum(cutout)

    # Normalize to get proportions of two-way race
    normalized = cutout ./ total_share

    # Calculate actual vote counts
    vote_counts = round.(Int, normalized .* cast)

    return normalized, vote_counts
end

# Function to calculate the weighted mean by group
function weighted_mean_by_group(df, group_col, value_col, weight_col)
    combine(groupby(df, group_col)) do subdf
        weights = Weights(subdf[!, weight_col])
        mean_value = mean(subdf[!, value_col], weights)
        DataFrame(group = subdf[1, group_col], Harris = mean_value)
    end
end

# using Loess
# using Plots

# function fit_loess(y::Vector{Float64};
#                   span::Float64=0.75,
#                   degree::Int=2=5)
#     # Create x coordinates (indices)
#     x = Float64.(1:length(y))

#     # Fit the LOESS model
#     model = loess(x, y; span=span, degree=degree)

#     # Generate predictions for all points
#     xs = collect(minimum(x):0.1:maximum(x))
#     ys = predict(model, xs)

#     # Create the plot
#     p = plot(x, y,
#             seriestype=:scatter,
#             label="Polls",
#             alpha=0.5)
#     plot!(xs, ys,
#           label="LOESS fit",
#           linewidth=2)

#     return model, p
# end

# Example usage:
# y = your_vector_here
# model, plot = fit_loess(y)
# display(plot)
# model, p = fit_loess(yod)
# display(p)


# To get predictions at specific points:
# new_x = [1.0, 2.0, 3.0]
# predictions = predict(model, new_x)

custom_order = Dict("jul" => 1, "aug" => 2, "sep" => 3, "oct" => 4)
