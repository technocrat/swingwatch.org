# @model function poll_model(num_votes::Int64, num_wins::Int64)
#     # Define the prior using the Beta distribution
#     p ~ prior_dist
# 
#     # Define the likelihood
#     num_wins ~ Binomial(num_votes, p)
# end

# 
# election_posterior     = BSON.load("../objs/"*"$st"*"_2020_p_sample.bson")
# posterior_mean         = mean(election_posterior[:deep][:p])
# posterior_var          = var(election_posterior[:deep][:p])
# prior_alpha            = posterior_mean * 
#                         (posterior_mean * (1 - posterior_mean) / posterior_var - 1)
# prior_beta             = (1 - posterior_mean) * (posterior_mean *
#                          (1 - posterior_mean) / posterior_var - 1)
# prior_dist             = Beta(prior_alpha, prior_beta)

# @model function poll_model(num_votes::Int64, num_wins::Int64, prior_dist::Distribution)
#     # Define the prior using the informed prior distribution
#     p ~ prior_dist
#     
#     # Define the likelihood with adjusted survey uncertainty
#     p_survey ~ Beta(8, 6)  # Adjust the parameters as needed
#     p_combined = (p + p_survey) / 2
#     num_wins ~ Binomial(num_votes, p)
# end