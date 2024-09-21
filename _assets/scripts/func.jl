#------------------------------------------------------------------
function remove_empties(the_month::Dict) 
  Dict(state => Dict(pollster => polls for (pollster, polls) in pollsters 
  if !isempty(polls)) for (state, pollsters) in the_month)
end
#------------------------------------------------------------------
function process_polls(polls::Vector{Poll})
    result = Int64.(collect(collect([(p.harris_support, p.sample_size) for p in polls])[1]))
    return [Int64(floor(result[1] / 100 * result[2])), result[2]]
end
#------------------------------------------------------------------
function draw_density()
    # Create a new figure with specified resolution
    fig = Figure(size = (600, 400))
    
    # Add an axis to the figure
    ax = Axis(fig[1, 1], xlabel = "Likelihood of Harris win", ylabel = "Number of draws", title = "Model: Harris results in $ST with polling through " * Month_names[Mon])
    
    # Plot the full density curve
    lines!(ax, kde_result.x, kde_result.density, color = "#a3b35c", linewidth = 3, strokewidth = 4, strokecolor = GREENBAR, label = "Draws")
    
    # Find the indices corresponding to the posterior interval
    indices = findall((posterior_interval[1] .<= kde_result.x) .& (kde_result.x .<= posterior_interval[2]))
    
    # Extract the x and y values within the posterior interval
    x_region = kde_result.x[indices]
    y_region = kde_result.density[indices]
    
    # Fill the specific area under the curve
    band!(ax, x_region, fill(0, length(x_region)), y_region, color = (LORANGE), label = "Credible Interval")
    
    # Find the y-value corresponding to the specified x-value
    y_value = kde_result.density[argmin(abs.(kde_result.x .- margin))]
    
    # Add a vertical line at the specified x-value from 0 to the y-value
    vlines!(ax, [margin], [0, y_value], color = FLAGBLUE, linestyle = :dash, linewidth = 4, label = "2020 Actual")
    
    # Add a legend to the plot
    axislegend(ax)
    
    # Adjust the plot limits to fit the density line
    Makie.xlims!(ax, extrema(p_vec))
    Makie.ylims!(ax, 0, nothing)
    
    # Display the figure
    fig
end
#------------------------------------------------------------------
function consolidate_polls(current_month)
    consolidated = Dict{State, NamedTuple{(:harris_support, :trump_support, :sample_size), Tuple{Float64, Float64, Int64}}}() 
    for (state, pollsters) in current_month
        total_harris = 0.0
        total_trump  = 0.0
        total_sample = 0     
        for (_, polls) in pollsters
            for poll in polls
                total_harris += poll.harris_support * poll.sample_size
                total_trump += poll.trump_support * poll.sample_size
                total_sample += poll.sample_size
            end
        end       
        avg_harris = total_harris / total_sample
        avg_trump  = total_trump  / total_sample     
        consolidated[state] = (harris_support = avg_harris, trump_support = avg_trump, sample_size = total_sample)
    end  
    return consolidated
end

#------------------------------------------------------------------
function calculate_support(consolidated_polls, state)
  poll_data = consolidated_polls[state]
  
  harris_votes = floor(Int, poll_data.sample_size * (poll_data.harris_support / 100))
  trump_votes =  floor(Int, poll_data.sample_size * (poll_data.trump_support  / 100))
  
  return (
      harris_votes = harris_votes,
      trump_votes  = trump_votes,
      sample_size  = poll_data.sample_size
  )
end
#------------------------------------------------------------------
@model function poll_model(num_votes::Int64, num_wins::Int64, prior_dist::Distribution)
    # Define the prior using the informed prior distribution
    p ~ prior_dist
    # Define the likelihood with additional uncertainty
    num_wins ~ Binomial(num_votes, p)
end