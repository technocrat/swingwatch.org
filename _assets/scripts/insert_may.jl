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
end

@enum State PA GA NC MI AZ WI NV

struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int
end
# 

@load "../objs/apr_polls.bson" months

months[may][AZ][bl2] = [Poll(44,49, 795)]
months[may][GA][bl2] = [Poll(44,47, 795)]
months[may][MI][bl3] = [Poll(40,44, 704)]
months[may][NC][bl2] = [Poll(42,49, 704)]
months[may][WI][bl2] = [Poll(46,47, 693)]
months[may][NV][bl2] = [Poll(47,47, 459)]
months[may][PA][bl2] = [Poll(46,48, 812)]
months[may][AZ][ec2] = [Poll(42,49, 626)]
months[may][GA][ec2] = [Poll(39,49, 604)]
months[may][MI][ec2] = [Poll(36,38, 616)]
months[may][NV][ec2] = [Poll(38,50, 614)]
months[may][PA][ec2] = [Poll(44,47,1023)]
months[may][WI][ec2] = [Poll(47,45, 614)]
months[may][NC][hp2] = [Poll(43,48,1002)]
months[may][WI][qi2] = [Poll(50,44,1497)]
months[may][AZ][si2] = [Poll(42,49, 626)]
months[may][GA][si2] = [Poll(39,49, 604)]
months[may][MI][si3] = [Poll(36,38, 616)]
months[may][NV][si2] = [Poll(38,50, 614)]
months[may][PA][si2] = [Poll(44,47,1023)]
months[may][WI][si2] = [Poll(47,45, 614)]


# needs to be done manually rather than with include()
#@save "../objs/may_polls.bson" months


