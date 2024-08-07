@enum State PA GA NC MI AZ WI NV
@enum Month mar apr may jun jul jul2 aug sep oct
#------------------------------------------------------------------
STATE       = State
prior_month = "jul"
mon         = jul2
MON         = "jul2"
Mon         = "jul2"
st          = "NV"
ST          =  NV
#------------------------------------------------------------------
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
#------------------------------------------------------------------
struct Poll
    biden_support::Float64
    trump_support::Float64
    sample_size::Int64
end
#------------------------------------------------------------------
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
#------------------------------------------------------------------
Month_names = Dict(
	"mar" => "March",
	"apr" => "April",
	"may" => "May",
	"jun" => "June",
	"jul" => "July",
	"jul2" => "July-post",
	"aug" => "August",
	"sep" => "September",
	"oct" => "October")
#------------------------------------------------------------------
const states   = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]
const FLAGRED  = "rgb(178,  34,  52)"
const FLAGBLUE = "rgb( 60,  59, 110)"
const PURPLE   = "rgb(119,  47,  81)"
const GREENBAR = "rgb( 47, 119,  78)"
const LORANGE  = "rgb(225, 170, 110)"
#------------------------------------------------------------------
function draw_density()
    # Create a new figure with specified resolution
    fig = Figure(size = (600, 400))
    
    # Add an axis to the figure
    ax = Axis(fig[1, 1], xlabel = "Likelihood of Harris win", ylabel = "Number of draws", title = "Model: Harris results in $ST from 2020 election and polling through " * Month_names[Mon])
        # Plot the full density curve
    lines!(ax, kde_result.x, kde_result.density, color = "#a3b35c", linewidth = 3, strokewidth = 4, strokecolor = GREENBAR, label = "Draws")
    
    # Find the indices corresponding to the posterior interval
    indices = findall((posterior_interval[1] .<= kde_result.x) .& (kde_result.x .<= posterior_interval[2]))
    
    # Extract the x and y values within the posterior interval
    x_region = kde_result.x[indices]
    y_region = kde_result.density[indices]
    
    # Fill the specific area under the curve
    band!(ax, x_region, fill(0, length(x_region)), y_region, color = (LORANGE), label = "Credible Interval")
    
    # Find the y-value corresponding to the specified x-value
    y_value = kde_result.density[argmin(abs.(kde_result.x .- margin))]
    
    # Add a vertical line at the specified x-value from 0 to the y-value
    vlines!(ax, [margin], [0, y_value], color = FLAGBLUE, linestyle = :dash, linewidth = 4, label = "2020 Actual")
    
    # Add a legend to the plot
    axislegend(ax)
    
    # Adjust the plot limits to fit the density line
    Makie.xlims!(ax, extrema(p_vec))
    Makie.ylims!(ax, 0, nothing)
    
    # Display the figure
    fig
end
#------------------------------------------------------------------
function process_polls(polls::Vector{Poll})
    result = Int64.(collect(collect([(p.biden_support, p.sample_size) for p in polls])[1]))
    return [Int64(floor(result[1] / 100 * result[2])), result[2]]
end
#------------------------------------------------------------------
function remove_empties(the_month::Dict) 
  Dict(state => Dict(pollster => polls for (pollster, polls) in pollsters 
  if !isempty(polls)) for (state, pollsters) in the_month)
end
#------------------------------------------------------------------
# Define the new model with additional binomial uncertainty
@model function updated_model(y, n)
    # Use the existing chain as a prior for p
    p ~ Normal(mean(p_prior_flat), std(p_prior_flat))
    
    # Ensure p is within [0, 1]
    p_clamped = clamp(p, 0, 1)
    
    # Add additional binomial uncertainty
    q ~ Beta(2, 2)  # Weakly informative prior for additional uncertainty
    
    # Ensure the final probability is within [0, 1]
    prob = clamp(q * p_clamped, 0, 1)
    
    # Likelihood
    y ~ Binomial(n, prob)
end
#------------------------------------------------------------------
margins    = CSV.read("../objs/margins.csv", DataFrame)
@load "../objs/"*"$MON"*"_polls.bson" months
prior_poll = BSON.load("../objs/"*"$st"*"_"*"$prior_month"*"_p_sample.bson")
#------------------------------------------------------------------
margin        = first(margins[margins.st .== st, :pct])
current_month = remove_empties(months[mon])
#------------------------------------------------------------------
# Extract the relevant data from the existing chain
prior_chain = prior_poll[:deep]
p_prior     = Array(prior_chain[:p])
# Total results of current polls
processed_polls        = Dict(state    => 
                         Dict(pollster => 
                         process_polls(polls) for (pollster, polls) in pollsters) 
                         for (state, pollsters) in current_month)

processed_polls_totals = Dict(state      => 
                         Dict("num_wins" => 
                         sum(first(values(polls)) for polls in values(pollsters)),
                         "num_votes"     => 
                         sum(last(values(polls)) for polls in values(pollsters)))
                         for (state, pollsters) in processed_polls)

num_wins               = processed_polls_totals[ST]["num_wins"]
num_votes              = processed_polls_totals[ST]["num_votes"]
#------------------------------------------------------------------
# Create a kernel density estimate of the prior
# Flatten p_prior to a vector
p_prior_flat = vec(p_prior)

# Create the new model instance
new_model = updated_model(num_wins, num_votes)

# Sample from the new model to create an updated posterior
chain = sample(new_model, NUTS(), 10000)

# Now 'chain' contains your reset posterior, which you can use as a prior for future analyses
#------------------------------------------------------------------
# poll_posterior         = prior_poll
# 
# posterior_mean         = mean(poll_posterior[:deep][:p])
# posterior_var          = var(poll_posterior[:deep][:p])
# prior_alpha            = posterior_mean * 
#                         (posterior_mean * (1 - posterior_mean) / posterior_var - 1)
# prior_beta             = (1 - posterior_mean) * (posterior_mean *
#                          (1 - posterior_mean) / posterior_var - 1)
# prior_dist             = Beta(prior_alpha, prior_beta)
# 
# model                  = poll_model(num_votes, num_wins, prior_dist)
# sampler                = NUTS(0.65)
# num_samples            = 10000
# num_chains             = 4
# init_params            = [Dict(:p => 0.5)]
# chain                  = sample(poll_model(num_votes, num_wins, prior_dist), 
#                          sampler, num_samples, init_params=init_params)
                         
p_intv = quantile(chain[:p], [0.025, 0.975])
p_mean = summarystats(chain)[1,:mean]
p_mcse = summarystats(chain)[1,:mcse]
p_rhat = summarystats(chain)[1,:rhat]
p_df   = DataFrame(median = median(chain[:p]),
                   mean   = mean(chain[:p]),
                   mode   = mode(chain[:p]),
                   q025   = p_intv[1],
                   q975   = p_intv[2],
                   mcse   = summarystats(chain)[1,:mcse],
                   rhat   = summarystats(chain)[1,:rhat])

p_samples  = chain[:p]
p_vec      = vec(p_samples)
kde_result = kde(p_vec)

deep = deepcopy(chain)

posterior_interval = p_intv
fig                = draw_density()

out       = Vector(p_df[1,:])
out       = round.(out,digits = 4)
p_df[1,:] = out
pretty_table(p_df,backend=Val(:html),show_subheader = false)
chain
summarystats(chain)
autocor(chain)
hpd(chain)
#------------------------------------------------------------------
save(("../img/models/"*"$st"*"_"*"$mon"*".png"), fig)
@save ("../objs/"*"$st"*"_"*"$mon"*"_p_sample.bson") deep
