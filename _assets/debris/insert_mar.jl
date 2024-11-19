using BSON
using LinearAlgebra
using PrettyTables
using Printf
using Serialization
using Statistics
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

const current_mon = Dict(mar => Dict(), apr => Dict(), may => Dict(), jun => Dict(), jul => Dict(), aug => Dict(), sep => Dict(), oct => Dict(), nov => Dict())

# Initialize the nested dictionaries for each state within each month
for month in instances(Month)
    for state in instances(State)
        months[month][state] = Dict{Pollster, Vector{Poll}}()
        for pollster in instances(Pollster)
            months[month][state][pollster] = Poll[]
        end
    end
end


months[mar][AZ][bl2] = [Poll(42, 49, 788)]
months[mar][AZ][ec2] = [Poll(44, 48, 1000)]
months[mar][AZ][ws2] = [Poll(44, 47,  600)]
months[mar][GA][bl2] = [Poll(42, 49,  788)]
months[mar][GA][cb2] = [Poll(48, 51, 1133)]
months[mar][GA][ec2] = [Poll(42, 46, 1000)]
months[mar][GA][ws2] = [Poll(43, 44,  600)]
months[mar][MI][bi2] = [Poll(42, 45, 1218)]
months[mar][MI][bl2] = [Poll(44, 46,  447)]
months[mar][MI][cn2] = [Poll(42, 50, 1097)]
months[mar][MI][ec2] = [Poll(44, 45, 1000)]
months[mar][MI][qi2] = [Poll(45, 48, 1487)]
months[mar][MI][sp2] = [Poll(44, 48,  709)]
months[mar][MI][ws2] = [Poll(45, 48,  600)]
months[mar][NC][bl2] = [Poll(43, 49,  699)]
months[mar][NC][hi2] = [Poll(38, 44, 1016)]
months[mar][NC][ma2] = [Poll(48, 51, 1295)]
months[mar][NC][mi2] = [Poll(44, 47,  626)]
months[mar][NC][ws2] = [Poll(43, 49,  600)]
months[mar][NV][bl2] = [Poll(43, 49,  699)]
months[mar][NV][ws2] = [Poll(44, 48,  600)]
months[mar][PA][bi2] = [Poll(40, 46, 1305)]
months[mar][PA][bl2] = [Poll(45, 45,  807)]
months[mar][PA][cn2] = [Poll(46, 46, 1132)]
months[mar][PA][ec2] = [Poll(43, 45, 1000)]
months[mar][PA][fm2] = [Poll(48, 38,  431)]
months[mar][PA][fo2] = [Poll(45, 49, 1121)]
months[mar][PA][wa2] = [Poll(45, 50,  736)]
months[mar][PA][ws2] = [Poll(44, 47,  600)]
months[mar][WI][ws2] = [Poll(46, 46,  600)]
months[mar][WI][bl2] = [Poll(46, 45,  697)]


using BSON: @save, @load

#@save "../objs/mar_polls.bson" months

#@load "../objs/mar_polls.bson" months