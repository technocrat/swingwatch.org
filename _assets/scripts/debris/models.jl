
# deprecated until conformed to current usage
@model function election_model(num_votes, num_wins)
    # Prior: Beta(2, 2) equivalent to a close race going in
    p ~ Beta(2, 2)
    
    # Likelihood: Binomial(num_votes, p)
    num_wins ~ Binomial(num_votes, p)
end

election_posterior = sample(election_model(num_votes, num_wins), sampler, num_samples, init_params=init_params)

prior_dist = Empirical(vec(election_posterior[:p].value[:]))

@model function poll_model(Int64, num_wins::Int64)
    # Define the prior using the posterior from the previous analysis
    p ~ prior_dist
    
    # Define the likelihood
    num_wins ~ Binomial(num_votes, p)
end