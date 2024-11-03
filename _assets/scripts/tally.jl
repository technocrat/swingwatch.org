using CSV
using DataFrames
using Plots
using Statistics
using TimeZones

df      = CSV.read("objs/racecard.csv",DataFrame)
out     = CSV.read("objs/outcome.csv",DataFrame)
tz      = TimeZone("America/New_York")
df.time = replace.(df.time, " " => "T")
df.time = ZonedDateTime.(df.time, tz)

now(tz)

function flip!(df, state)
    i = findfirst(df.po .== state)
    df[i, :harris], df[i, :trump] = df[i, :trump], df[i, :harris]
    return df
end

function tally()
  df.spread = df.margin .- df.pop_harris ./ (df.pop_harris .+ df.pop_trump)
end

filter(row -> !any(loser -> occursin(loser, row.combo), losers), outq)

filter(row -> any(picks -> occursin(picks, row.po), picks), dfq)
