include("libr.jl")
mon         = "sep2"
MON         = "sep2"
Mon         = "sep2"

st                   = "AZ"
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainAZ              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "GA"
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainGA              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "MI"
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainMI              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "NC"
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainNC              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "NV"
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainNV              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "PA"
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainPA              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "WI"
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainWI              = deep[:deep][:p]
#------------------------------------------------------------------

# Assuming you have 7 chains named chain1, chain2, ..., chain7
samples = [chainAZ, chainGA, chainMI, chainNC, chainNV, chainPA, chainWI]
state_names = ["AZ","GA","MI","NC","NV","PA", "WI"]

# Calculate individual probabilities

individual_probs = [mean(sample .> 0.5) for sample in samples]

# 3. Correlation Analysis
corr_matrix = cor(hcat(samples...))

# 4. Pairwise Joint Probabilities
function pairwise_joint_prob(samples1, samples2)
    return mean((samples1 .> 0.5) .& (samples2 .> 0.5))
end

pairwise_probs = [pairwise_joint_prob(samples[i], samples[j]) 
                  for i in 1:7 for j in i+1:7]

# 5. Monte Carlo for All 7 States
all_states_prob = mean(all(x -> x > 0.5, hcat(samples...); dims=2))

# 6. Subset Analysis
function subset_prob(samples, k)
    return mean(sum(x -> x > 0.5, hcat(samples...); dims=2) .>= k)
end

subset_probs = [subset_prob(samples, k) for k in 1:7]

# Visualization
p1 = Plots.heatmap(corr_matrix, title="State Correlation Heatmap", 
             xticks=(1:7, state_names), yticks=(1:7, state_names))

p2 = Plots.bar(state_names, individual_probs, title="Individual State Probabilities", 
         ylabel="Probability > 0.5")

p3 = Plots.plot(1:7, subset_probs, title="Probability of k or more states > 0.5", 
          xlabel="k", ylabel="Probability", marker=:circle)

Plots.plot(p1, p2, p3, layout=(3,1), size=(800,1200))

# Print results
println("Individual state probabilities:")
for (state, prob) in zip(state_names, individual_probs)
    println("  $state: $(round(prob, digits=3))")
end

println("\nProbability of all 7 states > 0.5: $(round(all_states_prob, digits=3))")

println("\nSubset probabilities:")
for k in 1:7
    println("  $k or more states > 0.5: $(round(subset_probs[k], digits=3))")
end