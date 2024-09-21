current_month          = remove_empties(months[mon])
margin                 = first(margins[margins.st .== st, :pct])
consolidated_polls     = consolidate_polls(current_month)
support                = calculate_support(consolidated_polls,ST)
num_wins               = support[1]
num_votes              = support[3]
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
model                  = poll_model(num_votes, num_wins, prior_dist)
sampler                = NUTS(0.65)
num_samples            = 10000
num_chains             = 4
init_params            = [Dict(:p => 0.5)]
chain                  = sample(poll_model(num_votes, num_wins, prior_dist), 
                         sampler, num_samples, init_params=init_params)
p_intv                 = quantile(chain[:p], [0.025, 0.975])
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