# 2024 electoral college table
using CSV
using DataFrames
using PrettyTables

df = CSV.read("/Users/ro/projects/swingwatch/_assets/objs/college.csv", DataFrame)
t1 = df[:,[1,2]]
t2 = df[:,[3,4]]
t3 = df[:,[5,6]]
header = ["st","ev"]
rename!(t1, 1 => Symbol(header[1]), 2 => Symbol(header[2]))
rename!(t2, 1 => Symbol(header[1]), 2 => Symbol(header[2]))
rename!(t3, 1 => Symbol(header[1]), 2 => Symbol(header[2]))
df = vcat(t1,t2,t3)
# change ME to 2 and add ME1 and ME2 at one each
df[20,2] = 2
push!(df,("ME1",1))
push!(df,("ME2",1))
# change NB to 2 and add NE1, NE2, and NE3 at one each
df[28,2] = 2
push!(df,("NB1",1))
push!(df,("NB2",1))
push!(df,("NB3",1))
sort!(df,:st)

po = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC","FL", 
      "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME",
      "ME1", "ME2", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE",
      "NE1", "NE2", "NE3", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", 
      "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", 
      "VT", "VA", "WA", "WV", "WI", "WY"]
df = hcat(df,po)
new_swing = ["PA","GA","NC","MI","AZ","WI","NV"]
old_swing = ["PA","GA",     "MI","AZ","WI","NV"]

mask = [any(occursin(pattern, string) for pattern in old_swing) for string in df.x1]
new = df[:,[:x1,:ev]]
rename!(new, 1 => Symbol(header[1]), 2 => Symbol(header[2]))
sort!(new,:st)
old = df = CSV.read("/Users/ro/projects/swingwatch/_assets/objs/2020vote.csv", DataFrame)
new = innerjoin(old, new, on = :st)
new.old = new.biden_col + new.trump_col
new.chg = new.ev - new.old
change  = new[new.chg .!= 0,:]
losers  = new[new.chg .<0,:]
winners = new[new.chg .>0,:]
new.biden_col_adjust = ifelse.(new.biden_col .!= 0, new.biden_col .+ new.chg, new.biden_col)
new.trump_col_adjust = ifelse.(new.trump_col .!= 0, new.trump_col .+ new.chg, new.trump_col)

old_blue  = sum(new.biden_col)
old_red   = sum(new.trump_col)
new_blue  = sum(new.biden_col_adjust)
new_red   = sum(new.trump_col_adjust)

# Create a boolean mask for states not in old_swing
mask_out = .!in.(new.st, Ref(old_swing))
mask_in  = in.(new.st, Ref(old_swing))
mask_new = in.(new,st, Ref(new_swing))
# Calculate the sum of biden_col_adj excluding old_swing states
blue_start = new_blue - sum(new[mask_in, :biden_col_adjust])
# Subtract NC from trump_col_adj
red_start  = sum(new.trump_col_adjust) - new[30,:ev]
swing_voles = sum(new[mask_new,:ev])
votes  = new[:,[:st,:biden_pop,:trump_pop,:margin,:biden_col_adjust,:trump_col_adjust]]
header = ["st","biden_pop","trump_pop","margin","biden_col","trump_col"]

# Assume you have a DataFrame named 'df'
# and a vector of new column names called 'header'

# Create a dictionary to map old column names to new column names
name_dict = Dict(zip(names(votes), header))

# Rename the columns using the dictionary
rename!(votes, name_dict)

# CSV.write("/Users/ro/projects/swingwatch/_assets/objs/2024vote.csv",votes)

# 2024 table
# changes


const FLAGRED  = "#B22234"
const FLAGBLUE = "#3C3B6E"
change.color = ifelse.(change.biden_col .!= 0, FLAGBLUE,FLAGRED)
change.party = ifelse.(change.biden_col .!= 0, "Harris","Trump")
sort!(tab1,[:party,:st])
tab1 = change[:,[:st,:ev,:old,:chg,:party]]
sort!(tab1,[:party,:st])
tab2 = change[:,[:st,:ev,:old,:chg,:color]]

header = ["State","2024 Electoral Votes","2020 Electoral Votes","Change","Won by"]
pretty_table(tab1, backend = Val(:html), header = header, standalone = false)