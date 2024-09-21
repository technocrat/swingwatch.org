margins = CSV.read("../objs/margins.csv", DataFrame)
@load "../objs/mon_template.bson" months
prior_poll = BSON.load("../objs/"*"$st"*"_"*"$prior_month"*"_p_sample.bson")
