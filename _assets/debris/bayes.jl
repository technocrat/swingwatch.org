using LinearAlgebra
using Serialization
using StatsPlots
using Turing

const DESIGN_ERROR = 0.012

@enum Month mar apr may jun jul aug sep oct nov

@enum Pollster begin
    bi2
    bi3
    bl2
    bl3
    cb2
    cb3
    cn2
    cn3
    ec2
    ec3
    fm2
    fm3
    fo2
    fo3
    hi2
    hi3
    ma2
    ma3
    mi2
    mi3
    mr2
    mr3
    qi2
    qi3
    sp2
    sp3
    su2
    su3
    wa2
    wa3
    ws2
    ws3l
    ws3s
end

@enum State PA GA NC MI AZ WI NV

struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int
end

struct NormalizedPoll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int
end

const months = Dict(mar => Dict(), apr => Dict(), may => Dict(), jun => Dict(), jul => Dict(), aug => Dict(), sep => Dict(), oct => Dict(), nov => Dict())

# Initialize the nested dictionaries for each state within each month
for month in instances(Month)
    for state in instances(State)
        months[month][state] = Dict{Pollster, Vector{NormalizedPoll}}()
        for pollster in instances(Pollster)
            months[month][state][pollster] = NormalizedPoll[]
        end
    end
end
"""
   normalize_poll(poll::Poll)

Normalizes the poll results for Harris and Trump by dividing their respective support values
by the total support, and returns a `NormalizedPoll` object with the normalized values and sample size.

# Arguments
- `poll::Poll`: A `Poll` object containing the raw poll data, including `biden_support`, `trump_support`, and `sample_size` fields.

# Returns
- `NormalizedPoll`: A `NormalizedPoll` object with the following fields:
   - `normalized_biden::Float64`: The normalized support for Harris (between 0 and 1).
   - `normalized_trump::Float64`: The normalized support for Trump (between 0 and 1).
   - `sample_size::Int64`: The sample size of the poll.

# Notes
- This function assumes that the `Poll` object has fields named `biden_support`, `trump_support`, and `sample_size`.
- The normalization is performed by dividing the `biden_support` and `trump_support` values by the total support (sum of `biden_support` and `trump_support`).
- The normalized values represent the proportion of support for each candidate out of the total support.
- The `NormalizedPoll` object is created with the normalized values and the original `sample_size`.

# Examples
```julia
# Assuming there is a `Poll` object `poll` with fields `biden_support`, `trump_support`, and `sample_size`
"""
function normalize_polls!(month)
    for state in keys(months[month])
        for pollster in keys(months[month][state])
            for poll in months[month][state][pollster]
                total = poll.biden_support + poll.trump_support
                normalized_biden = poll.biden_support / total
                normalized_trump = poll.trump_support / total
                poll.biden_support = normalized_biden
                poll.trump_support = normalized_trump
            end
        end
    end
end

function add_poll!(month::Month, state::State, pollster::Pollster, poll::Poll)
    normalized_poll = NormalizedPoll(poll.biden_support, poll.trump_support, poll.sample_size)
    push!(months[month][state][pollster], normalized_poll)
end

add_poll!(mar, AZ, bl2, Poll(42., 49., 788))
add_poll!(mar, PA, bi2, Poll(40., 46., 1305))
add_poll!(mar, MI, bi2, Poll(42., 45., 1218))
add_poll!(mar, PA, bl2, Poll(45., 45., 807))
add_poll!(mar, GA, bl2, Poll(42., 49., 788))
add_poll!(mar, NC, bl2, Poll(43., 49., 699))
add_poll!(mar, MI, bl2, Poll(44., 46., 447))
add_poll!(mar, AZ, bl2, Poll(42., 49., 788))
add_poll!(mar, WI, bl2, Poll(46., 45., 697))
add_poll!(mar, NV, bl2, Poll(43., 49., 699))
add_poll!(mar, GA, cb2, Poll(48., 51., 1133))
add_poll!(mar, PA, cn2, Poll(46., 46., 1132))
add_poll!(mar, MI, cn2, Poll(42., 50., 1097))
add_poll!(mar, PA, ec2, Poll(43., 45., 1000))
add_poll!(mar, GA, ec2, Poll(42., 46., 1000))
add_poll!(mar, MI, ec2, Poll(44., 45., 1000))
add_poll!(mar, PA, fm2, Poll(48., 38., 431))
add_poll!(mar, PA, fo2, Poll(45., 49., 1121))
add_poll!(mar, NC, hi2, Poll(38., 44., 1016))
add_poll!(mar, NC, ma2, Poll(48., 51., 1295))
add_poll!(mar, NC, mi2, Poll(44., 47., 626))
add_poll!(mar, MI, qi2, Poll(45., 48., 1487))
add_poll!(mar, MI, sp2, Poll(44., 48., 709))
add_poll!(mar, PA, wa2, Poll(45., 50., 736))
add_poll!(mar, PA, ws2, Poll(44., 47., 600))
add_poll!(mar, GA, ws2, Poll(43., 44., 600))
add_poll!(mar, NC, ws2, Poll(43., 49., 600))
add_poll!(mar, MI, ws2, Poll(45., 48., 600))
add_poll!(mar, AZ, ws2, Poll(44., 47., 600))
add_poll!(mar, WI, ws2, Poll(46., 46., 600))
add_poll!(mar, NV, ws2, Poll(44., 48., 600))

# Define the states and their electoral votes

#states         = ["PA", "MI", "GA", "NC", "AZ", "WI", "NV"]
electoral_votes = [19, 15, 16, 16, 11, 10, 6]

