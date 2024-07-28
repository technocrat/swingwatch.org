using BSON: @load
using CSV 
using DataFrames
include("election_priors.jl")
@enum Month mar apr may jun jul aug sep oct nov
@enum State PA GA NC MI AZ WI NV
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

struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int
end

@load "../objs/apr_polls.bson" months


function process_polls(polls::Vector{Poll})
    result = Int64.(collect(collect([(p.biden_support, p.sample_size) for p in polls])[1]))
    return [Int64(floor(result[1] / 100 * result[2])), result[2]]
end


processed_polls = Dict(state => Dict(pollster => process_polls(polls) for (pollster, polls) in pollsters) for (state, pollsters) in march)


processed_polls_totals = Dict(state => Dict(
    "num_wins" => sum(first(values(polls)) for polls in values(pollsters)),
    "num_votes" => sum(last(values(polls)) for polls in values(pollsters))
) for (state, pollsters) in processed_polls)


