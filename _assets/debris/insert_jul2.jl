using BSON: @save, @load
using CSV
using DataFrames
using LinearAlgebra
using PrettyTables
using Printf
using Serialization
using Statistics
using StatsPlots
using Turing

@enum Month mar apr may jul jul2 aug1 aug2 sep1 sep2 oct1 oct2 nov fin

@enum Pollster begin
    ag
    aj
    am
    bi2
    bi3
    bl2
    bl3
    cb2
    cb3
    cn2
    cn3
    ea
    ec2
    ec3
    ep
    eu
    fm2
    fm3
    fo2
    fo3
    hi2
    hi3
    hp
    ia
    ma2
    ma3
    mi2
    mi3
    mq
    mr2
    mr3
    ns
    pp
    ny
    qi2
    qi3
    rr
    si2
    si3
    sp2
    sp3
    su2
    su3
    tr
    wa2
    wa3
    ws
    wsl
    wss
    yg
end

@enum State PA GA NC MI AZ WI NV

struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int64
end


@load "../objs/jul_polls.bson" months

months[jul2][AZ][bl2] = [Poll(48,47,804)]
months[jul2][AZ][ec2] = [Poll(44,49,800)]
months[jul2][GA][bl2] = [Poll(47,47,799)]
months[jul2][GA][ec2] = [Poll(46,48,800)]
months[jul2][MI][bl2] = [Poll(53,42,706)]
months[jul2][MI][ec2] = [Poll(45,46,800)]
months[jul2][MI][fo2] = [Poll(43,45,1012)]
months[jul2][NC][bl2] = [Poll(46,48,706)]
months[jul2][NV][bl2] = [Poll(47,45,454)]
months[jul2][PA][bl2] = [Poll(46,50,804)]
months[jul2][PA][fo2] = [Poll(45,43,1034)]
months[jul2][PA][am]  = [Poll(45,47,600)]
months[jul2][PA][ec2] = [Poll(46,48,850)]
months[jul2][WI][bl2] = [Poll(49,47,700)]
months[jul2][WI][ec2] = [Poll(47,47,854)]
months[jul2][WI][fo2] = [Poll(46,46,1046)]

# needs to be done manually rather than with include()
@save "../objs/jul2_polls.bson" months


