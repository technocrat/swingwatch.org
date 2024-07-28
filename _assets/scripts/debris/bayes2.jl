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
add_poll!(mar, AZ, ec2, Poll(44., 48., 1000))
add_poll!(mar, AZ, ws2, Poll(44., 47., 600))
add_poll!(mar, GA, bl2, Poll(42., 49., 788))
add_poll!(mar, GA, cb2, Poll(48., 51., 1133))
add_poll!(mar, GA, ec2, Poll(42., 46., 1000))
add_poll!(mar, GA, ws2, Poll(43., 44., 600))
add_poll!(mar, MI, bi2, Poll(42., 45., 1218))
add_poll!(mar, MI, bl2, Poll(44., 46., 447))
add_poll!(mar, MI, cn2, Poll(42., 50., 1097))
add_poll!(mar, MI, ec2, Poll(44., 45., 1000))
add_poll!(mar, MI, qi2, Poll(45., 48., 1487))
add_poll!(mar, MI, sp2, Poll(44., 48., 709))
add_poll!(mar, MI, ws2, Poll(45., 48., 600))
add_poll!(mar, NC, bl2, Poll(43., 49., 699))
add_poll!(mar, NC, hi2, Poll(38., 44., 1016))
add_poll!(mar, NC, ma2, Poll(48., 51., 1295))
add_poll!(mar, NC, mi2, Poll(44., 47., 626))
add_poll!(mar, NC, ws2, Poll(43., 49., 600))
add_poll!(mar, NV, bl2, Poll(43., 49., 699))
add_poll!(mar, NV, ws2, Poll(44., 48., 600))
add_poll!(mar, PA, bi2, Poll(40., 46., 1305))
add_poll!(mar, PA, bl2, Poll(45., 45., 807))
add_poll!(mar, PA, cn2, Poll(46., 46., 1132))
add_poll!(mar, PA, ec2, Poll(43., 45., 1000))
add_poll!(mar, PA, fm2, Poll(48., 38., 431))
add_poll!(mar, PA, fo2, Poll(45., 49., 1121))
add_poll!(mar, PA, wa2, Poll(45., 50., 736))
add_poll!(mar, PA, ws2, Poll(44., 47., 600))
add_poll!(mar, WI, bl2, Poll(46., 45., 697))
add_poll!(mar, WI, ws2, Poll(46., 46., 600))

function filter_empty_entries(dict::Dict{Pollster, Vector{NormalizedPoll}})
    return Dict(pollster => polls for (pollster, polls) in dict if !isempty(polls))
end

# Create a new dictionary of dictionaries with non-empty NormalizedPoll objects
filtered_months = Dict(state => filter_empty_entries(subject[state]) for state in instances(State))



