margins    = CSV.read("../objs/margins.csv", DataFrame)
prior_poll = BSON.load("../objs/"*"$st"*"_"*"$prior_month"*"_p_sample.bson")
# prior_poll = BSON.load("../objs/new_prior.bson")

input_file =  "../data/$sT.csv"
lines      = readlines(input_file)
data       = @chain lines begin
    map(line -> begin
      line = replace(line, r" LV| RV"  => "")
      line = replace(line, r"\t .*$"   => "")
      line = replace(line, r" \d+.*- " => "\t")
      line = replace(line, r"\t7\/"    => "\tjul\t")
      line = replace(line, r"\t8\/"    => "\taug\t")
      line = replace(line, r"\t9\/"    => "\tsep\t")
      line = replace(line, r"\t10\/"   => "\toc\t")
      line = replace(line, r"\t11\/"   => "\tnov\t")
      return line
    end, _)
end

data_str = join(data, "\n")

df = CSV.read(IOBuffer(data_str),
              DataFrame;
              delim         = '\t',
              header        = HEADER,
              missingstring = "—")
select!(df, Not(:margin))

df.Day = ifelse.(df.Day .> 15, 2, 1)

df.Date = df.Date .* string.(df.Day)

select!(df, Not(:Day))

df.total_support   = df.harris + df.trump
df.harris_adjusted = (df.harris ./ df.total_support) .* 100
df.votes           = round.(Int, df.n .* df.total_support ./ 100)
df.wins            = round.(Int, df.votes .* (df.harris_adjusted ./ 100))
df                 = filter(row -> row.Date ==  Mon, df)
num_wins           = sum(df.wins)
num_votes          = sum(df.votes) 

