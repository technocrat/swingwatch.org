include("libr.jl")
mon                  = "oct2"
MON                  = "oct2"
Mon                  = "oct2"

st                   = "AZ"
deep                 = BSON.load("objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainAZ              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "GA"
deep                 = BSON.load("objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainGA              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "MI"
deep                 = BSON.load("objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainMI              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "NC"
deep                 = BSON.load("objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainNC              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "NV"
deep                 = BSON.load("objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainNV              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "PA"
deep                 = BSON.load("objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainPA              = deep[:deep][:p]
#------------------------------------------------------------------
st                   = "WI"
deep                 = BSON.load("objs/$st" * "_" *"$mon" * "_p_sample.bson")
chainWI              = deep[:deep][:p]
#------------------------------------------------------------------

samples     = [chainAZ, chainGA, chainMI, chainNC, chainNV, chainPA, chainWI]
state_names = ["AZ","GA","MI","NC","NV","PA", "WI"]

individual_probs = [mean(sample .> 0.5) for sample in samples]
corr_matrix = cor(hcat(samples...))
"""
    pairwise_joint_prob(samples1, samples2)

Calculates the joint probability that both elements in `samples1` and `samples2` exceed a threshold of 0.5 at corresponding positions.

**Parameters**:
- `samples1`: An array of numerical samples.
- `samples2`: An array of numerical samples of the same length as `samples1`.

**Returns**:
- `probability` (`Float64`): The proportion of sample pairs where both `samples1[i]` and `samples2[i]` are greater than 0.5.

**Example**:
```julia
samples1 = rand(10000)
samples2 = rand(10000)
prob = pairwise_joint_prob(samples1, samples2)
println("Joint probability of both samples exceeding 0.5: ", prob)
Notes:

Both samples1 and samples2 must be arrays of equal length.
The function performs an element-wise comparison and logical AND operation to determine where both samples exceed the threshold.
The threshold is fixed at 0.5; modify the function if a different threshold is needed.
""" 
function pairwise_joint_prob(samples1, samples2)
    return mean((samples1 .> 0.5) .& (samples2 .> 0.5))
end

pairwise_probs = [pairwise_joint_prob(samples[i], samples[j]) 
                  for i in 1:7 for j in i+1:7]

all_states_prob = mean(all(x -> x > 0.5, hcat(samples...); dims=2))


"""
    subset_prob(samples, k)

Calculates the proportion of instances where at least `k` out of the provided sample arrays have values exceeding a threshold of 0.5 at corresponding indices.

**Parameters**:
- `samples`: A collection (e.g., a list or array) of numerical sample arrays. Each sample array should be of equal length.
- `k` (`Int`): The minimum number of samples that must exceed the threshold at each index.

**Returns**:
- `probability` (`Float64`): The proportion of indices where at least `k` samples have values greater than 0.5.

**Example**:
```julia
# Generate sample data
samples1 = rand(10000)
samples2 = rand(10000)
samples3 = rand(10000)

# Calculate the probability that at least 2 out of 3 samples exceed 0.5
prob = subset_prob([samples1, samples2, samples3], 2)
println("Probability that at least 2 samples exceed 0.5: ", prob)
Notes:

All sample arrays in samples must be of equal length.
The function performs an element-wise comparison across all sample arrays.
The threshold is fixed at 0.5. Modify the function if a different threshold is needed.
This function is useful for estimating the probability of at least k successes in multiple trials.
""" 
function subset_prob(samples, k)
    return mean(sum(x -> x > 0.5, hcat(samples...); dims=2) .>= k)
end

subset_probs = [subset_prob(samples, k) for k in 1:7]

p1 = Plots.heatmap(corr_matrix, title="State Correlation Heatmap", 
             xticks=(1:7, state_names), yticks=(1:7, state_names))

p2 = Plots.bar(state_names, individual_probs, title="Individual State Probabilities", 
         ylabel="Probability > 0.5")

p3 = Plots.plot(1:7, subset_probs, title="Likelihood of Harris winning k or more states > 0.5", 
          xlabel="k", ylabel="Likelihood", marker=:circle, legend = false)

Plots.plot(p3)

println("Individual state likelihood:")
for (state, prob) in zip(state_names, individual_probs)
    println("  $state: $(round(prob, digits=3))")
end

println("\nLikelihood of all 7 states > 0.5: $(round(all_states_prob, digits=3))")

println("\nSubset Likelihood:")
for k in 1:7
    println("  $k or more states > 0.5: $(round(subset_probs[k], digits=3))")
end

Plots.savefig(p3, "../img/joint.png")
