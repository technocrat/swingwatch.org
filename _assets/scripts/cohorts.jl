using BSON: @save
using CSV
using DataFrames
using PrettyTables


mutable struct MetaFrames
    meta::Dict{Symbol, Any}
    data::DataFrame
end

cohort2020 = CSV.read("../data/2020age.csv",DataFrame)
cohort2022 = CSV.read("../data/2022age.csv",DataFrame)

meta_info_2020 = Dict(
  :source => "U.S. Census Bureau, Current Population Survey, November 2022",
  :url    => "https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-585.html",
  :title => "Table 4c. Reported Voting and Registration of the Total Voting-Age Population, by Age, for States: November 2022"
)

meta_info_2022 = Dict(
:source => "U.S. Census Bureau, Current Population Survey, November 2022", 
:url   => "https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-586.html",
:title => "Table 4c. Reported Voting and Registration of the Total Voting-Age Population, by Age, for States: November 2022")

meta_cohort_2020 = MetaFrames(meta_info_2020, cohort2020)
meta_cohort_2022 = MetaFrames(meta_info_2022, cohort2022)

@save "../objs/meta_cohort_2020.bson" meta_cohort_2020
@save "../objs/meta_cohort_2022.bson" meta_cohort_2022
