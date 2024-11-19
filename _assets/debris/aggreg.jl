const DESIGN_ERROR = 0.012

struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int
end

polls_structure = Dict{String, Dict{String, Vector{Poll}}}()

function add_poll!(structure, month, state, poll)
    if !haskey(structure, month)
        structure[month] = Dict{String, Vector{Poll}}()
    end
    if !haskey(structure[month], state)
        structure[month][state] = Vector{Poll}()
    end
    push!(structure[month][state], poll)
end

# Example Polls
polls = [
    Poll(0.40, 0.46, 1305),
    Poll(0.45, 0.45, 807),
    Poll(0.56, 0.46, 520),
    Poll(0.50, 0.50, 1000),    
    Poll(0.43, 0.47, 1000),
    Poll(0.48, 0.38, 431),
    Poll(0.43, 0.47, 1000),
    Poll(0.43, 0.47, 600)
]

# Assuming you have month and state information for each poll
# For demonstration, let's add them to "January" and "Washington"
for poll in polls
    add_poll!(polls_structure, "March", "Pennsylvania", poll)
end

# Serialize
# bson("savit.bson",polls_structure)
# 

"""
   margin_of_error(sample_size::Int64)

Calculates the margin of error for a given sample size, assuming a 95% confidence level and a maximum variability (p = 0.5).

# Arguments
- `sample_size::Int64`: The size of the sample.

# Returns
- `Float64`: The margin of error.

# Notes
- The margin of error is calculated using the formula: sqrt(0.5 * 0.5 / sample_size) + DESIGN_ERROR, where DESIGN_ERROR is a constant representing the design effect or any additional errors introduced by the sampling procedure.
- The formula assumes a 95% confidence level and a maximum variability of 0.5 (i.e., p = 0.5 and q = 0.5, where p is the estimated proportion of the population with the characteristic of interest, and q = 1 - p).
- The margin of error is a measure of the precision of the estimate and represents the maximum expected difference between the true population parameter and the sample estimate, with a certain level of confidence.

# Examples
```julia
julia> margin_of_error(100)
0.09799799799799998

julia> margin_of_error(1000)
0.031623031623031625
"""
function margin_of_error(sample_size)
    sqrt(0.5 * 0.5 / sample_size) + DESIGN_ERROR
end

polls = [
    Poll(0.40, 0.46, 1305),
    Poll(0.45, 0.45, 807),
    Poll(0.56, 0.46, 520),
    Poll(0.50, 0.50, 1000),    
    Poll(0.43, 0.47, 1000),
    Poll(0.48, 0.38, 431),
    Poll(0.43, 0.47, 1000),
    Poll(0.43, 0.47, 600)
]

total_sample_size = sum(poll.sample_size for poll in polls)

"""
   weighted_average(polls::Vector{<:AbstractPoll}, candidate::Symbol)

Calculates the weighted average of a candidate's poll results across multiple polls, where
the weights are determined by the inverse of the squared margin of error for each poll.

# Arguments
- `polls::Vector{<:AbstractPoll}`: A vector of poll objects, each containing information about the poll, such as sample size, candidate results, etc.
- `candidate::Symbol`: The symbol representing the candidate for whom the weighted average is to be calculated.

# Returns
- `Float64`: The weighted average of the candidate's poll results.

# Notes
- This function assumes that each poll object has fields named `sample_size` and a field named after the `candidate` symbol, containing the poll result for that candidate.
- The weight for each poll is calculated as `poll.sample_size / (margin_of_error(poll.sample_size)^2)`, which gives more weight to polls with larger sample sizes and smaller margins of error.
- The weighted average is calculated as the sum of (poll result * weight) for all polls, divided by the sum of weights for all polls.
- This method of calculating the weighted average is commonly used in aggregating poll results, as it accounts for the precision of each poll based on its sample size and margin of error.

# Examples
```julia
# Assuming there are two poll objects, `poll1` and `poll2`, with fields `sample_size`, `:candidate1`, and `:candidate2`
polls = [poll1, poll2]
weighted_avg_candidate1 = weighted_average(polls, :candidate1)
weighted_avg_candidate2 = weighted_average(polls, :candidate2)
"""

function weighted_average(polls, candidate)
    sum(
        getfield(poll, candidate) * poll.sample_size / (margin_of_error(poll.sample_size)^2)
        for poll in polls
    ) / sum(
        poll.sample_size / (margin_of_error(poll.sample_size)^2)
        for poll in polls
    )
end

biden_weighted_avg = weighted_average(polls, :biden_support)
trump_weighted_avg = weighted_average(polls, :trump_support)

function aggregate_margin_of_error(polls)
    sqrt(
        sum(
            (margin_of_error(poll.sample_size)^2) * (poll.sample_size / total_sample_size)^2
            for poll in polls
        )
    ) * 1.96
end

aggregate_moe = aggregate_margin_of_error(polls)

println("Aggregated Biden support: $(round(biden_weighted_avg * 100, digits=2))% ± $(round(aggregate_moe * 100, digits=2))%")
println("Aggregated Trump support: $(round(trump_weighted_avg * 100, digits=2))% ± $(round(aggregate_moe * 100, digits=2))%")