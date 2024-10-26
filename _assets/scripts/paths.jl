using Combinatorics

states = ["Pennsylvania", "Georgia", "North Carolina", "Michigan", "Arizona", "Wisconsin", "Nevada"]
votes = [19, 16, 16, 15, 11, 10, 6]

# Function to find combinations of some number n of 
# states with sum ≥ target votes
function find_state_combinations(n, states=states, votes=votes, target=44)
    result_combos = []  
    # Get all possible combinations of n indices
    for combo in combinations(1:length(states), 3)
        vote_sum = sum(votes[i] for i in combo)
        if vote_sum >= target
            state_combo = states[collect(combo)]
            push!(result_combos, (state_combo, vote_sum))
        end
    end
    return sort(result_combos, by=x->x[2], rev=true)
end

# Find and display combinations with 44 or more votes
state_combos = find_state_combinations(3)  

println("Combinations of three states with 44 or more electoral votes:")
for (states, total) in state_combos
    println("$(join(states, ", ")) = $total electoral votes")
end