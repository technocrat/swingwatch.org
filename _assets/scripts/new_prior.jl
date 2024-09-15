#include("first_posterior_forepart.jl")
using BSON: @load, @save
using CSV
using DataFrames
using Format
using GLMakie
using KernelDensity
using LinearAlgebra
using MCMCChains
using Missings
using PrettyTables
using Printf
using Serialization
using Statistics
using Turing
#------------------------------------------------------------------
const FLAGRED  = "rgb(178,  34,  52)"
const FLAGBLUE = "rgb( 60,  59, 110)"
const PURPLE   = "rgb(119,  47,  81)"
const GREENBAR = "rgb( 47, 119,  78)"
const LORANGE  = "rgb(225, 170, 110)"
#------------------------------------------------------------------

# Define the model

@model function election_model(num_votes::Int64, num_wins::Int64)
    p ~ Beta(225, 225)
    num_wins ~ Binomial(num_votes, p)
end

sampler     = NUTS(0.65)
num_samples = 30000
num_chains  =     4
poll_size   = 3500  # Typical poll size
num_votes   = poll_size
num_wins    = poll_size ÷ 2
init_params = [Dict(:p => 0.5) for _ in 1:num_chains]


# margins   = CSV.read("../objs/margins.csv", DataFrame)
# margin    = first(margins[margins.st .== ST, :pct])

chain     = sample(election_model(num_votes, num_wins), sampler, 
                   num_samples, init_params=init_params)

p_intv    = quantile(chain[:p], [0.025, 0.975])
p_mean    = summarystats(chain)[1, :mean]
p_mcse    = summarystats(chain)[1, :mcse]
p_rhat    = summarystats(chain)[1, :rhat]
p_df      = DataFrame(median = median(chain[:p]),
                      mean   = mean(chain[:p]),
                      mode   = mode(chain[:p]),
                      q025   = p_intv[1],
                      q975   = p_intv[2],
                      mcse   = summarystats(chain)[1, :mcse],
                      rhat   = summarystats(chain)[1, :rhat])

p_samples  = chain[:p]
p_vec      = vec(p_samples)
kde_result = kde(p_vec)


# include("first_posterior_aftpart.jl")

posterior_interval = p_intv
fig                = draw_density()
deep               = deepcopy(chain)

@save ("new_prior.bson") deep
save(("../img/models/$ST" * "_new_prior.png"), fig)

out       = Vector(p_df[1,:])
out       = round.(out,digits = 4)
p_df[1,:] = out
pretty_table(p_df,backend=Val(:html), show_subheader = false)

