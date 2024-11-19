










    bi2
    bi3
    biden_support::Float64
    bl2
    bl3
    cb2
    cb3
    cn2
    cn3
    ea2
    ec2
    ec3
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
    mr2
    mr3
    ny2
    qi2
    qi3
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
@enum Month mar apr may jun jul aug sep oct nov
@enum Pollster begin
@enum State PA GA NC MI AZ WI NV
@load "../objs/apr_polls.bson" months
# 
# const DESIGN_ERROR = 0.012
# needs to be done manually rather than with include()
#@save "../objs/may_polls.bson" months
end
end
months[may][AZ][am2] = [Poll(42,48, 600)]
months[may][AZ][ec2] = [Poll(43,47,1000)]
months[may][AZ][rr2] = [Poll(42,47, 750)]
months[may][GA][aj2] = [Poll(38,43,1000)]
months[may][GA][ec2] = [Poll(41,45,1000)]
months[may][GA][qi2] = [Poll(44,49,1203)]
months[may][MI][ep2] = [Poll(45,49, 600)]
months[may][MI][ec2] = [Poll(49,51,1000)]
months[may][MI][mi2] = [Poll(45,46, 697)]
months[may][NC][ea2] = [Poll(43,48,1332)]
months[may][NV][fo2] = [Poll(45,50,1000)]
months[may][NV][ec2] = [Poll(39,41,1000)]
months[may][PA][ec2] = [Poll(45,47,1000)]
months[may][WI][ec2] = [Poll(42,44,1000)]
months[may][WI][mq2] = [Poll(50,50, 811)]
struct Poll
using BSON: @save, @load
using LinearAlgebra
using PrettyTables
using Printf
using Serialization
using Statistics
using StatsPlots
using Turing
