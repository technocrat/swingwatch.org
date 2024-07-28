using BSON: @save, @load
using LinearAlgebra
using PrettyTables
using Printf
using Serialization
using Statistics
using StatsPlots
using Turing

# const DESIGN_ERROR = .

@enum Month mar apr may jul jul aug sep oct nov

@enum Pollster begin
    ag
    aj
    am
    bi
    bi
    bl
    bl
    cb
    cb
    cn
    cn
    ea
    ec
    ec
    ep
    eu
    fm
    fm
    fo
    fo
    hi
    hi
    hp
    ia
    ma
    ma
    mi
    mi
    mq
    mr
    mr
    ns
    pp
    ny
    qi
    qi
    rr
    si
    si
    sp
    sp
    su
    su
    tr
    wa
    wa
    ws
    wsl
    wss
    yg
end

@enum State PA GA NC MI AZ WI NV

struct Poll
    biden_support::Float
    trump_support::Float
    sample_size::Int
end


@load "../objs/jun_polls.bson" months

months[jul][AZ][bl] = [Poll(45,48,781)]
months[jul][AZ][ec] = [Poll(40,50,1000)]
months[jul][AZ][ia] = [Poll(44,49,800)]
months[jul][AZ][pp] = [Poll(43,51,596)]
months[jul][AZ][yg] = [Poll(37,44,900)]
months[jul][GA][bl] = [Poll(41,43,790)]
months[jul][GA][ec] = [Poll(48,41,1000)]
months[jul][GA][ia] = [Poll(42/,48,800)]
months[jul][GA][yg] = [Poll(40,44,1000)]
months[jul][MI][bl] = [Poll(45,39,694)]
months[jul][MI][ec] = [Poll(42,45,1000)]
months[jul][MI][ep] = [Poll(36,42,600)]
months[jul][MI][tr] = [Poll(43,45,1059)]
months[jul][MI][yg] = [Poll(40,42,1000)]
months[jul][NC][bl] = [Poll(42,40,696)]
months[jul][NC][ec] = [Poll(41,48,1000)]
months[jul][NC][yg] = [Poll(40,44,1000)]
months[jul][NV][bl] = [Poll(39,45,452)]
months[jul][NV][ec] = [Poll(40,56,1000)]
months[jul][NV][ia] = [Poll(42,49,800)]
months[jul][NV][yg] = [Poll(42,46,800)]
months[jul][PA][bl] = [Poll(44,51,794)]
months[jul][PA][ia] = [Poll(45,49,800)]
months[jul][PA][yg] = [Poll(40,43,1000)]
months[jul][PA][ec] = [Poll(43,48,1000)]
months[jul][PA][ny] = [Poll(43,47,1000)]
months[jul][WI][bl] = [Poll(47,44,695)]
months[jul][WI][ec] = [Poll(43,48,1000)]
months[jul][WI][ia] = [Poll(47,47,546)]
months[jul][WI][ns] = [Poll(44,46,600)]
months[jul][WI][yg] = [Poll(39,43,900)]


# needs to be done manually rather than with include()
#@save "../objs/jul_polls.bson" months


