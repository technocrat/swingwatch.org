
eighth = 0.99875
quart  = 0.9975
half   = 0.995
full   = 0.99
oneqt  = 0.9875
onehf  = 0.985
oneful = 0.98
twoqt  = 0.9775
twohf  = 0.975
twoful = 0.97
fiver  = 0.95
tener  = 0.9
threeq = 0.75
fifty  = 0.5

start.full          = start.biden_pop .* full
start.half          = start.biden_pop .* half
start.quart         = start.biden_pop .* quart
start.eighth        = start.biden_pop .* eighth
start.oneqt         = start.biden_pop .* oneqt
start.onehf         = start.biden_pop .* onehf
start.oneful        = start.biden_pop .* oneful
start.twoqt         = start.biden_pop .* twoqt
start.twohf         = start.biden_pop .* twohf
start.twoful        = start.biden_pop .* twoful
start.fiver         = start.biden_pop .* fiver
start.tener         = start.biden_pop .* tener
start.threeq        = start.biden_pop .* threeq
start.fifty         = start.biden_pop .* fifty

start.eighth_margin   = start.eighth   .- start.trump_pop
start.quart_margin    = start.quart    .- start.trump_pop
start.half_margin     = start.half     .- start.trump_pop
start.full_margin     = start.full     .- start.trump_pop
start.oneqt_margin    = start.oneqt    .- start.trump_pop
start.onehf_margin    = start.onehf    .- start.trump_pop
start.oneful_margin   = start.oneful   .- start.trump_pop
start.twoqt_margin    = start.twoqt    .- start.trump_pop
start.twohf_margin    = start.twohf    .- start.trump_pop
start.twoful_margin   = start.twoful   .- start.trump_pop
start.fiver_margin    = start.fiver    .- start.trump_pop
start.tener_margin    = start.tener    .- start.trump_pop
start.threeq_margin   = start.threeq   .- start.trump_pop
start.fifty_margin    = start.fifty    .- start.trump_pop

for col in names(start)
    if eltype(start[!, col]) == Float64
        start[!, col] = convert.(Int64, round.(start[!, col]))
    end
end

result_eighth   = start[(start.margin .> 0) .& (start.eighth_margin .< 0) :]
result_quart    = start[(start.margin .> 0) .& (start.quart_margin .< 0), :]
result_half     = start[(start.margin .> 0) .& (start.half_margin .< 0),  :]
result_full     = start[(start.margin .> 0) .& (start.full_margin .< 0),  :]
result_oneqt    = start[(start.margin .> 0) .& (start.oneqt_margin .< 0), :]
result_onehf    = start[(start.margin .> 0) .& (start.onehf_margin .< 0), :]
result_oneful   = start[(start.margin .> 0) .& (start.oneful_margin .< 0),:]
result_twohf    = start[(start.margin .> 0) .& (start.twohf_margin .< 0), :]
result_twoful   = start[(start.margin .> 0) .& (start.twoful_margin .< 0),:]
result_twoqt    = start[(start.margin .> 0) .& (start.twoqt_margin .< 0), :]
result_fiver    = start[(start.margin .> 0) .& (start.fiver_margin .< 0), :]
result_tener    = start[(start.margin .> 0) .& (start.tener_margin .< 0), :]
result_threeq   = start[(start.margin .> 0) .& (start.threeq_margin .< 0), :]
result_fifty    = start[(start.margin .> 0) .& (start.fifty_margin .< 0), :]


result_eighth[:,[1,10,11]]
result_quart[:,[1,7,8]]
result_half[:,[1,12,13]]
result_full[:,[1,14,15]]
result_oneqt[:,[1,16,19]]
result_onehf[:,[1,17,20]]
result_oneful[:,[1,18,21]]
result_twohf[:,[1,24,25]]
result_twoful[:,[1,22,23]]
result_twoqt[:,[1,26,27]]
result_fiver[:,[1,28,29]]
result_tener[:,[1,30,31]]
result_threeq[:,[1,32,33]]
result_fifty[:,[1,34,35]]

