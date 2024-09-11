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
    harris_support::Float64
    trump_support::Float64
    sample_size::Int64
end


@load "../objs/aug1_polls.bson" months

months[aug2][AZ][bl2] = [Poll(48,48,805)]
months[aug2][AZ][ec2] = [Poll(47,50,720)]
months[aug2][AZ][fo2] = [Poll(50,49,1014)]
months[aug2][AZ][ia]  = [Poll(48,49,800)]
months[aug2][AZ][cn2] = [Poll(44,49,800)]
months[aug2][GA][bl2] = [Poll(49,47,801)]
months[aug2][GA][ec2] = [Poll(49,48,800)]
months[aug2][GA][fo2] = [Poll(49,49,1014)]
months[aug2][GA][ia]  = [Poll(48,48,800)]
months[aug2][MI][bl2] = [Poll(49,46,702)]
months[aug2][MI][ec2] = [Poll(50,47,800)]
months[aug2][MI][ep]  = [Poll(44,44,600)]
months[aug2][MI][tr]  = [Poll(47,47,1089)]
months[aug2][NC][bl2] = [Poll(50,45,803)]
months[aug2][NC][ec2] = [Poll(48,49,775)]
months[aug2][NC][eu]  = [Poll(47,48,720)]
months[aug2][NC][fo2] = [Poll(49,50,999)]
months[aug2][NC][ia]  = [Poll(48,49,800)]
months[aug2][NV][bl2] = [Poll(49,45,700)]
months[aug2][NV][ec2] = [Poll(49,48,1168)]
months[aug2][NV][fo2] = [Poll(50,48,1026)]
months[aug2][NV][ia]  = [Poll(47,48,800)]
months[aug2][PA][bl2] = [Poll(51,47,803)]
months[aug2][PA][ec2] = [Poll(48,48,950)]
months[aug2][PA][tr]  = [Poll(45,47,1087)]
months[aug2][WI][tr]  = [Poll(46,47,1083)]



# needs to be done manually rather than with include()
#@save "../objs/aug2_polls.bson" months # comes out empty


