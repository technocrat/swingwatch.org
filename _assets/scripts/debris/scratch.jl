using BSON

const MON = "mar"
const DESIGN_ERROR = 0.012

struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int
end

polls = Dict{String, Dict{String, Vector{Poll}}}()

function add_poll!(structure, month, state, poll)
    if !haskey(structure, month)
        structure[month] = Dict{String, Vector{Poll}}()
    end
    if !haskey(structure[month], state)
        structure[month][state] = Vector{Poll}()
    end
    push!(structure[month][state], poll)
end

state_polls = Dict(
    "pa" => [  # all 2-way
        Poll(0.40, 0.46, 1305),  # bi
        Poll(0.45, 0.45, 807),   # bl
        Poll(0.56, 0.46, 520),   # cn
        Poll(0.50, 0.50, 1000),  # ec
        Poll(0.43, 0.47, 1000),  # fm
        Poll(0.43, 0.47, 600)    # wsj
    ],
    "ga" => [  # all 2-way
        Poll(0.43, 0.44, 788),   # bl
        Poll(0.48, 0.51, 1133),  # cb
        Poll(0.42, 0.46, 520),   # ec
        Poll(0.47, 0.51, 1283),  # ma
        Poll(0.40, 0.45, 600)    # ws
    ],
    "mi" => [  # all 2-way
        Poll(0.41, 0.45, 1218),  # bi
        Poll(0.45, 0.45, 778),   # bl
        Poll(0.56, 0.46, 1097),  # cn
        Poll(0.44, 0.46, 1000),  # ec
        Poll(0.44, 0.48, 1487),  # qi
        Poll(0.43, 0.48, 709),   # sp
        Poll(0.45, 0.48, 600)    # ws
    ],
    "nc" => [  # all 2-way
        Poll(0.43, 0.49, 699),   # bl
        Poll(0.42, 0.45, 829),   # hp
        Poll(0.48, 0.51, 1295),  # ma
        Poll(0.46, 0.48, 1401),  # qi
        Poll(0.45, 0.48, 600)    # ws
    ],
    "az" => [  # all 2-way
        Poll(0.43, 0.48, 796),   # bl
        Poll(0.43, 0.47, 1000),  # ec
        Poll(0.45, 0.50, 600)    # ws
    ],
    "wi" => [  # all 2-way
        Poll(0.46, 0.45, 697),   # bl
        Poll(0.44, 0.46, 1000),  # ec
        Poll(0.45, 0.46, 600)    # ws
    ],
    "nv" => [  # all 2-way
        Poll(0.44, 0.46, 447),   # bl
        Poll(0.49, 0.51, 1000),  # ec
        Poll(0.48, 0.44, 600)    # ws
    ]
)

for (state, state_polls) in state_polls
    for poll in state_polls
        add_poll!(polls, MON, state, poll)
    end
end

# BSON.bson("mar_polls.bson",state_polls)

const DESIGN_ERROR = 0.012

function margin_of_error(sample_size)
    sqrt(0.5 * 0.5 / sample_size) + DESIGN_ERROR
end

function weighted_average(polls, candidate)
    sum(
        getfield(poll, candidate) * poll.sample_size / (margin_of_error(poll.sample_size)^2)
        for poll in polls
    ) / sum(
        poll.sample_size / (margin_of_error(poll.sample_size)^2)
        for poll in polls
    )
end

function aggregate_margin_of_error(polls)
    total_sample_size = sum(poll.sample_size for poll in polls)
    sqrt(
        sum(
            (margin_of_error(poll.sample_size)^2) * (poll.sample_size / total_sample_size)^2
            for poll in polls
        )
    ) * 1.96
end

for (state, polls) in state_polls
    println("State: $state")
    
    biden_weighted_avg = weighted_average(polls, :biden_support)
    trump_weighted_avg = weighted_average(polls, :trump_support)
    aggregate_moe      = aggregate_margin_of_error(polls)
    
    println("Aggregated Biden support: $(round(biden_weighted_avg * 100, digits=2))% ± $(round(aggregate_moe * 100, digits=2))%")
    println("Aggregated Trump support: $(round(trump_weighted_avg * 100, digits=2))% ± $(round(aggregate_moe * 100, digits=2))%")
    println()
end