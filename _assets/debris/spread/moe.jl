"""
    intrinsic_margin_of_error(N::Int, confidence_level::Float64 = 0.95)

Calculate the margin of error for a simple random sample given the sample size and confidence level.

# Arguments
- `N::Int`: The sample size (number of observations) as an integer.
- `confidence_level::Float64`: The confidence level as a float. Default is 0.95 (95% confidence).

# Returns
- `::Float64`: The margin of error as a float.

# Supported Confidence Levels
- 0.90 (90% confidence)
- 0.95 (95% confidence)
- 0.975 (97.5% confidence)
- 0.99 (99% confidence)

# Formula
The margin of error is calculated using the following formula:
```math
MOE = z * \\sqrt{\\frac{p(1-p)}{N}}
"""
function intrinsic_margin_of_error(N::Int, confidence_level::Float64 = 0.95)
    if confidence_level == 0.90
        z = 1.645
    elseif confidence_level == 0.95
        z = 1.96
    elseif confidence_level == 0.975
        z = 2.24
    elseif confidence_level == 0.99
        z = 2.576
    else
        error("Unsupported confidence level. Supported levels: 0.90, 0.95, 0.975, 0.99.")
    end

    p = 0.5  # Assume maximum variability (p = 0.5)
    moe = z * sqrt((p * (1 - p)) / N)
    
    return moe
end

moe = intrinsic_margin_of_error