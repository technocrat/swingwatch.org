using CSV
using DataFrames
using PrettyTables


header = ["Scenario", "Electoral Votes", "Biden Total", "Trump Total", "Result"]

# see CreateOutcomes.jl for production of outcome.csv
csv_path = "/Users/ro/projects/SwingWatch/_assets/objs/outcome.csv"


outcome = CSV.read(csv_path, DataFrame)

"""
   replace_and_with_comma!(df::DataFrame, col_name::Symbol)

Replace occurrences of " and" with "," in a specific column of a DataFrame.

# Arguments
- `df::DataFrame`: The DataFrame in which the replacement should be performed.
- `col_name::Symbol`: The name of the column (as a Symbol) in which the replacement should be done.

# Notes
- This function modifies the input DataFrame `df` in-place.
- It uses the `transform!` function from the DataFrames.jl package to apply a row-wise transformation to the specified `col_name` column.
- The transformation function `ByRow(x -> replace(x, " and" => ","))` replaces occurrences of " and" with "," in each row of the `col_name` column.
- This function is useful for cleaning text data, especially when dealing with comma-separated lists that may contain the word "and".

# Examples
```julia
# Create a sample DataFrame
data = [
   "Apple and Banana",
   "Orange and Kiwi",
   "Grape",
   "Pear and Mango"
]
df = DataFrame(fruit=data)

# Replace " and" with "," in the "fruit" column
replace_and_with_comma!(df, :fruit)

# The "fruit" column of `df` now contains:
#    fruit
# 1  "Apple,Banana"
# 2  "Orange,Kiwi"
# 3  "Grape"
# 4  "Pear,Mango"
"""
# Function to replace " and" with "," in a specific column of a DataFrame
function replace_and_with_comma!(df::DataFrame, col_name::Symbol)
    transform!(df, col_name => ByRow(x -> replace(x, " and" => ",")) => col_name)
end

# Example usage:
# Assume outcome is your DataFrame and combo is the column you want to modify
replace_and_with_comma!(outcome, :combo)

#pretty_table(outcome; backend = Val(:html), header = header, standalone = false)

pa_loss = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== 
 "Trump"), :]
pa_ties = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== "Tie"),   :]
pa_wins = outcome[(occursin.("PA", outcome.combo)) .& (outcome.result .== "Biden"), :]
pa_miss = outcome[(.!occursin.("PA", outcome.combo)) .& (outcome.result .== "Biden"), :]


pretty_table(pa_miss; backend = Val(:html), header = header, standalone = false)

nc_miss = outcome[(.!occursin.("NC", outcome.combo)) .& (outcome.result .== "Biden"), :]
pa_miss = nc_miss[(.!occursin.("PA", nc_miss.combo)), :]
pretty_table(pa_miss; backend = Val(:html), header = header, standalone = false)