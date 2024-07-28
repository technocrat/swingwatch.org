using DataFrames
using Distributions
using Formatting
using Statistics

const recount = 0.025 # based on Georgia recount rule of half-percent

# confidence interval, alpha, proportion and z scores
cis = [0.01, 0.025, 0.05, 0.10, 0.20] # 99% 97.5% 95% 90% 80%
alf = 1 .- cis
"""
The assumption of p = 0.5 for the population proportion is based on the concept of maximum variance in a binomial distribution. In a binomial distribution, the variance is calculated as p * (1 - p) * n, where p is the probability of success, and n is the number of trials. The maximum variance occurs when p = 0.5, which means that the probability of success is equal to the probability of failure. When calculating the sample size for a proportion, if there is no prior knowledge about the population proportion, it is common practice to assume p = 0.5. This assumption provides the most conservative estimate of the sample size needed to achieve a desired level of precision. By setting p = 0.5, we are essentially assuming the worst-case scenario in terms of variability, which leads to the largest possible sample size. This ensures that the sample size is sufficient to achieve the desired level of precision, regardless of the actual population proportion.
"""
p   = 0.5 # assumed proportion

# one tailed test

zzs = quantile(Normal, 1 .- alf)

labs = map(f -> @sprintf("%.2f%%", f * 100), alf)
rads = Formatting.format.(n, commas=true)


# Solve for the sample size

n   = ceil.(Int, (zzs.^2 * p * (1 - p)) / recount^2)

rads = Formatting.format.(n, commas=true)

tab = DataFrame(
        ci = labs,
        n  = rads
)

header = ["Confidence level", "Required sample"]

pretty_tables(tab, backend = Val(:html), header = header, subhead = false)

