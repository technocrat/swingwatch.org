const DESIGN_ERROR = 0.012


struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int
end

polls_structure = Dict{String, Dict{String, Vector{Poll}}}()

function add_poll!(structure, month, state, poll)
    if !haskey(structure, month)
        structure[month] = Dict{String, Vector{Poll}}()
    end
    if !haskey(structure[month], state)
        structure[month][state] = Vector{Poll}()
    end
    push!(structure[month][state], poll)
end

# Example Polls
polls = [
    Poll(0.40, 0.46, 1305),
    Poll(0.45, 0.45, 807),
    Poll(0.56, 0.46, 520),
    Poll(0.50, 0.50, 1000),    
    Poll(0.43, 0.47, 1000),
    Poll(0.48, 0.38, 431),
    Poll(0.43, 0.47, 1000),
    Poll(0.43, 0.47, 600)
]

# Assuming you have month and state information for each poll
# For demonstration, let's add them to "January" and "Washington"
for poll in polls
    add_poll!(polls_structure, "March", "Pennsylvania", poll)
end

# Serialize
# bson("savit.bson",polls_structure)
# 
function margin_of_error(sample_size)
    sqrt(0.5 * 0.5 / sample_size) + DESIGN_ERROR
end

polls = [
    Poll(0.40, 0.46, 1305),
    Poll(0.45, 0.45, 807),
    Poll(0.56, 0.46, 520),
    Poll(0.50, 0.50, 1000),    
    Poll(0.43, 0.47, 1000),
    Poll(0.48, 0.38, 431),
    Poll(0.43, 0.47, 1000),
    Poll(0.43, 0.47, 600)
]

total_sample_size = sum(poll.sample_size for poll in polls)

function weighted_average(polls, candidate)
    sum(
        getfield(poll, candidate) * poll.sample_size / (margin_of_error(poll.sample_size)^2)
        for poll in polls
    ) / sum(
        poll.sample_size / (margin_of_error(poll.sample_size)^2)
        for poll in polls
    )
end

biden_weighted_avg = weighted_average(polls, :biden_support)
trump_weighted_avg = weighted_average(polls, :trump_support)

function aggregate_margin_of_error(polls)
    sqrt(
        sum(
            (margin_of_error(poll.sample_size)^2) * (poll.sample_size / total_sample_size)^2
            for poll in polls
        )
    ) * 1.96
end

aggregate_moe = aggregate_margin_of_error(polls)

println("Aggregated Biden support: $(round(biden_weighted_avg * 100, digits=2))% ± $(round(aggregate_moe * 100, digits=2))%")
println("Aggregated Trump support: $(round(trump_weighted_avg * 100, digits=2))% ± $(round(aggregate_moe * 100, digits=2))%")