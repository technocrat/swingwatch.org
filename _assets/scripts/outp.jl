fig                  = draw_density()
pretty_table(p_df,backend=Val(:html),show_subheader = false)
estimated_proportion = estimate_high_probability_outcomes(chain[:p])
println("The model shows Harris [leading], with $(estimated_proportion * 100)% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a [strong] position for Harris, but it's important to note that this is a statistical projection based the data from August through October 31. This is a summary of the model, not a prediction of the election outcome.")
