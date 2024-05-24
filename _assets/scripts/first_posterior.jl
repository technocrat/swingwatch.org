include("first_posterior_forepart.jl")
# Set the number of votes and wins
last_election = CSV.read("../objs/election_priors.csv", DataFrame)


ST        = last_election[1, :st]
num_wins  = last_election[1, :num_wins]
num_votes = last_election[1, :num_votes]
margins   = CSV.read("../objs/margins.csv", DataFrame)
margin    = first(margins[margins.st .== ST, :pct])

chain  = sample(election_model(num_votes, num_wins), sampler, num_samples, init_params=init_params)

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

include("first_posterior_aftpart.jl")
# Display posterior density plot
posterior_interval = p_intv
fig = draw_density()
deep = deepcopy(chain)
@save ("../objs/$ST" * "_2020_p_sample.bson") deep
save(("../img/models/$ST" * "_2020.png"), fig)
out       = Vector(p_df[1,:])
out       = round.(out,digits = 4)
p_df[1,:] = out
pretty_table(p_df,backend=Val(:html), show_subheader = false)

