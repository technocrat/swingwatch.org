#------------------------------------------------------------------
# revise to add north carolina
#------------------------------------------------------------------

using CSV
using DataFrames
using Format
using PrettyTables
using Printf

mutable struct MetaFrames
    meta::Dict{Symbol, Any}
    data::DataFrame
end

# Example usage
# df = DataFrame(name=["John", "Jane"], age=[28, 34])
# meta_info = Dict(:source => "Survey Data", :year => 2021)
# df_meta = MetaFrames(meta_info, df)

turnout   = CSV.read("../data/vote2022.csv",DataFrame)
meta_info = Dict(
  :source => "Census Bureau, Current Population Survey, November 2022",
  :title  =>  "Table 4c. Reported Voting and Registration of the Total Voting-Age Population, by Age, for States: November 2022",
  :url => "https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-586.html",
  :title => "Table 4c. Reported Voting and Registration of the Total Voting-Age Population, by Age, for States: November 2022")
turnout[2:6,1]   .= "AZ"
turnout[8:12,1]  .= "GA"
turnout[14:18,1] .= "MI"
turnout[20:24,1] .= "NV"
turnout[26:30,1] .= "PA"
turnout[32:36,1] .= "WI"

turnout[:,3:6]    = turnout[:,3:6] .* Int64[1e3]
turnout.ncpop     = turnout.totpop .- turnout.cpop
turnout.ncpct     = turnout.ncpop ./ turnout.totpop
turnout           = turnout[1:36,:]
state_turnout     = turnout[turnout.cohort .== "Total", :]
turnout           = turnout[turnout.cohort .!= "Total", :]
vote2022          = MetaFrames(meta_info,turnout)

state_turnout.st     = convert.(String, state_turnout.st)
state_turnout.totpop = convert.(Int64, state_turnout.totpop)
state_turnout.cpop   = convert.(Int64, state_turnout.cpop)
state_turnout.ncpop  = convert.(Int64, state_turnout.ncpop)
state_turnout.ncpct  = convert.(Float64, state_turnout.ncpct)
state_turnout.ncpct  = map(x -> Printf.@sprintf("%.2f", x), state_turnout.ncpct)
state_turnout.totpop = Format.format.(state_turnout.totpop, commas=true)
state_turnout.cpop   = Format.format.(state_turnout.cpop, commas=true)
state_turnout.ncpop  = Format.format.(state_turnout.ncpop, commas=true)
header = ("State","Population","Non-citizen","Percentage")
pretty_table(state_turnout; backend = Val(:html), header = header)




