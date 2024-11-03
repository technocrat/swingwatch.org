#margin                 = first(margins[margins.st .== st, :pct])
poll_posterior         = prior_poll
posterior_mean         = mean(poll_posterior[:deep][:p])
posterior_var          = var( poll_posterior[:deep][:p])
prior_alpha            = posterior_mean * 
                        (posterior_mean * 
                        (1 - posterior_mean) / 
                         posterior_var - 1)
prior_beta             = (1 - posterior_mean) * 
                         (posterior_mean *
                         (1 - posterior_mean) / 
                         posterior_var - 1)
prior_dist             = Beta(prior_alpha, prior_beta)
"""
    @model poll_model(num_votes::Int64, num_wins::Int64, prior_dist::Distribution)

Defines a probabilistic model for Bayesian inference of a binomial proportion using the Turing.jl library.

This model estimates the probability `p` of success in a binomial experiment, given observed data and a prior distribution for `p`.

**Parameters**:

- `num_votes` (`Int64`): The total number of trials or votes.
- `num_wins` (`Int64`): The number of observed successes or wins.
- `prior_dist` (`Distribution`): The prior distribution for the probability `p`. This should be a univariate distribution over `[0, 1]`, such as `Beta` or `Uniform`.

**Model Structure**:

- `p ~ prior_dist`: The probability of success `p` is assigned the specified prior distribution.
- `num_wins ~ Binomial(num_votes, p)`: The observed number of successes `num_wins` is modeled as a binomial random variable with `num_votes` trials and success probability `p`.

**Usage Example**:

```julia
using Turing, Distributions

# Define prior distribution
prior_dist = Beta(2, 2)  # Example prior

# Observed data
num_votes = 100
num_wins = 60

# Define the model
model = poll_model(num_votes, num_wins, prior_dist)

# Perform inference using NUTS sampler
chain = sample(model, NUTS(), 1000)

# Summarize the results
describe(chain)
Notes:

This model is compatible with any sampler from Turing.jl.
Ensure that prior_dist is appropriate for modeling probabilities (i.e., its support is within [0, 1]).
The function uses the @model macro from Turing.jl; make sure Turing is properly imported.
""" 
@model function poll_model(num_votes::Int64, num_wins::Int64, prior_dist::Distribution)
    p ~ prior_dist
    num_wins ~ Binomial(num_votes, p)
end
model                  = poll_model(num_votes, num_wins, prior_dist)
sampler                = NUTS(0.65)
num_samples            = 10000
num_chains             = 4
init_params            = [Dict(:p => 0.5)]
chain                  = sample(poll_model(num_votes, num_wins, prior_dist), 
                         sampler, num_samples, init_params=init_params)
p_intv                 = quantile(chain[:p], [0.01, 0.99])
p_mean                 = summarystats(chain)[1,:mean]
p_mcse                 = summarystats(chain)[1,:mcse]
p_rhat                 = summarystats(chain)[1,:rhat]
p_df                   = DataFrame(median = median(chain[:p]),
                                   mean   = mean(chain[:p]),
                                   mode   = mode(chain[:p]),
                                   min    = findmin(chain[:p])[1],
                                   max    = findmax(chain[:p])[1],
                                   q025   = p_intv[1],
                                   q975   = p_intv[2])
out                    = Vector(p_df[1,:])
out                    = round.(out,digits = 4)
p_df[1,:]              = out
p_samples              = chain[:p]
p_vec                  = vec(p_samples)
kde_result             = kde(p_vec)
posterior_interval     = p_intv
