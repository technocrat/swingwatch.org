using BSON: @save, @load
using LinearAlgebra
using PrettyTables
using Printf
using Serialization
using Statistics
using StatsPlots
using Turing

# const DESIGN_ERROR = 0.012

@enum Month mar apr may jun jul aug sep oct nov

@enum Pollster begin
    ag2
    aj2
    am2
    bi2
    bi3
    bl2
    bl3
    cb2
    cb3
    cn2
    cn3
    ea2
    ec2
    ec3
    ep2
    eu2
    fm2
    fm3
    fo2
    fo3
    hi2
    hi3
    hp2
    ma2
    ma3
    mi2
    mi3
    mq2
    mr2
    mr3
    ny2
    qi2
    qi3
    rr2
    si2
    si3
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

@load "../objs/may_polls.bson" months

months[jun][AZ][ag2] = [Poll(42,48, 600)]
months[jun][AZ][ec2] = [Poll(43,47,1000)]
months[jun][AZ][fo2] = [Poll(46,51,1095)]
months[jun][AZ][rr2] = [Poll(47,40, 750)]
months[jun][GA][aj2] = [Poll(38,43,1000)]
months[jun][GA][ec2] = [Poll(41,45,1000)]
months[jun][GA][qi2] = [Poll(44,40,1203)]
months[jun][MI][ec2] = [Poll(43,46,1000)]
months[jun][NC][eu2] = [Poll(43,48,1332)]
months[jun][NV][ec2] = [Poll(43,46,1000)]
months[jun][NV][fo2] = [Poll(45,50,1069)]
months[jun][PA][ec2] = [Poll(45,47,1000)]
months[jun][WI][ec2] = [Poll(44,47,1000)]
months[may][AZ][am2] = [Poll(42,48, 600)]
months[may][AZ][ec2] = [Poll(43,47,1000)]
months[may][AZ][rr2] = [Poll(42,47, 750)]
months[may][GA][aj2] = [Poll(38,43,1000)]
months[may][GA][ec2] = [Poll(41,45, 604)]
months[may][MI][ec2] = [Poll(49,51,1000)]
months[may][MI][ep2] = [Poll(45,49, 600)]
months[may][MI][mi2] = [Poll(45,46, 697)]
months[may][NC][ea2] = [Poll(43,48,1332)]
months[may][NV][ec2] = [Poll(39,41,1000)]
months[may][NV][fo2] = [Poll(45,50,1000)]
months[may][PA][ec2] = [Poll(45,47,1000)]
months[may][WI][ec2] = [Poll(42,44,1000)]
months[may][WI][mq2] = [Poll(50,50, 811)]


# needs to be done manually rather than with include()
#@save "../objs/jun_polls.bson" months


