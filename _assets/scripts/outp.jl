fig                      = draw_density()
pretty_table(p_df,backend=Val(:html),show_subheader = false)
# Assume 'kde' is your pre-computed kernel density estimate
# kde = kde(your_mcmc_samples)

# Estimate the proportion of outcomes with probability > 0.5
estimated_proportion = estimate_high_probability_outcomes(chainp[:p])

println("The model shows Harris leading, with $(estimated_proportion * 100)% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a strong position for Harris, but it's important to note that this is a statistical projection based the data from August through late September. This is a summary of the model, not a prediction of the election outcome.")
