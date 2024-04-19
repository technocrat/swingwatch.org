using Turing

# Define the model
@model function ternary_trial(data, p_estimate)
    # Assign prior probabilities to the sub-elements
    p ~ arraydist([Uniform(lb, ub) for (lb, ub) in p_estimate])

    # Calculate the likelihoods
    L_win  = prod(p; init=1.0)
    L_lose = prod(1 .- p; init=1.0)
    L_tie  = 1 - L_win - L_lose

    # Observe the data
    data ~ Categorical([L_win, L_lose, L_tie])
end

# Observed data
data = [fill(1, 38); fill(2, 84); fill(3, 5)]

# Estimated win probabilities in each state
p_estimate = [(488808426596445 - 0.0027, 488808426596445 + 0.0027),
              (43/86 - 0.05, 43/86 + 0.05),
              (41/87 - 0.05, 41/87 + 0.05),
              (43/92 - 0.05, 43/92 + 0.05),
              (43/91 - 0.05, 43/91 + 0.05),
              (45/91 - 0.05, 45/91 + 0.05),
              (44/90 - 0.05, 44/90 + 0.05)]

# Run the inference
model = ternary_trial(data, p_estimate)
chain = sample(model, NUTS(), 1000)

# Extract the posterior samples
p_samples = chain[:p]

# Calculate the posterior probabilities
P_win_given_data  = mean(prod.(eachrow(p_samples)))
P_lose_given_data = mean(prod.(1 .- eachrow(p_samples)))
P_tie_given_data  = 1 - P_win_given_data - P_lose_given_data

# Print the updated probabilities
println("Updated probabilities:")
println("P(win|data)  = ", P_win_given_data)
println("P(lose|data) = ", P_lose_given_data)
println("P(tie|data)  = ", P_tie_given_data)
