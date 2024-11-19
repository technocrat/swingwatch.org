include("prel.jl")

HEADER      =  ["pollster", "Date", "Day", "n", "margin", "trump", "harris","null"]

# ST          = "Arizona"
# st          = "AZ"
# sT          = "az"
# cutout      = [52.2,46.7]
# cast        = 3354996
# modmean     = 0.4923
# margin      = normalize_two_way_race(cast,cutout)[1][1]-normalize_two_way_race(cast,cutout)[1][2]
# actual      = normalize_two_way_race(cast,cutout)[1][2]
# ST          = "Georgia"
# st          = "GA"
# sT          = "ga"
# cutout      = [50.7,48.5]
# cast        = 5250037
# modmean     = 0.4928
# margin      = normalize_two_way_race(cast,cutout)[1][1]-normalize_two_way_race(cast,cutout)[1][2]
# actual      = normalize_two_way_race(cast,cutout)[1][2]
# st          = "GA"
# sT          = "ga"
# margin      = 3.2
# ST          = "North Carolina"
# st          = "NC"
# sT          = "nc"
# cutout      = [51.1,47.7]
# cast        = 5631769
# modmean     = .4954
# margin      = normalize_two_way_race(cast,cutout)[1][1]-normalize_two_way_race(cast,cutout)[1][2]
# actual      = normalize_two_way_race(cast,cutout)[1][2]

# ST          = "Nevada"
# st          = "NV"
# sT          = "nv"
# cutout       = [50.6,47.5]
# cast        = 1482420
# modmean     = .4988
# margin      = normalize_two_way_race(cast,cutout)[1][1]-normalize_two_way_race(cast,cutout)[1][2]
# actual      = normalize_two_way_race(cast,cutout)[1][2]

# ST          = "Pennsylvania"
# st          = "PA"
# sT          = "pa"
# margin      =  [50.6,48.5]
# cast        = 6998113
# modmean     = .5015
# margin      = normalize_two_way_race(cast,cutout)[1][1]-normalize_two_way_race(cast,cutout)[1][2]
# actual      = normalize_two_way_race(cast,cutout)[1][2]
HEADER      =  ["pollster", "Date", "Day", "n", "margin", "harris", "trump","null"]
ST          = "Michigan"
st          = "MI"
sT          = "mi"
cutout      =  [49.7,48.3]
cast        = 5638701
modmean     = .5049
margin      = normalize_two_way_race(cast,cutout)[1][1]-normalize_two_way_race(cast,cutout)[1][2]
actual      = normalize_two_way_race(cast,cutout)[1][2]

# ST          = "Wisconsin"
# st          = "WI"
# sT          = "wi"
# cutout      = [49.71,48.85]
# cast        = 3414473
# modmean     = .5035
# margin      = normalize_two_way_race(cast,cutout)[1][1]-normalize_two_way_race(cast,cutout)[1][2]
# actual      = normalize_two_way_race(cast,cutout)[1][2]

camp = CSV.read("objs/campaign.csv",DataFrame)
input_file =  "data/$sT.csv"
lines      = readlines(input_file)
data       = @chain lines begin
    map(line -> begin
      line = replace(line, r" LV| RV"  => "")
      line = replace(line, r"\t .*$"   => "")
      line = replace(line, r" \d+.*- " => "\t")
      line = replace(line, r"\t7\/"    => "\tjul\t")
      line = replace(line, r"\t8\/"    => "\taug\t")
      line = replace(line, r"\t9\/"    => "\tsep\t")
      line = replace(line, r"\t10\/"   => "\toct\t")
		return line
    end, _)
end

data_str = join(data, "\n")

df       = CSV.read(IOBuffer(data_str),
              DataFrame;
              delim         = '\t',
              header        = HEADER,
              missingstring = "—")

df.NumericDate = [month_map[month] for month in df.Date]
sort!(df, [:NumericDate, :Day])
df.idx         = 1:nrow(df)

select!(df, Not([:margin,:null],:NumericDate))

df.month  = df.Date
df.Date   = String.(titlecase.(df.Date))
df.Date   = df.Date .* " "
df.Day    = string.(df.Day)
df.date   = df.Date .* df.Day
df.vote   = df.trump .+ df.harris
df.tnorm  = df.trump ./ df.vote
df.hnorm  = df.harris ./df.vote
df        = leftjoin(df,camp,on=:date)
df        = df[:,[:month,:pollster,:date,:n,:hnorm,:camp]]
dropmissing!(df,:camp)

wam       = mean(df.hnorm,Weights(df.n))

# Group by `Date` and calculate the weighted mean for `hnorm`
by_month    = weighted_mean_by_group(df, :month, :hnorm, :n)[:,[2,3]]
rename!(by_month,[1 => "Month",2 => "Harris"])
sort!(by_month, [:Month], by = x -> custom_order[x])
by_month.Month = uppercase.(by_month.Month)
by_month.Harris = format_as_percentage.(by_month.Harris)

by_pollster = weighted_mean_by_group(df, :pollster, :hnorm, :n)[:,[2,3]]
rename!(by_pollster,[1 => "Pollster",2 => "Harris"])

by_pollster[by_pollster.Harris .> 0.5,:]
by_pollster[by_pollster.Harris .<= actual,:]

println("In $ST $(length(unique(df.pollster))) pollsters conducted a total of
       $(nrow(df)) polls from $(first(df.date)) to $(last(df.date)). Overall,
       the weighted mean poll of $(format_as_percentage(wam)) indicated a
       victory for Trump over Harris in the two-candidate race. Weights were
       assigned by number of respondents. Of the pollsters,
       $(nrow(by_pollster[by_pollster.Harris .< 0.5,:])) corresponded to a
       victory for Trump with $(format_as_percentage(1-wam)) of the
       two-candidate vote. The other $(nrow(by_pollster[by_pollster.Harris .>=
       0.5,:])) corresponded to a victory for Harris in the two-candidate vote,
       overstating her actual share, $(format_as_percentage(actual)).")

println("The weighted mean poll by month varied only a little more than one-half percent.")

by_month.Harris = format_as_percentage.(by_month.Harris)
by_pollster = weighted_mean_by_group(df, :pollster, :hnorm, :n)[:,[2,3]]
rename!(by_pollster,[1 => "Pollster",2 => "Harris"])
by_pollster.Harris = format_as_percentage.(by_pollster.Harris)

x = df.camp
y = df.hnorm

# Create plot
p = scatter(x,y,
    label="Polls",
    alpha=0.5,
    ylabel="Harris share in $ST",
    xlabel="Day of campaign",
    legend=:outerbottom
)

hline!([wam],
    label="Weighted average",
    linewidth = 2,
    color=:blue
)

hline!([modmean],
    label="Model",
    linewidth = 2,
    color     = :green)

hline!([actual],
    label="Election result",
    linewidth = 3,
    color=:red)

display(p)
savefig(p,"../img/$st.png")

pretty_table(by_pollster,backend=Val(:html), alignment=[:l, :r],show_subheader = false)
pretty_table(by_month,backend=Val(:html), alignment=[:l, :r],show_subheader = false)
