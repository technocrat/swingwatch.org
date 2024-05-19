using DataFrames
using LinearAlgebra
using PrettyTables
using Printf
using Serialization
using Statistics
using StatsPlots
using Turing

const DESIGN_ERROR = 0.012

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
    ma2
    ma3
    mi2
    mi3
    mr2
    mr3
    qi2
    qi3
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


const months = Dict(mar => Dict(), apr => Dict(), may => Dict(), jun => Dict(), jul => Dict(), aug => Dict(), sep => Dict(), oct => Dict(), nov => Dict())

prior_probs = Dict(
  AZ => 1672143 / (1672143 + 1661686),
  GA => 2473633 / (2473633 + 2461854),
  MI => 2804040 / (2804040 + 2649852),
  NC => 2684292 / (2684292 + 2758775),
  PA => 3458229 / (3458229 + 3377674),
  WI => 1630866 / (1630866 + 1610184),
  NV =>  703486 / ( 703486 +  669890)
)


prior_probs = Dict(
  AZ => 1672143 / (1672143 + 1661686),
  GA => 2473633 / (2473633 + 2461854),
  MI => 2804040 / (2804040 + 2649852),
  NC => 2684292 / (2684292 + 2758775),
  PA => 3458229 / (3458229 + 3377674),
  WI => 1630866 / (1630866 + 1610184),
  NV =>  703486 / ( 703486 +  669890)
)