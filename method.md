+++
title = "Methodology"
+++

## How the likelihood model is made

Among many other facts, one thing is known about the 2020 election in the seven swing states to a high degree of certainty—the [definitive outcomes](https://www.archives.gov/electoral-college/2020) in terms of the votes for the two top candidates and the number of electoral votes awarded. Under the rule of thumb that the future will look similar to the immediate past plus or minus a little, those outcomes provide a *starting* point for further analysis.

Subject to all the infirmities inherent in political preference polling, the results of swing state specific polling provides additional, provisional information about the 2024 election. The responses of polled voters to questions concrerning the relative level of support enjoyed by the two candidates for any recent period is, at least, some indictor of how the actual outcome should be expected. For this situation we can adjust the results of the 2020 election based on currrent presidential preference primary polling through a process known as **Bayesian modeling**. 

Here is a short [chatGPT](https://open.ai) summary:

Bayesian modeling is a statistical approach that provides a flexible way of learning from data. Unlike traditional statistics, which often starts from the assumption that nothing is known until data is observed, Bayesian modeling begins with prior beliefs or existing knowledge about what the results *might* be. These beliefs are then updated with new data to form more refined conclusions.

Here’s how it works: Imagine you're trying to guess the number of candies in a jar. Before counting or seeing inside the jar, you might already have a rough idea based on your past experiences with similar jars—this is your "prior" belief. As you observe or gather more information (perhaps by looking at how many layers of candies there seem to be), you update your original guess. This process of updating is based on Bayes' theorem, which mathematically combines your prior beliefs with the new evidence.

The result is a "posterior" probability, which tells you how likely different candy counts are, *given* both your initial guess and whatever new information you've gathered. Over time, as more data is collected, your posterior probabilities get sharper and more focused, leading you to a more precise estimation. 

Bayesian modeling is particularly powerful because it can adapt to complex real-world problems, incorporate uncertainty explicitly, and handle various types of data. It's widely used in fields ranging from genetics to economics, helping experts make better decisions under uncertainty.

## Rationale for selecting a Bayesian model

The 2024 electorate will not be identical to the 2020 electorate but it *will be* similar. 

Several types of voters can be considered.

### Voters who did not vote in 2020 and will not vote in 2024
	
* Died
* Moved away
* Incarcerated
* Still too young
* Still politically unengaged

### Voters who did not vote in 2020 but will vote in 2024

* Became eligible
	  - Turned 18
		- Moved to state
* Became politically engaged

### Voters who voted in 2020 but will not vote in 2024

* Died
* Moved away
* Incarcerated
* Became politically unengaged

### Voters who voted in 2020 and will vote again in 2024
* Still politically engaged

#### Voters who will vote differently
* Changed view of candidate
* Different issues came to the fore
#### Voters who will vote the same
* No change in view of candidate
* Different mix of issues in 2024 did not affect choice

The main purpose of selecting a Bayesian model for analyzing presidential preference polling in light of actual votes from a swing state in the 2020 election is to effectively incorporate both prior knowledge and new data to update beliefs about the likely outcomes. Bayesian models are particularly suited for this task due to several key features and advantages that align well with the complexities of electoral predictions.

### Advantages of Bayesian Models in Electoral Analysis

#### 1. **Incorporation of Prior Information**
Bayesian models uniquely allow the incorporation of prior distributions, which represent previous knowledge or beliefs before observing new data. This is particularly useful in electoral analysis where past election results, demographic shifts, and historical voting patterns can provide a substantive basis for current predictions[1][2][3]. For instance, understanding how a swing state has voted in past elections can set a baseline expectation, which is then updated as new polling data becomes available.

#### 2. **Updating Beliefs with New Data**
As new polling data is collected, Bayesian inference provides a systematic method for updating the probability of an event (such as a candidate winning) based on this new evidence[1][2]. This is done through the calculation of a posterior distribution, which combines the prior distribution and the likelihood of the new data. This feature is crucial in the dynamic environment of an election cycle where voter opinions can shift rapidly due to various factors such as debates, political campaigns, or national events.

#### 3. **Handling of Uncertainty and Variability**
Bayesian models explicitly account for uncertainty in the model parameters and predictions. This is achieved through probability distributions rather than single-point estimates, allowing for a more nuanced understanding of the range of possible outcomes[1][2][3]. This probabilistic nature is particularly advantageous in predicting elections in swing states where small changes in voter preferences can have a large impact on the outcome.

#### 4. **Flexibility in Model Complexity**
Bayesian methods are scalable in terms of model complexity. They can start from simple models and extend to very complex hierarchical models that can incorporate various levels of data aggregation — from national down to county-level data[2][3]. This flexibility allows analysts to tailor models specifically to the intricacies of a particular election, considering factors like demographic changes, new voter registrations, and shifts in political engagement.

#### 5. **Improved Predictive Performance**
Research has shown that Bayesian models can outperform other statistical methods in certain contexts by making more accurate predictions[4]. This is particularly relevant in the volatile context of swing states, where traditional models might fail to capture the full spectrum of dynamics affecting voter behavior.

### Application to Swing State Analysis

Given the variability and the unique characteristics of swing state electorates, Bayesian models are particularly well-suited for analyzing changes between the 2020 and 2024 electorates. They can effectively account for new voters, changes in political engagement, and shifts in voter preferences over time. This adaptability is crucial in swing states where the electorate may not only be different from the last election cycle but could also be highly responsive to the current political climate.

In summary, the selection of a Bayesian model for analyzing presidential preference polling in a swing state context is justified by its ability to incorporate prior knowledge, update beliefs with new data, handle uncertainty, adapt to varying levels of complexity, and potentially offer superior predictive performance. These features make Bayesian models a robust tool for navigating the complexities of electoral predictions in dynamically changing political landscapes[1][2][3][4].

Citations:
[1] https://www.causeweb.org/usproc/sites/default/files/usresp/2017-1/CAUSEContestPaper.pdf
[2] https://ea-staging.web.engr.illinois.edu/site/file/Rigdon2009.pdf
[3] https://www.siam.org/Portals/0/Publications/SIURO/Vol12/S01616.pdf?ver=2019-02-12-215230-620
[4] https://datascience.virginia.edu/projects/forecasting-2020-presidential-election-comparison-methods
[5] https://arxiv.org/html/2104.02924v2
[6] https://www.uv.es/~bernardo/Coimbra.pdf
[7] https://hdsr.mitpress.mit.edu/pub/nw1dzd02/release/2
[8] http://www.stat.columbia.edu/~gelman/research/published/bernardo.pdf
[9] https://pyro.ai/examples/elections.html
[10] https://projects.economist.com/us-2020-forecast/president/how-this-works
[11] https://www.cambridge.org/core/journals/political-analysis/article/abs/polls-context-and-time-a-dynamic-hierarchical-bayesian-forecasting-model-for-us-senate-elections/1833074B3BEBC0E36912FBFF3437A974
[12] https://blogs.lse.ac.uk/lseupr/2023/02/03/guide-to-understanding-the-basics-of-bayesian-inference-in-political-science/
[13] https://www.researchgate.net/publication/253938540_A_Bayesian_Prediction_Model_for_the_US_Presidential_Election
[14] https://www.jstor.org/stable/25792016
[15] https://journals.sagepub.com/doi/10.1177/1532673X08330670
[16] https://www.sciencedirect.com/science/article/abs/pii/S0176268018302398

To support the assumption that the 2024 electorate, while changed, will still largely consist of the same voters as in 2020, thereby making the 2020 data relevant, we can consider several key data points and trends identified in recent studies and reports:

### 1. **High Voter Turnout Trends**
Historical data shows that recent elections have seen high voter turnout rates. For instance, the 2020 presidential election had a turnout of about 66% of the voting-eligible population, the highest rate since 1900[1]. This trend suggests a high level of voter engagement that may continue into 2024, implying that many of the same voters from 2020 are likely to vote again.

### 2. **Demographic Stability Among Frequent Voters**
Studies have shown that certain demographic groups that vote consistently tend to do so across multiple election cycles. For example, older voters and those with higher educational attainment have been shown to vote more consistently[4][9]. Since these groups formed a significant part of the electorate in 2020, it's likely they will again in 2024.

### 3. **Party Affiliation and Voter Loyalty**
Data indicates that party affiliation is a strong predictor of voter turnout, with individuals who identify strongly with a party more likely to vote consistently[9]. Given the polarized nature of current U.S. politics, it's reasonable to assume that those who voted in 2020 will feel compelled to vote again in 2024 to support their party.

### 4. **Impact of Key Voter Segments**
Certain segments of the electorate, such as young voters and minority groups, have shown varying trends in voter turnout and party affiliation. For instance, while young voters (ages 18-29) have fluctuated in their turnout, a significant portion of them who voted in 2020 are likely to vote again in 2024, driven by major issues such as economic concerns and climate change[19]. Similarly, while there has been a shift in the voting patterns of Latino and Black voters, the majority still support the same party as in previous elections[2].

### 5. **Changes in Voter Eligibility and Engagement**
Between 2020 and 2024, new voters have become eligible (those turning 18), and some voters have become disengaged or ineligible due to various reasons (death, disinterest, or legal disqualifications). However, the core of the electorate—those consistently engaged and eligible—remains relatively stable[1][2].

### 6. **Geographical Stability in Voting Patterns**
While there may be shifts in which states are considered battlegrounds, historical voting patterns in many states remain relatively consistent from one presidential election to the next. This geographical stability suggests that the same demographic groups are likely to participate in 2024 as in 2020, particularly in states with high voter turnout[6].

### 7. **Continued Polarization and High-Profile Issues**
The ongoing polarization in U.S. politics and the presence of high-profile issues, such as the Supreme Court decisions and federal policy changes, are likely to motivate previous voters to remain active in the electoral process[1][2].

In conclusion, while there are always new voters entering the electorate and some leaving, a significant core of the 2020 voters is likely to remain active in 2024. This continuity, driven by high engagement levels, consistent demographic participation, and ongoing polarizing issues, supports the assumption that analyzing 2020 election data can provide valuable insights for predicting the 2024 election outcomes[1][2][4][6][9][19].

Citations:
[1] https://nymag.com/intelligencer/article/2024-turnout-apathy-biden-trump.html
[2] https://abcnews.go.com/538/demographic-swings-impact-2024-election/story?id=108700434
[3] https://www.pewresearch.org/short-reads/2022/11/01/turnout-in-u-s-has-soared-in-recent-elections-but-by-some-measures-still-trails-that-of-many-other-countries/
[4] https://www.pewresearch.org/politics/2023/07/12/voter-turnout-2018-2022/
[5] https://www.brookings.edu/articles/how-younger-voters-will-impact-elections-what-happened-in-the-gop-debate/
[6] https://smartasset.com/data-studies/voter-turnout-2024
[7] https://www.washingtonpost.com/politics/2023/07/12/voting-demographics-democrats-republicans/
[8] https://www.texastribune.org/2024/03/03/early-voting-turnout-2024-primaries/
[9] https://www.pewresearch.org/politics/2023/07/12/demographic-profiles-of-republican-and-democratic-voters/
[10] https://bipartisanpolicy.org/report/election-official-turnover-rates-from-2000-2024/
[11] https://www.census.gov/newsroom/press-releases/2024/congressional-election-voting-report.html
[12] https://www.npr.org/2024/01/25/1226102913/young-voters-focus-more-on-issues-than-candidates-in-2024-presidential-election
[13] https://www.nytimes.com/2024/02/25/magazine/2024-election-nonvoters.html
[14] https://circle.tufts.edu/2024-election-youth-poll
[15] https://cawp.rutgers.edu/facts/voters/gender-differences-voter-turnout
[16] https://www.nbcnews.com/politics/elections/election-worker-turnover-historic-high-2024-vote-rcna145833
[17] https://www.washingtonpost.com/politics/2023/12/05/fewer-voters-harvard-youth-poll/
[18] https://www.cbsnews.com/news/trump-absentee-mail-voting/
[19] https://iop.harvard.edu/youth-poll/47th-edition-spring-2024
[20] https://www.sos.wa.gov/elections/data-research/election-data-and-maps/reports-data-and-statistics