 find popular votes for all candidates in swing STATES
# for purpose of applying a finite population correction factor
# BUT only in the event of a sample so large as to represent
# MORE than 5% of the population; this possibly could be
# used to assess a large random sample of the previous
# election as a Bayesian prior—see note
using CSV
using DataFrames
  
const STATES  = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]

votes = CSV.read("../data/votes.csv", DataFrame)[2:57,:]
votes = votes[:,[1,20]]
votes = replace.(votes[:,[1,2]], "," => "")
votes = rename(votes,["state","total"])
  elec                           =  [
   "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA",
   "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME","ME1", "ME2","MD",
   "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NE1", "NE2", "NE3", "NV", "NH",
   "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
   "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"
  ]
votes[:,1] = elec
votes[!, :total] = parse.(Int64, votes[:, :total])


votes = filter(row -> row.state in STATES, votes)

CSV.write("../objs/swing_all_totals.csv",votes)
