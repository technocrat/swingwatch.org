st                   = "AZ"
period               = values(Month_names[Mon])
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
results              = deep[:deep][:p]
estimated_proportion = estimate_high_probability_outcomes(results)

println("The model shows Harris leading, with **$(round(estimated_proportion * 100))**% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a strong position for Harris, but it's important to note that this is a statistical projection based the data from August through $period. This is a summary of the model, not a prediction of the election outcome.")
#------------------------------------------------------------------
st                   = "GA"
period               = values(Month_names[Mon])
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
results              = deep[:deep][:p]
estimated_proportion = estimate_high_probability_outcomes(results)

println("The model shows Harris leading, with **$(round(estimated_proportion * 100))**% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a strong position for Harris, but it's important to note that this is a statistical projection based the data from August through $period. This is a summary of the model, not a prediction of the election outcome.")
#------------------------------------------------------------------
st                   = "MI"
period               = values(Month_names[Mon])
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
results              = deep[:deep][:p]
estimated_proportion = estimate_high_probability_outcomes(results)

println("The model shows Harris leading, with **$(round(estimated_proportion * 100))**% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a strong position for Harris, but it's important to note that this is a statistical projection based the data from August through $period. This is a summary of the model, not a prediction of the election outcome.")
#------------------------------------------------------------------
st                   = "NV"
period               = values(Month_names[Mon])
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
results              = deep[:deep][:p]
estimated_proportion = estimate_high_probability_outcomes(results)

println("The model shows Harris leading, with **$(round(estimated_proportion * 100))**% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a strong position for Harris, but it's important to note that this is a statistical projection based the data from August through $period. This is a summary of the model, not a prediction of the election outcome.")
#------------------------------------------------------------------
st                   = "NC"
period               = values(Month_names[Mon])
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
results              = deep[:deep][:p]
estimated_proportion = estimate_high_probability_outcomes(results)

println("The model shows Harris leading, with **$(round(estimated_proportion * 100))**% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a strong position for Harris, but it's important to note that this is a statistical projection based the data from August through $period. This is a summary of the model, not a prediction of the election outcome.")
#------------------------------------------------------------------
st                   = "PA"
period               = values(Month_names[Mon])
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
results              = deep[:deep][:p]
estimated_proportion = estimate_high_probability_outcomes(results)

println("The model shows Harris leading, with **$(round(estimated_proportion * 100))**% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a strong position for Harris, but it's important to note that this is a statistical projection based the data from August through $period. This is a summary of the model, not a prediction of the election outcome.")
#------------------------------------------------------------------
st                   = "WI"
period               = values(Month_names[Mon])
deep                 = BSON.load("../objs/$st" * "_" *"$mon" * "_p_sample.bson")
results              = deep[:deep][:p]
estimated_proportion = estimate_high_probability_outcomes(results)

println("The model shows Harris leading, with **$(round(estimated_proportion * 100))**% of simulated outcomes showing her gaining more than 50% of the two-candidate vote. This suggests a strong position for Harris, but it's important to note that this is a statistical projection based the data from August through $period. This is a summary of the model, not a prediction of the election outcome.")
#------------------------------------------------------------------
