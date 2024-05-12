"""
To illustrate the limitations of presidential preference polling it is possible to simulate accuracy of polling conducted for the Georgia election in 2020. It is assumed that one or more pollsters independently sample after polls close election night but before official results are released. The pollsters each ask three questions:

1. Did you vote?
2. Did you vote for one of Donald Trump or Joe Biden?
3. Which one?

until some preset number of replies to the third question are obtained.

The objective is to determine

1. The minimum sample size needed to have a 97.5% probablility of identifying a vote spread less than or equal to 246775, or 0.5% of the total cast for Trump and Biden, which is the threshhold for a mandatory recount.
2. The probability that the mean spread is positive (a Biden win) at the 97.5% confidence interval, which is 39 chances in 40 of being correct.
3. The probability that all polls will show a positive spread at the 97.5% confidence interval
4. The probability that at least one poll will show a negative spread (Trump win) at the 97.5% confidence interval
"""

using Distributions
using Plots
using Statistics

z               = 1.96  # z-score for 97.5% confidence level
p               = 0.5   # assumed population proportion
margin_of_error = 0.005 # 0.5% margin of error

# Solve for the sample size
n = ceil(Int, (z^2 * p * (1 - p)) / margin_of_error^2)

println("Minimum sample size needed: $n")

biden         = 2473633
trump         = 2461854
total_votes   = biden + trump
spread        = biden - trump
recount       = 246775
actual_spread = (biden - trump) / total_votes

sample_size   = 1000
repetitions   =   10

predicted_spreads = zeros(repetitions)

for i in 1:repetitions
    sample       = rand(1:total_votes, sample_size)
    sample_biden = count(sample .<= biden)
    sample_trump = sample_size - sample_biden

    predicted_spread     = (sample_biden - sample_trump) / sample_size
    predicted_spreads[i] = predicted_spread
end

mean_predicted_spread = mean(predicted_spreads)

result = Int64.(floor.(total_votes .* predicted_spreads))
mean(result)

mean_spread        = mean(predicted_spreads)
std_spread         = std(predicted_spreads)

# Calculate the z-score for the mean spread
z_score            = mean_spread / (std_spread / sqrt(repetitions))

# Calculate the probability using the cumulative distribution function (cdf)
prob_positive_mean = 1 - cdf(Normal(), z_score)

println("Probability that the mean spread is positive: $(round(prob_positive_mean, digits=4))")

# Calculate the z-score for a spread of 0
z_score = 0 / std_spread

# Calculate the probability of a single poll showing a positive spread
prob_positive_poll = 1 - cdf(Normal(), z_score)

# Calculate the probability of all polls showing a positive spread
prob_all_positive = prob_positive_poll^repetitions

println("Probability that all polls will show a positive spread: $(round(prob_all_positive, digits=4))")

