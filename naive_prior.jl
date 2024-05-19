
using MCMCChains
using StatsPlots
using Statistics
using Turing

# Set the number of votes and wins for PA
num_votes = 6835903
num_wins  = 3458229

# Define the model
@model function election_model(num_votes, num_wins)
    # Prior: Beta(2, 2) equivalent to a close race going in
    p ~ Beta(2, 2)
    
    # Likelihood: Binomial(num_votes, p)
    num_wins ~ Binomial(num_votes, p)
end

# Set up the sampler
sampler = NUTS(0.65)

# Specify the number of samples and chains
num_samples = 10000
num_chains = 4

# Sample from the posterior
init_params = [Dict(:p => 0.5)]
chain = sample(election_model(num_votes, num_wins), sampler, MCMCThreads(), num_samples, num_chains)


# Plot the posterior density
plot(chain, xlabel="Probability of Winning", ylabel="Density", 
     title="Posterior Distribution of Winning Probability")

# Compute posterior mean and 95% credible interval
# 67%, 89%, and 97%
posterior_mean = mean(chain[:p])
posterior_interval = quantile(chain[:p], [0.025, 0.975])
posterior_interval = quantile(chain[:p], [0.67, 0.89, 0.97])

println("Posterior mean: ", posterior_mean)
println("95% credible interval: ", posterior_interval)

# Summary statistics
summarystats(chain)

# Trace plot
plot(chain)

# Autocorrelation
autocor(chain)

# Effective sample size
ess(chain)