using CSV
using DataFrames
using Statistics
using HypothesisTests
using StatsBase

df = CSV.read("objs/margins.csv",DataFrame)
function analyze_early_reporting(df::DataFrame; early_threshold::Int=10)
    """
    Comprehensive statistical analysis of differences between early and late reporting states.
    
    Parameters:
    - df: DataFrame with columns ev (electoral votes), margin (vote margin), harris (electoral outcome)
    - early_threshold: Number of states to consider as "early reporting"
    
    Returns:
    - Dictionary with analysis results
    """
    
    # Sort by harris to get early reporting states
    early_states = sort(df, :harris)[1:early_threshold, :]
    late_states = sort(df, :harris)[early_threshold+1:end, :]
    
    # Convert margins to Float64 vectors
    early_margins = Float64.(early_states.margin)
    late_margins = Float64.(late_states.margin)
    
    # Weighted calculations
    function weighted_mean(margins, weights)
        return sum(Float64.(margins) .* Float64.(weights)) / sum(weights)
    end
    
    early_weighted_margin = weighted_mean(early_states.margin, early_states.ev)
    late_weighted_margin = weighted_mean(late_states.margin, late_states.ev)
    overall_weighted_margin = weighted_mean(df.margin, df.ev)
    
    # Additional Statistical Tests
    
    # 1. Parametric t-test
    t_test = UnequalVarianceTTest(early_margins, late_margins)
    
    # 2. Non-parametric Mann-Whitney U test
    mw_test = MannWhitneyUTest(early_margins, late_margins)
    
    # 3. Kolmogorov-Smirnov test for distribution differences
    ks_test = ApproximateTwoSampleKSTest(early_margins, late_margins)
    
    # 4. Effect sizes
    # Cohen's d
    pooled_std = sqrt((var(early_margins) + var(late_margins)) / 2)
    cohens_d = (mean(early_margins) - mean(late_margins)) / pooled_std
    
    # Point-biserial correlation
    all_margins = vcat(early_margins, late_margins)
    group_indicator = vcat(zeros(length(early_margins)), ones(length(late_margins)))
    r_pb = cor(all_margins, group_indicator)
    
    # 5. Descriptive statistics
    early_stats = Dict(
        "mean" => mean(early_margins),
        "median" => median(early_margins),
        "std" => std(early_margins),
        "iqr" => diff(quantile(early_margins, [0.25, 0.75]))[1],
        "skewness" => skewness(early_margins)
    )
    
    late_stats = Dict(
        "mean" => mean(late_margins),
        "median" => median(late_margins),
        "std" => std(late_margins),
        "iqr" => diff(quantile(late_margins, [0.25, 0.75]))[1],
        "skewness" => skewness(late_margins)
    )
    
    return Dict(
        # Original metrics
        "early_weighted_margin" => early_weighted_margin,
        "late_weighted_margin" => late_weighted_margin,
        "overall_weighted_margin" => overall_weighted_margin,
        "margin_difference" => early_weighted_margin - late_weighted_margin,
        "early_ev_total" => sum(early_states.ev),
        "late_ev_total" => sum(late_states.ev),
        "early_states_count" => length(early_margins),
        "late_states_count" => length(late_margins),
        
        # Statistical tests
        "t_test_pvalue" => pvalue(t_test),
        "mw_test_pvalue" => pvalue(mw_test),
        "ks_test_pvalue" => pvalue(ks_test),
        
        # Effect sizes
        "cohens_d" => cohens_d,
        "point_biserial_r" => r_pb,
        
        # Descriptive statistics
        "early_stats" => early_stats,
        "late_stats" => late_stats
    )
end

