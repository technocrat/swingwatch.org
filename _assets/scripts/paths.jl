using Combinatorics
states = ["Pennsylvania", "Georgia", "North Carolina", "Michigan", "Arizona", "Wisconsin", "Nevada"]
votes  = [19, 16, 16, 15, 11, 10, 6]
"""
    find_state_combinations(n, states=states, votes=votes, target=44)

Finds all combinations of `n` states where the total number of votes meets or exceeds a specified `target`.

**Parameters**:

- `n` (`Int`): The number of states to include in each combination.
- `states` (`Array{String}`): An array of state names.
- `votes` (`Array{Int}`): An array of vote counts corresponding to each state.
- `target` (`Int`, default = 44): The minimum total votes required for a combination to be included.

**Returns**:

- `result_combos` (`Array`): A sorted array of tuples, each containing:
  - `state_combo` (`Array{String}`): The names of the states in the combination.
  - `vote_sum` (`Int`): The total votes for that combination.

The results are sorted in descending order based on the total votes (`vote_sum`).

**Example**:

```julia
using Combinatorics

states = ["State1", "State2", "State3", "State4"]
votes = [10, 20, 15, 5]
n = 2
target = 25

combinations = find_state_combinations(n, states=states, votes=votes, target=target)
println(combinations)
# Output:
# [(["State2", "State3"], 35)]
Notes:

All possible combinations of n states are considered.
Ensure that states and votes are arrays of the same length.
This function requires the Combinatorics package. Make sure to include using Combinatorics before calling the function.
"""

function find_state_combinations(n=n, states=states, votes=votes, target=target)
    result_combos = []  
    # Get all possible combinations of n indices
    for combo in combinations(1:length(states), n)
        vote_sum = sum(votes[i] for i in combo)
        if vote_sum >= target
            state_combo = states[collect(combo)]
            push!(result_combos, (state_combo, vote_sum))
        end
    end
    return sort(result_combos, by=x->x[2], rev=true)
end

target = 44
n      =  5
state_combos = find_state_combinations()  
println("Combinations of three states with $target or more electoral votes:")
for (states, total) in state_combos
    println("$(join(states, ", ")) = $total electoral votes")
end
