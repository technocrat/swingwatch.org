# intake.jl
# preprocess source data from https://www.wikiwand.com/en/2020_United_States_presidential_election#Results_by_state 2024-03-16

using CSV

votes 	   = CSV.read("./data/votes.csv", DataFrame)[2:57,:][:,[1,2,4,5,7]]
votes[:,1] = elec
new_names  = ["state","biden_pop","biden_col","trump_pop","trump_col"]
rename!(votes, new_names)

elec			   =  [
    "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA",
    "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME","ME1", "ME2","MD",
    "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NE1", "NE2", "NE3", "NV", "NH", 
    "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
    "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"
]

pop      		       = replace.(votes[:,[2,4]], "," => "")
pop[!, :biden_pop] = parse.(Int64, pop[:, :biden_pop])
pop[!, :trump_pop] = parse.(Int64, pop[:, :trump_pop])
col 			         = replace.(votes[:,[3,5]], "–" => 0)
col[!, :biden_col] = parse.(Int64, col[:, :biden_col])
col[!, :trump_col] = parse.(Int64, col[:, :trump_col])
result 			       = hcat(pop,col)
result    		     = hcat(elec,result)
new_names 		     = ["state","biden_pop","biden_col","trump_pop","trump_col"]
result.margin 	   = result.biden_pop - result.trump_pop

rename!(votes, new_names)
CSV.write("./objs/2020vote.csv",result)
