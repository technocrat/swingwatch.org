@model function election_model(state_polls, prior_prob)
    # Define the model parameters
    biden_prob ~ Uniform(0, 1)
    trump_prob = 1 - biden_prob

    # Define the likelihood
    for (_, polls) in state_polls
        for poll in polls
            biden_count = poll.biden_support
            trump_count = poll.trump_support
            sample_size = poll.sample_size

            # Convert counts to proportions
            biden_prop = biden_count / sample_size
            trump_prop = trump_count / sample_size

            # Likelihood of the poll data given the state probabilities
            biden_prop ~ Normal(biden_prob, 0.1)
            trump_prop ~ Normal(trump_prob, 0.1)
        end
    end

    # Define the prior
    biden_prob ~ Beta(prior_prob, 1 - prior_prob)

    # Return the Biden and Trump probabilities
    return (biden_prob, trump_prob)
end

current_model   = election_model(current_mon, prior_probs[ST])

current_samples = sample(current_model, NUTS(), 1_000_000)

# Summary statistics
summarystats(current_samples)

# Trace plot
plot(current_samples)

# Autocorrelation
autocor(current_samples)

# Effective sample size
ess(current_samples)


# Or using HMC sampler with a specified step size and number of leapfrog steps
# ETA 2.5 days, not run
# current_samples = sample(current_model, HMC(0.1, 10), 10_000)

# runs within minutes, but not pooled, so don't use
# current_samples = sample(current_model, NUTS(0.65), MCMCThreads(), 500, 50)
# summarystats(current_samples)
# plot(current_samples)
# autocor(current_samples)
# ess(current_samples)

biden_prob_samples = current_samples[:biden_prob]
biden_prob_mode    = mode(biden_prob_samples)

biden_prob_mean    = mean(biden_prob_samples)
biden_prob_median  = median(biden_prob_samples)
biden_prob_sd      = std(biden_prob_samples)
biden_prob_credible_interval = quantile(biden_prob_samples, [0.025, 0.975])
trump_prob_samples = 1 .- current_samples[:biden_prob] 
trump_prob_mode    = mode(trump_prob_samples)

trump_prob_mean    = mean(trump_prob_samples)
trump_prob_median  = median(trump_prob_samples)
trump_prob_sd      = std(trump_prob_samples)
trump_prob_credible_interval = quantile(trump_prob_samples, [0.025, 0.975])
println("Biden Probability:")
println("  Mean: ", biden_prob_mean)
println("  Mode: ", biden_prob_mode)
println("  Median: ", biden_prob_median)
println("  Standard Deviation: ", biden_prob_sd)
println("  95% Credible Interval: ", biden_prob_credible_interval)


summary_df = DataFrame(
    Parameter = ["Biden likelihood", "Trump likelihood"],
    Mean      = [biden_prob_mean, trump_prob_mean],
    Mode      = [biden_prob_mode, trump_prob_mode],
    Median    = [biden_prob_median, trump_prob_median],
    CI_Lower  = [biden_prob_credible_interval[1], trump_prob_credible_interval[1]],
    CI_Upper  = [biden_prob_credible_interval[2], trump_prob_credible_interval[2]]
)

# Define a formatter function that formats floating-point numbers to four decimal places
formatter = (v, i, j) -> isa(v, Float64) ? @sprintf("%.4f", v) : v

# Apply the formatter to all columns of the table
pretty_table(summary_df, 
             backend = Val(:html), 
             header = names(summary_df), 
             formatters = formatter, 
             standalone = false)

