using DataFrames
using Distributions
using Statistics

include("constants.jl")
# needs work
"""
    simulate(scenarios::Int64, rv::Int64, biden_pop::Int64, trump_pop::Int64)

Simulate an election scenario based on the given parameters.

# Arguments
- `scenarios::Int64`: The number of scenarios to simulate.
- `rv::Int64`: The standard deviation for the random variation in vote counts.
- `biden_pop::Int64`: The base vote count for Biden.
- `trump_pop::Int64`: The base vote count for Trump.

# Returns
- `simulation_results::Dict`: A dictionary containing the simulation results.
  - `base_votes`: The base vote distribution used in the simulation.
  - `mean_votes`: The mean votes for each candidate based on the simulated scenarios.
  - `median_votes`: The median votes for each candidate based on the simulated scenarios.
  - `credible_intervals`: The 95% credible intervals for each candidate's vote count.

# Example
```julia
biden_pop          = 80000000
trump_pop          = 74000000
num_scenarios      = 1000
standard_deviation = 10000

results = simulate(num_scenarios, standard_deviation, biden_pop, trump_pop)
# Example usage
biden_pop          = 80000000
trump_pop          = 74000000
num_scenarios      = 1000
standard_deviation = 10000

results = simulate(num_scenarios, standard_deviation, biden_pop, trump_pop)

# Access the simulation results
base_votes         = results["base_votes"]
mean_votes         = results["mean_votes"]
median_votes       = results["median_votes"]
credible_intervals = results["credible_intervals"]

# Print the simulation results
println("Base Votes:             ", base_votes)
println("Mean Votes:             ", mean_votes)
println("Median Votes:           ", median_votes)
println("95% Credible Intervals: ", credible_intervals)
"""
function simulate(scenarios::Int64, rv::Int64, biden_pop::Int64, trump_pop::Int64)
    # Base vote distribution from the previous election
    base_votes = [biden_pop, trump_pop]
    
    # Simulate multiple scenarios
    num_scenarios   = scenarios
    simulated_votes = zeros(num_scenarios, 2)
    
    for i in 1:num_scenarios
        # Account for random variation
        random_variation = rand(Normal(0, rv), 2)
        
        # Adjust the base vote distribution
        adjusted_votes   = base_votes + random_variation
        
        simulated_votes[i, :] = adjusted_votes
    end
    
    # Analyze the results
    mean_votes         = mean(simulated_votes, dims=1)
    median_votes       = median(simulated_votes, dims=1)
    credible_intervals = [quantile(simulated_votes[:, i], [0.025, 0.975]) for i in 1:size(simulated_votes, 2)]
    
    # Create a dictionary to store the simulation results
    simulation_results = Dict(
        "base_votes"         => base_votes,
        "mean_votes"         => mean_votes,
        "median_votes"       => median_votes,
        "credible_intervals" => credible_intervals
    )
    
    return simulation_results
end

# see intake.jl for production of 2020vote.csv
base  = CSV.read("../objs/2020vote.csv", DataFrame)
votes = filter(row -> row.st in STATES, base)

results = simulate(num_scenarios, standard_deviation, biden_pop, trump_pop)
# Calculate the probability of Biden winning based on the simulated scenarios
biden_wins = sum(simulated_votes[:, 1] .> simulated_votes[:, 2]) / num_scenarios
println("Probability of Biden winning: ", biden_wins)