
@model function poll_model(num_votes::Int64, num_wins::Int64, prior_dist::Distribution)
    # Define the prior using the informed prior distribution
    p ~ prior_dist
    # Define the likelihood with additional uncertainty
    num_wins ~ Binomial(num_votes, p)
end

processed_polls        = Dict(state    => 
                         Dict(pollster => 
                         process_polls(polls) for (pollster, polls) in pollsters) 
                         for (state, pollsters) in current_month)

processed_polls_totals = Dict(state      => 
                         Dict("num_wins" => 
                         sum(first(values(polls)) for polls in values(pollsters)),
                         "num_votes"     => 
                         sum(last(values(polls)) for polls in values(pollsters)))
                         for (state, pollsters) in processed_polls)

num_wins               = processed_polls_totals[ST]["num_wins"]
num_votes              = processed_polls_totals[ST]["num_votes"]

poll_posterior         = prior_poll

posterior_mean         = mean(poll_posterior[:deep][:p])
posterior_var          =  var(poll_posterior[:deep][:p])
prior_alpha            = posterior_mean * 
                        (posterior_mean * (1 - posterior_mean) / posterior_var - 1)
prior_beta             = (1 - posterior_mean) * (posterior_mean *
                         (1 - posterior_mean) / posterior_var - 1)
prior_dist             = Beta(prior_alpha, prior_beta)

model                  = poll_model(num_votes, num_wins, prior_dist)
sampler                = NUTS(0.65)
num_samples            = 10000
num_chains             = 4
init_params            = [Dict(:p => 0.5)]
chain                  = sample(poll_model(num_votes, num_wins, prior_dist), 
                         sampler, num_samples, init_params=init_params)
                         
p_intv = quantile(chain[:p], [0.025, 0.975])
p_mean = summarystats(chain)[1,:mean]
p_mcse = summarystats(chain)[1,:mcse]
p_rhat = summarystats(chain)[1,:rhat]
p_df   = DataFrame(median = median(chain[:p]),
                   mean   = mean(chain[:p]),
                   mode   = mode(chain[:p]),
                   q025   = p_intv[1],
                   q975   = p_intv[2],
                   mcse   = summarystats(chain)[1,:mcse],
                   rhat   = summarystats(chain)[1,:rhat])

p_samples  = chain[:p]
p_vec      = vec(p_samples)
kde_result = kde(p_vec)

posterior_interval = p_intv
fig                = draw_density()
save(("../img/models/"*"$st"*"_"*"$mon"*".png"), fig)

deep = deepcopy(chain)
@save ("../objs/"*"$st"*"_"*"$mon"*"_p_sample.bson") deep

out       = Vector(p_df[1,:])
out       = round.(out,digits = 4)
p_df[1,:] = out
pretty_table(p_df,backend=Val(:html),show_subheader = false)
chain
summarystats(chain)
autocor(chain)
hpd(chain)