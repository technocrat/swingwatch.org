using Clustering
using CSV
using DataFrames
using Plots
using Statistics

df = CSV.read("objs/margins.csv",DataFrame)

function cluster_data(df::DataFrame, n_clusters::Int=3)
    # Input validation
    if nrow(df) < n_clusters
        error("Number of rows ($(nrow(df))) must be greater than number of clusters ($n_clusters)")
    end
    
    # Create position array based on order in dataframe
    positions = collect(1:nrow(df))
    
    # Extract features into a matrix - using position and margin
    features = hcat(positions, df.margin)'
    
    # Normalize features to give equal weight
    features_normalized = (features .- mean(features, dims=2)) ./ std(features, dims=2)
    
    # Perform k-means clustering
    result = kmeans(features_normalized, n_clusters)
    
    # Add cluster assignments to the original dataframe
    df_clustered = copy(df)
    df_clustered.cluster = result.assignments
    
    # Calculate cluster statistics
    cluster_stats = DataFrame()
    for i in 1:n_clusters
        cluster_indices = findall(x -> x == i, df_clustered.cluster)
        cluster_data = df_clustered[cluster_indices, :]
        stats = (
            cluster = i,
            size = nrow(cluster_data),
            mean_position = mean(positions[cluster_indices]),
            mean_margin = mean(cluster_data.margin),
            std_position = std(positions[cluster_indices]),
            std_margin = std(cluster_data.margin)
        )
        push!(cluster_stats, stats)
    end
    
    # Define custom colors for clusters
    cluster_colors = [:green, :orange, :yellow]
    
    # Create visualization with all specified formatting
    plt = Plots.scatter(
        positions,
        100 .* df_clustered.margin,  # Multiply by 100 to convert to percentage
        group=df_clustered.cluster,
        xlabel="Order of AP Call",
        ylabel="Democratic Margin (%)",
        title="2020 Election",
        legend=:topright,
        yformatter=y->string(round(Int, y)) * "%",  # Format as percentage with no decimals
        markersize=8,
        framestyle=:box,
        grid=true,
        gridlinewidth=0.5,
        gridstyle=:dash,
        gridcolor=:gray,
        palette=cluster_colors,
        legend_title="Clusters"
    )
    
    # Add emphasized zero line
    hline!(plt, [0], color=:black, linewidth=1.5, label=nothing)
    
    return df_clustered, cluster_stats, plt
end

# Example usage:
df_with_clusters, stats, cluster_plot = cluster_data(df)
display(cluster_plot)
println(stats)