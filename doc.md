+++
title = "Resources"
+++

## Sources

### 2020 election data

* [Official returns](https://www.archives.gov/electoral-college/2020)
* [Full 2024 election results](https://www.wikiwand.com/en/2020_United_States_presidential_election#Results_by_state 2024-03-16)[^1]

### Polls selected

* [2024-03-24 Bloomberg/Morning Consult](https://pro-assets.morningconsult.com/wp-uploads/2024/03/Bloomberg_2024-Election-Tracking-Wave-6.pdf) 

* [Emerson College](https://emersoncollegepolling.com/category/state-poll/)

* [2024-04-04 Franklin & Marshall College Poll](https://www.fandmpoll.org/franklin-marshall-poll-release-april-2024)

* [Quinnipiac University Poll](https://poll.qu.edu/poll-release?releaseid=3889)

### Other pollsters

* [Civiqs](https://civiqs.com/reports)
* [Gallup](https://news.gallup.com/610757/2024-presidential-election-center.aspx)
* [Ipsos and Reuters](https://www.ipsos.com/en-us/latest-us-opinion-polls#uselection)
* [Mainstream Research/Florida Atlantic University](https://www.faupolling.com/polls/)
* [Monmouth University Polling Institute](https://www.monmouth.edu/polling-institute/reports/monmouthpoll_pa_110322/)
* [Muhlenberg College Institute of Public Opinion](https://www.muhlenberg.edu/aboutus/polling/)
* [NBC News](https://www.nbcnews.com/politics/meet-the-press/polls)
* [Public Policy Polling (PPP)](https://www.publicpolicypolling.com/polls/?search=pennsylvania)
* [Rasmussen Reports](http://www.rasmussenreports.com/) 
* [Susquehanna Polling and Research](https://twitter.com/SusquehannaPR/status/1749803436911268065?ref_src=twsrc%5Etfw%7Ctwcamp%5Eembeddedtimeline%7Ctwterm%5Escreen-name%3ASusquehannaPR%7Ctwcon%5Es1)
* [The Washington Post](https://www.washingtonpost.com/politics/polling/)
* [Zogby](https://zogbyanalytics.com/images/za101923/Frequencies%20Zogby%20Voters%20101723.pdf)

[Links to others collected as they come out.](https://www.realclearpolling.com/latest-polls/election)

## Polling

### Glossary of terms

- **Term 1**: Definition for term 1.
- **Term 2**: Definition for term 2.
- **Term 3**: Definition for term 3.

* Bias
* Random sample
* Probability based sampling
* Online
* Opt-in
* Panels
* Tracking polls
* Interactive voice response (IVR)
* Ground truth
* Weighting
* Margin of error
* Design error
* Poll aggregation

### Sample space

In probability theory, a sample space is the set of all possible outcomes of a random experiment or a probability experiment. It is usually denoted by the symbol "S" or "Ω" (omega).

Key points about sample space:

1. **Exhaustive**: The sample space must include all possible outcomes of the experiment. No outcome should be left out.

2. **Mutually exclusive**: The outcomes in the sample space should be distinct and non-overlapping. The occurrence of one outcome means that no other outcome has occurred.

Examples:
- Tossing a fair coin: The sample space is S = {Heads, Tails}.
- Rolling a six-sided die: The sample space is S = {1, 2, 3, 4, 5, 6}.
- The time until a light bulb burns out: The sample space is S = [0, ∞), i.e., any non-negative real number.

Understanding the sample space is crucial for calculating probabilities and analyzing random experiments. It provides the foundation for defining events and their probabilities, which are essential concepts in probability theory.

Via [claude.ai](https://claude.ai) and checked by Richard Careaga

### Poll aggregation

Combining the results of multiple polls, also known as "poll aggregation," is a common practice to improve the accuracy and reliability of the overall estimate. There are several methods to do this, and the choice depends on factors such as the number of polls, their sample sizes, and the consistency of their results. Here are a few common approaches:

1. Simple average: Calculate the average percentage for each candidate across all polls. This method treats all polls equally, regardless of their sample size or quality.

2. Weighted average: Assign weights to each poll based on factors such as sample size, recency, or pollster rating, and then calculate the weighted average for each candidate. This method gives more importance to polls considered more reliable or representative. This is the method used to report aggregated swing state polls on the [home page](../index).

3. Inverse variance weighting: Weight each poll by the inverse of its variance (which is related to the margin of error). This method gives more weight to polls with smaller margins of error, as they are considered more precise. This is not currently being done because margins of error are similar.

4. Bayesian aggregation: Use a Bayesian model to estimate the probability distribution of the true proportion of support for each candidate, considering the results and uncertainty of each poll. This method can incorporate prior information and account for various sources of uncertainty. This is being done to arrive at an overall likelihood based on currrent polling in light of the 2020 results.

To combine the polls using the inverse variance weighting method:

1. For each poll, calculate the variance (v) from the margin of error (MOE) and the sample size (N): v = (MOE / (2 * z))^2, where z is the z-score corresponding to the confidence level (e.g., 1.96 for a 95% confidence level).

2. Calculate the weight (w) for each poll: w = 1 / v.

3. For each candidate, calculate the weighted average of their percentages across all polls: weighted_average = sum(w * percentage) / sum(w).

The resulting weighted averages will be your combined estimate of the support for each candidate, taking into account the precision of each poll. Keep in mind that poll aggregation has its limitations and should be interpreted cautiously, as it cannot account for all sources of bias or uncertainty in the individual polls.

### Recent developments in polling methods

Summary by [claude.ai](https://claude.ai) of [Pew article on changing polling methods](https://www.pewresearch.org/methods/2023/04/19/how-public-polling-has-changed-in-the-21st-century/)

Here is a summary of the key points from the Pew Research Center report on how public polling has changed in the 21st century:

- 61% of national pollsters in the U.S. used polling methods in 2022 that differed from the methods they used in 2016. More pollsters made changes to their methods after the 2020 election compared to after 2016.

- There has been significant growth in pollsters using multiple methods, sometimes three or more different methods. In 2022, 17% of national pollsters used at least three different sampling/interviewing methods, up from 2% in 2016. 

- Use of live telephone polling has declined rapidly since 2012. In 2022, 10% of national pollsters used live phone as their only method while 32% used it alone or combined with other methods.

- Online polling grew tremendously between 2006-2020, but that growth appears to have slowed or stopped in 2022. 

- Use of probability-based online panels recruited from address-based sampling has become more prevalent, tripling from 2016 to 2022.

- Some newer methods like text message polling and registration-based sampling have seen upticks in usage in recent years.

- Overall, the report finds the polling industry has entered a period of unprecedented diversity in sampling and interviewing methods compared to the live telephone polling that dominated in the early 2000s. However, whether these changes will translate into improved accuracy remains to be seen.

## Bias and other issues

### Bias defined

#### Opt in

##### Mail in polls

Summary by [claude.ai](https://claude.ai) of [Vox article on online opt-in surveys](https://apple.news/AsrnEXd30TQ216J0XKX4Bqw)

The article discusses the potential issues with using online opt-in surveys for research, where participants are incentivized with rewards to complete surveys. Key points include:

1. Opt-in surveys can lead to skewed results, such as overestimating fringe beliefs or the percentage of people holding certain qualifications, especially among younger respondents.

2. The quality of data collected through these surveys is questionable, as participants may speed through surveys to earn money, leading to inaccurate responses.

3. Researchers use online opt-in surveys because they are cheaper, faster, and more convenient than probability-based surveys, despite potential data quality issues.

4. A study found that a significant portion of respondents in an opt-in survey may have misrepresented their background to qualify for the survey and earn money.

5. Researchers can minimize bogus responses by using attention checks, IP tracking, anti-bot software, and monitoring survey completion time. However, some low-quality responses may still slip through.

6. Alternative models, such as opt-in volunteer surveys, can create different incentives for participants that don't rely on financial rewards.

7. Researchers should be transparent about their data collection methods to help contextualize the results of online opt-in surveys.

## Code

[Julia code used in the preparation](https://github.com/technocrat/swingwatch.org:)

## Further Reading

[Shirani-Mehr, H., Rothschild, D., Goel, S., & Gelman, A. (2018). Disentangling Bias and Variance in Election Polls. Journal of the American Statistical Association, 113(522), 607–614.]( https://doi.org/10.1080/01621459.2018.1448823)


[^1]: Wikiwand is a Wikipedia reader showing the same content.]