"""
Let me provide a comprehensive interpretation of these statistical results:

1. **Distribution Differences** (KS Test):
- The Kolmogorov-Smirnov test p-value (0.0021) is highly significant
- This tells us the early and late reporting states have fundamentally different distribution patterns of margins
- This strengthens our confidence that the differences we see aren't just random variation

2. **Statistical Significance** (Multiple Tests):
- T-test p-value: 0.00088
- Mann-Whitney U test p-value: 0.0050
- All three tests (including KS) are significant at p < 0.01
- The agreement across both parametric (t-test) and non-parametric (Mann-Whitney) tests strongly suggests these differences are real, not artifacts of the analysis method

3. **Effect Sizes** (Multiple Measures):
- Cohen's d: -0.96 (large negative effect)
- Point-biserial correlation: 0.31 (moderate positive correlation)
- These indicate not just statistically significant but practically meaningful differences

4. **Descriptive Statistics** (Early vs Late):
Early States:
- More negative mean/median (-0.042 median)
- Higher skewness (1.018), indicating right-tailed distribution
- Larger IQR (0.154), suggesting more variability

Late States:
- More positive median (0.081)
- Lower skewness (0.229), indicating more symmetrical distribution
- Smaller IQR (0.098), suggesting more consistency

5. **Electoral Impact**:
- Early states: 326 EVs across 45 states (-2.70% weighted margin)
- Late states: 212 EVs across 11 states (+8.59% weighted margin)
- Overall weighted margin: +1.75%
- The -11.29% margin difference between early/late states is substantial

Key Takeaways:
1. The differences are robust (confirmed by multiple statistical tests)
2. Early reporting states:
   - Show more variable results
   - Tend to lean negative
   - Have a more skewed distribution
3. Late reporting states:
   - Show more consistent results
   - Tend to lean positive
   - Have a more normal distribution
4. The difference is both statistically significant and practically large
5. This pattern could significantly impact election night interpretations, as early results might not be representative of the final outcome

"""

using DataFrames
using Statistics
using HypothesisTests
using StatsBase

function analyze_margin_groups(df::DataFrame)
    """
    Analyze states grouped by margin size categories and their reporting patterns.
    
    Parameters:
    - df: DataFrame with columns ev (electoral votes), margin (vote margin), harris (electoral outcome)
    
    Returns:
    - Dictionary with analysis results by margin group
    """
    
    # Create margin size categories
    function get_margin_category(margin)
        abs_margin = abs(margin)
        if abs_margin < 0.02  # Within 2%
            return "Very Close"
        elseif abs_margin < 0.05  # Within 5%
            return "Close"
        elseif abs_margin < 0.10  # Within 10%
            return "Moderate"
        else
            return "Decisive"
        end
    end
    
    # Add category columns
    df_analysis = DataFrame(df)
    df_analysis.margin_category = get_margin_category.(df_analysis.margin)
    df_analysis.is_early = df_analysis.harris .<= 10
    
    # Group analysis
    groups = groupby(df_analysis, :margin_category)
    
    results = Dict()
    
    for (category, group) in pairs(groups)
        early_group = filter(:is_early => x -> x, group)
        late_group = filter(:is_early => x -> !x, group)
        
        group_stats = Dict(
            "total_states" => nrow(group),
            "total_ev" => sum(group.ev),
            "mean_margin" => mean(group.margin),
            "early_states" => nrow(early_group),
            "early_ev" => sum(early_group.ev),
            "early_mean_margin" => nrow(early_group) > 0 ? mean(early_group.margin) : NaN,
            "late_states" => nrow(late_group),
            "late_ev" => sum(late_group.ev),
            "late_mean_margin" => nrow(late_group) > 0 ? mean(late_group.margin) : NaN,
            "margin_range" => (minimum(group.margin), maximum(group.margin))
        )
        
        # Add timing analysis
        if nrow(early_group) > 0 && nrow(late_group) > 0
            group_stats["timing_difference"] = mean(early_group.margin) - mean(late_group.margin)
            group_stats["early_vs_late_pvalue"] = pvalue(UnequalVarianceTTest(
                Float64.(early_group.margin), 
                Float64.(late_group.margin)
            ))
        end
        
        results[category] = group_stats
    end
    
    # Add overall summary
    results["overall"] = Dict(
        "total_states" => nrow(df),
        "total_ev" => sum(df.ev),
        "category_counts" => Dict(
            category => count(==(category), df_analysis.margin_category)
            for category in unique(df_analysis.margin_category)
        )
    )
    
    return results
end

margin_results = analyze_margin_groups(df)