prior_probs = Dict(
  "AZ" => 1672143 / (1672143 + 1661686),
  "GA" => 2473633 / (2473633 + 2461854),
  "MI" => 2804040 / (2804040 + 2649852),
  "NC" => 2684292 / (2684292 + 2758775),
  "PA" => 3458229 / (3458229 + 3377674),
  "WI" => 1630866 / (1630866 + 1610184),
  "NV" =>  703486 / ( 703486 +  669890)
)

function get_state_polls(month::Month)
    state_polls = Dict{State, Vector{PollData}}()
    for state in instances(State)
        polls = PollData[]
        for pollster in instances(Pollster)
            if haskey(master_polls.data, pollster) &&
               haskey(master_polls.data[pollster], month) &&
               haskey(master_polls.data[pollster][month].data, state)
                poll_data = master_polls.data[pollster][month].data[state][1]
                if !ismissing(poll_data.biden_support) && !ismissing(poll_data.trump_support) && !ismissing(poll_data.sample_size)
                    push!(polls, poll_data)
                end
            end
        end
        if !isempty(polls)
            state_polls[state] = polls
        end
    end
    return state_polls
end

state_polls_mar = get_state_polls(mar)



# Define the model
# 
# @model function election_model(normalized_state_polls, prior_probs)
#     # Define the model parameters
#     state_probs = Dict(state => Uniform(0, 1) for state in keys(normalized_state_polls))
# 
#     # Define the likelihood
#     for (state, polls) in normalized_state_polls
#         for poll in polls
#             biden_support = poll.biden_support
#             trump_support = poll.trump_support
#             sample_size = poll.sample_size
#             
#             # Likelihood of the poll data given the state probability
#             biden_count = round(Int, biden_support * sample_size)
#             biden_count ~ Binomial(sample_size, state_probs[state])
#         end
#     end
# 
#     # Define the prior
#     for (state, prior_prob) in prior_probs
#         state_probs[state] ~ Beta(prior_prob, 1 - prior_prob)
#     end
# 
#     # Return the state probabilities
#     return state_probs
# end

# # Assign prior probabilities to each state based on relative votes
# 
# state_probs = Vector{Float64}(undef, length(states))
#   for i in 1:length(states)
#     state          = states[i]
#     prior_prob     = prior_probs[state]
#     state_probs[i] ~ Beta(prior_prob * 10, (1 - prior_prob) * 10)
#   end
# # Return the state probabilities
#   return state_probs
# end

function outcome_probability(combination)
  prob = 1.0
  for i in 1:length(states)
    if combination[i] == 1
      prob *=     mean(p_samples[:, i])
    else
      prob *= 1 - mean(p_samples[:, i])
    end
  end
  return prob
end

# Run the inference

# INDIFFERENT
@model function election_model(normalized_state_polls, prior_probs)
    # Define the model parameters
    state_probs = Dict(state => Uniform(0, 1) for state in keys(normalized_state_polls))

    # Define the likelihood
    for (state, polls) in normalized_state_polls
        for poll in polls
            biden_support = poll.biden_support
            trump_support = poll.trump_support
            sample_size = poll.sample_size
            
            # Sample the state probability from the Uniform distribution
            state_prob = rand(state_probs[state])
            
            # Likelihood of the poll data given the state probability
            biden_count = round(Int, biden_support * sample_size)
            biden_count ~ Binomial(sample_size, state_prob)
        end
    end

    # Define the prior
    for (state, prior_prob) in prior_probs
        state_probs[state] ~ Beta(prior_prob, 1 - prior_prob)
    end

    # Return the state probabilities
    return state_probs
end

@model function election_model(normalized_state_polls, prior_probs)
    # Define the model parameters
    state_probs = Dict(state => Uniform(0, 1) for state in keys(normalized_state_polls))

    # Define the likelihood
    for (state, polls) in normalized_state_polls
        for poll in polls
            biden_support = poll.biden_support
            trump_support = poll.trump_support
            sample_size = poll.sample_size
            
            # Sample the state probability from the Uniform distribution
            state_prob = rand(state_probs[state])
            
            # Likelihood of the poll data given the state probability
            biden_count = round(Int, biden_support * sample_size)
            biden_count ~ Binomial(sample_size, state_prob)
        end
    end

    # Define the prior
    for (state, prior_prob) in prior_probs
        state_probs[state] ~ Beta(prior_prob, 1 - prior_prob)
    end

    # Return the state probabilities directly
    return state_probs
end

chain = sample(election_model(normalized_state_polls, prior_probs), NUTS(), MCMCThreads(), num_samples, num_chains)

# Extract the posterior samples
posterior_samples = chain[:state_probs]

# Calculate the posterior probabilities
global post_win = 0.0
global post_lose = 0.0

for combination in Iterators.product(fill(0:1, length(states))...)
    combination_vector = collect(combination)
    if dot(combination_vector, electoral_votes) >= 45 # 270 - 225 BLUE
        global post_win += outcome_probability(combination_vector) 
    else
        global post_lose += outcome_probability(combination_vector) 
    end
end

post_tie = 1 - post_win - post_lose

println("Posterior probabilities:")
println("Win: ",  post_win)
println("Lose: ", post_lose)
println("Tie: ",  post_tie)
println("Sum: ",  sum([post_win, post_lose, post_tie]))

# diagnostics

summarystats(chain)
plot(chain)
autocor(chain)
ess(chain)



# Column names to round
columns_to_round = [:votes, :low, :mean, :high, :expect]

# Apply rounding using column names
for col_name in columns_to_round
    df[!, col_name] = round.(df[!, col_name], digits = 2)
end
