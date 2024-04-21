using LinearAlgebra
using StatsPlots
using Turing

const MON          = "mar"
const DESIGN_ERROR = 0.012

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

function normalize_poll(poll::Poll)
  total            = poll.biden_support + poll.trump_support
  normalized_biden = poll.biden_support / total
  normalized_trump = poll.trump_support / total
  return NormalizedPoll(normalized_biden, normalized_trump, poll.sample_size)
end

# Define the states and their electoral votes

states          = ["PA", "MI", "GA", "NC", "AZ", "WI", "NV"]
electoral_votes = [20, 15, 16, 16, 11, 10, 6]

prior_probs = Dict(
  "AZ" => 1672143 / (1672143 + 1661686),
  "GA" => 2473633 / (2473633 + 2461854),
  "MI" => 2804040 / (2804040 + 2649852),
  "NC" => 2684292 / (2684292 + 2758775),
  "PA" => 3458229 / (3458229 + 3377674),
  "WI" => 1630866 / (1630866 + 1610184),
  "NV" =>  703486 / ( 703486 +  669890)
)

# Define the state_polls dictionary

state_polls = Dict(
"PA" => [Poll(0.40, 0.46, 1305), Poll(0.45, 0.45, 807), Poll(0.56, 0.46, 520)],
"MI" => [Poll(0.41, 0.45, 1218), Poll(0.45, 0.45, 778), Poll(0.56, 0.46, 1097)],
"GA" => [Poll(0.43, 0.44, 788), Poll(0.48, 0.51, 1133), Poll(0.42, 0.46, 520)],
"NC" => [Poll(0.43, 0.49, 699), Poll(0.42, 0.45, 829), Poll(0.48, 0.51, 1295)],
"AZ" => [Poll(0.43, 0.48, 796), Poll(0.43, 0.47, 1000), Poll(0.45, 0.50, 600)],
"WI" => [Poll(0.46, 0.45, 697), Poll(0.44, 0.46, 1000), Poll(0.45, 0.46, 600)],
"NV" => [Poll(0.44, 0.46, 447), Poll(0.49, 0.51, 1000), Poll(0.48, 0.44, 600)]
)

# Normalize the state_polls dictionary

normalized_state_polls = Dict{String, Vector{NormalizedPoll}}()

for (state, polls) in state_polls
  normalized_polls = [normalize_poll(poll) for poll in polls]
  normalized_state_polls[state] = normalized_polls
end

# Define the model

@model function election_model(normalized_state_polls, prior_probs)

# Assign prior probabilities to each state based on relative votes

state_probs = Vector{Float64}(undef, length(states))
  for i in 1:length(states)
    state          = states[i]
    prior_prob     = prior_probs[state]
    state_probs[i] ~ Beta(prior_prob * 10, (1 - prior_prob) * 10)
  end
# Return the state probabilities
  return state_probs
end

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

model = election_model(normalized_state_polls, prior_probs)
chain = sample(model, NUTS(), 1_000)

# Extract the posterior samples
p_samples = Array(chain)

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

