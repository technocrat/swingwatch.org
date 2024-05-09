using BSON: @save, @load
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
# 

@load "../objs/apr_polls.bson" months

"""
months[may][AZ][bl2] = [Poll(43,49, 801)]
months[may][AZ][ec2] = [Poll(44,48,1000)]
months[may][GA][bl2] = [Poll(45,47, 802)]
months[may][GA][ec2] = [Poll(44,47,1000)]
months[may][GA][fo2] = [Poll(45,51,1128)]
months[may][MI][bi2] = [Poll(43,51, 708)]
months[may][MI][ec2] = [Poll(44,45,1000)]
months[may][MI][fo2] = [Poll(46,49,1106)]
months[may][MI][mr2] = [Poll(46,42, 600)]
months[may][NC][ec2] = [Poll(42,47,1000)]
months[may][NC][bl2] = [Poll(41,51, 703)]
months[may][NC][ma2] = [Poll(43,49, 645)]
months[may][NC][qi2] = [Poll(46,48,1401)]
months[may][NV][ec2] = [Poll(44,45,1000)]
months[may][PA][bi2] = [Poll(46,47, 803)]
months[may][PA][ec2] = [Poll(45,47,1000)]
months[may][WI][bl2] = [Poll(44,48, 703)]
months[may][WI][ec2] = [Poll(45,47,1000)]
"""
months[may][WI][qi2] = [Poll(50,44,1497)]

# @save "../objs/may_polls.bson" months


