using DataFrames
using PrettyTables

# Initial setup
const blue_initial = 226
const states = ["PA", "GA", "NC", "MI", "AZ", "WI", "NV"]
const votes = [19, 16, 16, 15, 11, 10, 6]

struct VoteState
    blue::Int
    path::Vector{String}
    VoteState(blue::Int, path::Vector{String} = String[]) = new(blue, path)
end

import Base: ==, hash
==(a::VoteState, b::VoteState) = a.blue == b.blue && a.path == b.path
hash(a::VoteState, h::UInt) = hash(a.blue, hash(a.path, h))

function generate_winning_paths()
    initial_state = VoteState(blue_initial)
    state_to_index = Dict{VoteState, Int}()
    state_to_index[initial_state] = 1
    
    winning_states = Set{VoteState}()
    
    function explore_state(current_state, remaining_states, remaining_votes)
        if current_state.blue ≥ 270
            push!(winning_states, current_state)
            return
        end
        
        if current_state.blue + sum(remaining_votes) < 270
            return
        end
        
        for (i, (state, votes)) in enumerate(zip(remaining_states, remaining_votes))
            new_path = copy(current_state.path)
            push!(new_path, state)
            new_state = VoteState(current_state.blue + votes, new_path)
            
            if !haskey(state_to_index, new_state)
                state_to_index[new_state] = length(state_to_index) + 1
            end
            
            if new_state.blue ≥ 270
                push!(winning_states, new_state)
            else
                next_remaining_states = [remaining_states[1:i-1]..., remaining_states[i+1:end]...]
                next_remaining_votes = [remaining_votes[1:i-1]..., remaining_votes[i+1:end]...]
                explore_state(new_state, next_remaining_states, next_remaining_votes)
            end
        end
    end
    
    explore_state(initial_state, states, votes)
    return winning_states
end

# Generate the paths
winning_states = generate_winning_paths()

# Create DataFrame
paths_df = DataFrame(
    Path = [join(state.path, " → ") for state in sort(collect(winning_states), by=s->length(s.path))],
    FinalVotes = [state.blue for state in sort(collect(winning_states), by=s->length(s.path))]
)

# Sort by number of states in path (shorter paths first) and then by final votes
paths_df.NumStates = length.(split.(paths_df.Path, " → "))
sort!(paths_df, [:NumStates, :FinalVotes])
select!(paths_df, Not(:NumStates))  # Remove the helper column

# Display first few rows
println("\nFirst few winning paths:")
first(paths_df, 10)

pretty_table(paths_df,backend=Val(:html),show_subheader = false)

df = sort!(paths_df,[:Path,:FinalVotes])