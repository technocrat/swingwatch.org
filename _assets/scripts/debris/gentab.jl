using CSV
using DataFrames
using PrettyTables

header = ["Scenario", "Electoral Votes", "Biden Total", "Trump Total", "Result"]
csv_path = "/Users/ro/projects/SwingWatch/_src/objs/outcome.csv"
df = CSV.read(csv_path, DataFrame)

open("_assets/tab1/pa.txt", "w") do io
    pretty_table(io, df; backend = Val(:html), header = header, standalone = false)
end

