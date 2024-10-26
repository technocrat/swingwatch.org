using CSV
using DataFrames
using Dates
using Plots
#------------------------------------------------------------------
function generate_complete_series(start_time, end_time)
    complete_series = DataFrame(time = collect(start_time:Minute(30):end_time))
    return complete_series
end

function round_up_30min(dt::DateTime)
    minute_part = minute(dt)
    if minute_part == 0 && second(dt) == 0
        return dt
    else
        rounded_minute = ceil(minute_part / 30) * 30
        return DateTime(year(dt), month(dt), day(dt), hour(dt)) + Minute(rounded_minute)
    end
end
#------------------------------------------------------------------
df          = CSV.read("../data/call_order.csv", DataFrame)
college		= CSV.read("../objs/college.csv", DataFrame)
oldvote     = CSV.read("../objs/2024vote.csv", DataFrame)
oldvote 	= oldvote[:,[1,5,6]]
rename!(oldvote, [:po,:harris,:trump])

df.time     = map(x -> DateTime(x, "yyyy-mm-dd HH:MM"), df.time)

# df.est      = map(x -> DateTime(x, "yyyy-mm-dd HH:MM"), df.time)
# df.cst      = map(x -> DateTime(x, "yyyy-mm-dd HH:MM") - Hour(1), df.time)
# df.mst      = map(x -> DateTime(x, "yyyy-mm-dd HH:MM") - Hour(2), df.time)
# df.pst      = map(x -> DateTime(x, "yyyy-mm-dd HH:MM") - Hour(3), df.time)
# df.eastern  = map(x -> Dates.format(x, "I:MM p"), df.est)
# df.central  = map(x -> Dates.format(x, "I:MM p"), df.cst)
# df.mountain = map(x -> Dates.format(x, "I:MM p"), df.mst)
# df.pacific  = map(x -> Dates.format(x, "I:MM p"), df.pst)


df 			= leftjoin(df,college,on = :state)
df 			= leftjoin(df,oldvote,on = :po)
df.time 	= round_up_30min.(df.time)
df.idx 		= 1:56
[df.harris[df.idx .== i] .= 0 for i in pos]
swings      = ["PA","GA","NC","MI","AZ","WI","NV"]
filtered_df = df[in.(df.po, Ref(swings)), :]
[df.harris[df.idx .== i] .= 0 for i in filtered_df.idx]
df[10,6] = 6
df[28,6] = 3
df[56,6] = 0
sort!(df,:time)
df.harris_running  = cumsum(df.harris)
df.trump_running  = cumsum(df.trump)
df.time_idx = 1:56
# min_time 	= minimum(df.time)
# max_time 	= maximum(df.time)
# complete_df = generate_complete_series(min_time, max_time)
# result_df 	= outerjoin(complete_df, df, on = :time)
# sort!(result_df, :time)

"""
Scenarios
Early over: AZ, PA, NV, WI)
Cliffhang: NV, WI, GA, NC)
Expected: PA, WI, MI)
Hopschotch: AZ, NV, MI, NC)

Wednesday afternoon, Arizona called
	For Trump: 

"""

plot(1:length(df.time_idx), df.harris_running,
     label="Harris",
     linewidth=2,
     linecolor=:blue,
     legend=:bottomright,
	 xticks=(1:56, df.po),
	 tickfontsize=4,
	 xrotation=45)
plot!(1:length(df.time_idx), df.trump_running,
     label="Harris",
     linewidth=2,
     linecolor=:red,
     legend=:bottomright)
hline!([270], line=:dash, color=:black, label="Win/Loss Threshold")
xlabel!("Sequence of calls")
ylabel!("Electoral votes")
title!("Expected outcome")

