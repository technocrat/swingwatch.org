# base = CSV.read("./objs/2020vote.csv", DataFrame)

# Fetch the CSV electoral_votes_by_state from the Gist URL
# csv_electoral_votes_by_state = HTTP.get(gist_url).body

# Read the CSV electoral_votes_by_state into a DataFrame
base = CSV.read(IOBuffer(csv_electoral_votes_by_state), DataFrame)


electoral_votes_by_state = Dict(
    "Arizona"        => base[3,7],
    "Georgia"        => base[11,7],
    "Wisconsin"      => base[55,7],
    "Michigan"       => base[25,7],
    "Nevada"         => base[34,7],
    "North Carolina" => base[39,7],
    "Pennsylvania"   => base[44,7]
)

"""
vote_margin_by_state = Dict(
    "Arizona"        => base[3,6],
    "Georgia"        => base[11,6],
    "Wisconsin"      => base[55,6],
    "Michigan"       => base[25,6],
    "Nevada"         => base[34,6],
    "North Carolina" => base[39,6],
    "Pennsylvania"   => base[44,6]
)
"""

swing_col = collect(values(electoral_votes_by_state))
# swing_pop = collect(values(vote_margin_by_state))
# subtract the number of swing states' electoral votes
blue      = sum(base.biden_col) - sum(collect(swing_col))
red       = sum(base.trump_col) - sum(collect(swing_col))
biden_win = victory - blue
trump_win = victory - blue
target    = impass
results   = find_combinations(IMPASS)

# Function to process each element of updated_results
function process_result(vec, key)
    state_names = join(vec, ", ")
    state_count = length(vec)
    state_sum   = sum(electoral_votes_by_state[state] for state in vec)
    margin_sum  = sum(electoral_votes_by_state[state] for state in vec)
    return (key = key, st = state_names, count = state_sum, num_states =     
           state_count, votes = margin_sum)
end

# Create a vector that maps indices to state names
state_mapping = collect(keys(electoral_votes_by_state))

# Function to replace values in a vector with corresponding state names
function replace_with_states(vec)
    return [join(state_mapping[v]) for v in vec]
end

# Create a new named tuple with updated values
updated_results = (map(replace_with_states, results[1]),
                   map(replace_with_states, results[2]), 
                   map(replace_with_states, results[3]))

"""
# Apply process_result function to each element of updated_results with separate keys
outcome_electoral_votes_by_state = vcat(
    x ,
    process_result.(updated_results[2], "tie"),
    process_result.(updated_results[3], "win")
)
"""

# Create the outcome electoral_votes_by_state from the processed electoral_votes_by_state
outcome       = DataFrame(outcome_electoral_votes_by_state)
outcome.biden = outcome.count .+ blue
outcome.trump = college .- outcome.biden
outcome.electoral = outcome.biden .+ outcome.trump
outcome.check = if(outcome.electoral .- college == 0, true)
                else false
                end
all(outcome.check .== true)
sort!(outcome,:count)

 

# Function to determine the result based on the value of `biden`
function determine_result(biden_value)
    if biden_value    == 269
        return "tie"
    elseif biden_value < 269
        return "Trump"
    else
        return "Harris"
    end
end

# Apply the function to each row of the electoral_votes_by_state and create the `result` column
outcome.result = determine_result.(outcome.biden)

# Ensure the `result` column is of type String
outcome.result = string.(outcome.result)

# The `outcome` DataFrame now has a new column `result` with the appropriate values
