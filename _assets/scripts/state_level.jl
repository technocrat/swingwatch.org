include("bayes_head.jl")

function filter_empty_entries(dict::Dict{Pollster, Vector{Poll}})
    return Dict(poll=> polls for (poll, polls) in dict if !isempty(polls))
end

using BSON: @save, @load
#@load "../objs/apr_polls.bson" months

MO = may
ST = WI

current_mon = filter_empty_entries(months[MO][ST])

include("bayes_main.jl")

prior_probs[ST]
# Summary statistics
summarystats(current_samples)

# Trace plot
plot(current_samples)

# Autocorrelation
autocor(current_samples)

# Effective sample size
ess(current_samples)

