using CSV
using DataFrames
using Dates
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
rename(oldvote, [:po,:harris,:trump])

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
sort!(df,:time)
df.running  = cumsum(df.ev)

min_time 	= minimum(df.time)
max_time 	= maximum(df.time)
complete_df = generate_complete_series(min_time, max_time)
df 		 	= outerjoin(complete_df, df, on = :time)
sort!(result_df, :time)


