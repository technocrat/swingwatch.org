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

@enum Month mar apr may jul jul2 aug1 hyp sep oct nov

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


@load "../objs/aug2_polls.bson" months

months[hyp][AZ][bl2] = [Poll(60,40,805)]
months[hyp][AZ][ec2] = [Poll(60,40,720)]
months[hyp][AZ][fo2] = [Poll(60,40,1014)]
months[hyp][AZ][ia]  = [Poll(60,40,800)]
months[hyp][AZ][cn2] = [Poll(60,40,800)]

months[hyp][GA][bl2] = [Poll(54,46,801)]
months[hyp][GA][ec2] = [Poll(54,36,800)]
months[hyp][GA][fo2] = [Poll(44,36,1014)]
months[hyp][GA][ia]  = [Poll(53,47,800)]
months[hyp][MI][bl2] = [Poll(54,46,702)]
months[hyp][MI][ec2] = [Poll(55,45,800)]
months[hyp][MI][ep]  = [Poll(49,30,600)]
months[hyp][MI][tr]  = [Poll(52,48,1089)]
months[hyp][NC][bl2] = [Poll(55,45,803)]
months[hyp][NC][ec2] = [Poll(53,47,775)]
months[hyp][NC][eu]  = [Poll(52,48,720)]
months[hyp][NC][fo2] = [Poll(54,46,999)]
months[hyp][NC][ia]  = [Poll(53,47,800)]
months[hyp][NV][bl2] = [Poll(54,46,700)]
months[hyp][NV][ec2] = [Poll(44,46,1168)]
months[hyp][NV][fo2] = [Poll(54,46,1026)]
months[hyp][NV][ia]  = [Poll(53,48,800)]
months[hyp][PA][bl2] = [Poll(56,44,803)]
months[hyp][PA][ec2] = [Poll(53,47,950)]
months[hyp][PA][tr]  = [Poll(50,50,1087)]
months[hyp][WI][tr]  = [Poll(51,49,1083)]



# needs to be done manually rather than with include()
#@save "../objs/hyp_polls.bson" months # comes out empty


