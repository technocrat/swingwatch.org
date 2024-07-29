using BSON: @save, @load
using LinearAlgebra
using PrettyTables
using Printf
using Serialization
using Statistics
using StatsPlots
using Turing

# const DESIGN_ERROR = .

@enum Month mar apr may jun   jul aug sep oct nov

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


@load "../objs/jun_polls.bson" months

months[jul][AZ][bl2] = [Poll(45,48,781)]
months[jul][AZ][ec2] = [Poll(40,50,1000)]
months[jul][AZ][ia] = [Poll(44,49,800)]
months[jul][AZ][pp] = [Poll(43,51,596)]
months[jul][AZ][yg] = [Poll(37,44,900)]
months[jul][GA][bl2] = [Poll(41,43,790)]
months[jul][GA][ec2] = [Poll(48,41,1000)]
months[jul][GA][ia] = [Poll(42,48,800)]
months[jul][GA][yg] = [Poll(40,44,1000)]
months[jul][MI][bl3] = [Poll(45,39,694)]
months[jul][MI][ec3] = [Poll(42,45,1000)]
months[jul][MI][ep] = [Poll(36,42,600)]
months[jul][MI][tr] = [Poll(43,45,1059)]
months[jul][MI][yg] = [Poll(40,42,1000)]
months[jul][NC][bl3] = [Poll(42,40,696)]
months[jul][NC][ec3] = [Poll(41,48,1000)]
months[jul][NC][yg] = [Poll(40,44,1000)]
months[jul][NV][bl3] = [Poll(39,45,452)]
months[jul][NV][ec3] = [Poll(40,56,1000)]
months[jul][NV][ia] = [Poll(42,49,800)]
months[jul][NV][yg] = [Poll(42,46,800)]
months[jul][PA][bl2] = [Poll(44,51,794)]
months[jul][PA][ia] = [Poll(45,49,800)]
months[jul][PA][yg] = [Poll(40,43,1000)]
months[jul][PA][ec2] = [Poll(43,48,1000)]
months[jul][PA][ny] = [Poll(43,47,1000)]
months[jul][WI][bl2] = [Poll(47,44,695)]
months[jul][WI][ec2] = [Poll(43,48,1000)]
months[jul][WI][ia] = [Poll(47,47,546)]
months[jul][WI][ns] = [Poll(44,46,600)]
months[jul][WI][yg] = [Poll(39,43,900)]


# needs to be done manually rather than with include()
#@save "../objs/jul_pre_polls.bson" months


