using CSV 
using DataFrames
const STATES   = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]

votes                  = CSV.read("../objs/2020vote.csv", DataFrame)
election_priors        = filter(row -> row.st in STATES, votes)
election_priors        = election_priors[:,[1,2,3]]
election_priors.tot    = election_priors.biden_pop .+ election_priors.trump_pop
election_priors        = election_priors[:,[:st,:biden_pop,:tot]]
rename!(election_priors,["st","num_wins","num_votes"])
# CSV.write("../objs/election_priors",election_priors)