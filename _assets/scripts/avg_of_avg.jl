using Plots
pa = [ 73.0, 53.0, 48.0, 70.0, 71.75 ]
ga = [ 36.0, 42.0, 18.0, 3.0, 2.97 ]
nc = [ 30.0, 24.0, 29.0, 16.0, 15.39 ]
mi = [ 73.0, 82.0, 81.0, 92.0, 92.25 ]
az = [ 66.0, 29.0, 26.0, 8.0, 8.14 ]
wi = [ 68.0, 60.0, 81.0, 86.0, 85.11 ]
nv = [ 25.0, 27.0, 31.0, 55.0, 54.84]

p = plot(x, [pa ga nc mi az wi nv], 
     title="Modeled Likelihood of Harris Win",
     xlabel="Time Period",
     ylabel="Likelihood (%)",
     label=["PA" "GA" "NC" "MI" "AZ" "WI" "NV"],
     xticks=(1:5, ["early August", "late August", "early September", "late September", "mid October"]),
     xrotation=45,
     legend=:topleft,
     linewidth=2,
     marker=:circle)

# Add the dashed line at 50
hline!([50], line=:dash, color=:black, label="Win/Loss Threshold")

# Add text annotations for "Win" and "Loss"
annotate!([(2.5, 52, ("Win", 10, :black, :center)),
           (2.5, 48, ("Loss", 10, :black, :center))])

savefig("../img/avg_of_avg.png")
