using BSON: @load, @save
using BSON
using Colors
using Combinatorics
using CSV
using DataFrames
using Distributions
using Format
using HTTP
using GLMakie
using KernelDensity
using LinearAlgebra
using MCMCChains
using Missings
using PlotlyJS
using Plots
using PrettyTables
using Printf
using Serialization
using Statistics
using StatsPlots
using Turing

# 
# struct Poll
#     question::String
#     response::String
# end

@enum State PA GA NC MI AZ WI NV
STATE = State
@enum Month mar apr may jun jul jul2 aug1 aug2 sep1 sep2 oct1 oct2 fin
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
    us
    wa2
    wa3
    ws
    wsl
    wss
    yg
end

prior_month = "sep1"
mon         =  sep2
MON         = "sep2"
Mon         = "sep2"
st          = "AZ"
ST          =  AZ

#@load "../objs/jul_polls.bson" months
margins = CSV.read("../objs/margins.csv", DataFrame)
margin  = first(margins[margins.st .== st, :pct])
include("polls_head.jl")
#prior_poll = BSON.load("../objs/"*"$st"*"_"*"$prior_month"*"_p_sample.bson")
prior_poll = BSON.load("../objs/new_prior.bson")
#@load "../objs/"*"$MON"*"_polls.bson" months # comes up empty
margin  = first(margins[margins.st .== st, :pct])

#current_month = remove_empties(months[mon])
# 
include("polls_foot.jl")


