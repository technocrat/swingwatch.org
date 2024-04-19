using CSV
using DataFrames
using PrettyTables


header = ["Scenario", "Electoral Votes", "Biden Total", "Trump Total", "Result"]

# see CreateOutcomes.jl for production of outcome.csv
csv_path = "/Users/ro/projects/SwingWatch/_src/objs/outcome.csv"


outcome = CSV.read(csv_path, DataFrame)


#pretty_table(outcome; backend = Val(:html), header = header, standalone = false)

pa_loss = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== 
 "Trump"), :]
pa_ties = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== "Tie"),   :]
pa_wins = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== "Biden"), :]
pa_miss = outcome[(.!occursin.("PA", outcome.combo)) .& (outcome.result .== "Biden"), :]


pretty_table(pa_miss; backend = Val(:html), header = header, standalone = false)
