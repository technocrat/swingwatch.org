# draft calculator for allocation of campaign effort
using Combinatorics

function optimal_betting_strategy(target_tokens, wagers)
    # Initialize the dynamic programming table
    dp = zeros(Int, target_tokens + 1)
    dp[1] = 1

    # Initialize the combinations array
    combinations = [[] for _ in 0:target_tokens]

    # Iterate over each wager
    for wager in wagers
        new_dp = zeros(Int, target_tokens + 1)
    
    # Iterate over the possible number of tokens
    for tokens in 0:target_tokens
        if dp[tokens + 1] > 0
            # Update the dynamic programming table based on the wager
            if tokens + wager[1] <= target_tokens
                new_dp[tokens + wager[1] + 1] += dp[tokens + 1] * wager[2]
                push!(combinations[tokens + wager[1] + 1], [(wager[3], wager[2])])
            end
            if tokens - wager[1] >= 0
                new_dp[tokens - wager[1] + 1] += dp[tokens + 1] * (100 - wager[2])
                push!(combinations[tokens - wager[1] + 1], [(wager[3], 100 - wager[2])])
            end
        end
    end
    
        dp = new_dp
    end

    return combinations
end

# Define the wagers (using integer probabilities and wager names)
wagers = [(1, 50, "MN"), (1, 50, "NC"), (1, 50, "ME"), (2, 50, "NV")]

# Calculate the optimal betting strategy
target_tokens = 26
combos = optimal_betting_strategy(target_tokens, wagers)

# Print all combinations of wagers that can reach the target
println("Combinations of wagers that can reach the target:")
for combo in combos[end]
    println("Combination:")
    for (wager, probability) in combo
        println("  Wager: $wager, Probability: $(probability)%")
    end
    println()
end