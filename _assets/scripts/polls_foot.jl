@load "../objs/"*"$mon"*"_Polls.bson" months

processed_polls = Dict(state => Dict(pollster => process_polls(polls) for (pollster, polls) in pollsters) for (state, pollsters) in current_month)

processed_polls_totals = Dict(state => Dict(
    "num_wins" => sum(first(values(polls)) for polls in values(pollsters)),
    "num_votes" => sum(last(values(polls)) for polls in values(pollsters))
) for (state, pollsters) in processed_polls)

num_wins  = processed_polls_totals[ST]["num_wins"]
num_votes = processed_polls_totals[ST]["num_votes"]

election_posterior = BSON.load("../objs/"*"$st"*"_2020_p_sample.bson")
posterior_mean = mean(election_posterior[:deep][:p])
posterior_var  = var(election_posterior[:deep][:p])
prior_alpha    = posterior_mean * (posterior_mean * (1 - posterior_mean) / posterior_var - 1)
prior_beta     = (1 - posterior_mean) * (posterior_mean * (1 - posterior_mean) / posterior_var - 1)
prior_dist     = Beta(prior_alpha, prior_beta)

@model function poll_model(num_votes::Int64, num_wins::Int64)
    # Define the prior using the Beta distribution
    p ~ prior_dist

    # Define the likelihood
    num_wins ~ Binomial(num_votes, p)
end

# Set up the sampler
sampler = NUTS(0.65)

# Specify the number of samples and chains
num_samples = 10000
num_chains  = 4

# Sample from the posterior
init_params = [Dict(:p => 0.5)]

chain = sample(poll_model(num_votes, num_wins), sampler, num_samples, init_params=init_params)

p_intv = quantile(chain[:p], [0.025, 0.975])
p_mean = summarystats(chain)[1, :mean]
p_mcse = summarystats(chain)[1, :mcse]
p_rhat = summarystats(chain)[1, :rhat]
p_df   = DataFrame(median = median(chain[:p]),
                   mean   = mean(chain[:p]),
                   mode   = mode(chain[:p]),
                   q025   = p_intv[1],
                   q975   = p_intv[2],
                   mcse   = summarystats(chain)[1, :mcse],
                   rhat   = summarystats(chain)[1, :rhat])

# Extract the :p parameter from the chain object
p_samples = chain[:p]

# Flatten the p_samples array into a 1D vector
p_vec = vec(p_samples)

# Compute the density estimate
kde_result = kde(p_vec)

# Display posterior density plot
posterior_interval = p_intv
fig = draw_density()
deep = deepcopy(chain)
@save ("../objs/"*"$st"*"_"*"$mon"*"_p_sample.bson") deep
save(("../img/models/"*"$st"*"_"*"$mon"*".png"), fig)
out       = Vector(p_df[1,:])
out       = round.(out,digits = 4)
p_df[1,:] = out
pretty_table(p_df,backend=Val(:html),show_subheader = false)
chain
summarystats(chain)
autocor(chain)
hpd(chain)