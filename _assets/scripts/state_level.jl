include("bayes_head.jl")
function filter_empty_entries(dict::Dict{Pollster, Vector{Poll}})
    return Dict(poll=> polls for (poll, polls) in dict if !isempty(polls))
end

this_month  = BSON.load("../objs/mar_polls.bson")

println("Set MO and ST")
MO = mar
# ST = PA
# ST = GA
# ST = NC
# ST = MI
# ST = AZ
# ST = WI
# ST = NV

ST = AZ

current_mon = filter_empty_entries(this_month[MO][ST])

# println("then include(bayes_main.jl")
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

