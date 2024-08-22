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

@enum Month mar apr may jul jul2 aug1 aug2 sep oct nov

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
    cj
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
    ny2
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


@load "../objs/jul2_polls.bson" months

months[aug1][AZ][ny2] = [Poll(49,45,677)]
months[aug1][AZ][tr] = [Poll(47,48,1000)]
months[aug1][GA][ny2] = [Poll(44,51,661)]
months[aug1][MI][tr] = [Poll(49,47,800)]
months[aug1][NC][cj] = [Poll(44,47,600)]
months[aug1][NV][tr] = [Poll(45,49,1000)]
months[aug1][NV][ny2] = [Poll(42,45,677)]
months[aug1][PA][ec2] = [Poll(47,47,1000)]
months[aug1][PA][tr] = [Poll(44,46,1000)]
months[aug1][PA][qi2] = [Poll(48,45,1738)]
months[aug1][WI][tr] = [Poll(48,49,800)]




# needs to be done manually rather than with include()
#@save "../objs/aug1_polls.bson" months


