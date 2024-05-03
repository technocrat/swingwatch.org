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
@load "../objs/mar_Polls.bson" months

months[apr][AZ][bl2] = [Poll(43,49, 801)]
months[apr][AZ][ec2] = [Poll(44,48,1000)]
months[apr][GA][bl2] = [Poll(45,47, 802)]
months[apr][GA][ec2] = [Poll(44,47,1000)]
months[apr][GA][fo2] = [Poll(45,51,1128)]
months[apr][MI][bi2] = [Poll(43,51, 708)]
months[apr][MI][ec2] = [Poll(44,45,1000)]
months[apr][MI][fo2] = [Poll(46,49,1106)]
months[apr][MI][mr2] = [Poll(46,42, 600)]
months[apr][NC][ec2] = [Poll(42,47,1000)]
months[apr][NC][bl2] = [Poll(41,51, 703)]
months[apr][NC][ma2] = [Poll(43,49, 645)]
months[apr][NC][qi2] = [Poll(46,48,1401)]
months[apr][NV][ec2] = [Poll(44,45,1000)]
months[apr][PA][bi2] = [Poll(46,47, 803)]
months[apr][PA][ec2] = [Poll(45,47,1000)]
months[apr][WI][bl2] = [Poll(44,48, 703)]
months[apr][WI][ec2] = [Poll(45,47,1000)]
@save "../objs/apr_polls.bson" months

#@load "../objs/apr_polls.bson" months
