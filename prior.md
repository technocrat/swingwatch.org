+++
title = "The Bayesian Prior"
+++

The model considered two starting points—one in which the 2020 election was assumed to have been a Biden win from 0% to 100% of the votes in each swing state as being equally likely. This is known as a naive, or uninformative, prior. It is unreasonable to assume that it was to be expected that one candidate would take all votes. The other proceeded from the pre-election observation that the race in the swing states were largely within survey margin of error. Therefore, it was reasonable to expect that the results were more likely to have clustered around a 0.5 proportion of votes for Biden. 

Hypothetically, many contingencies could have affected voter turnout—voters who had intended to vote decided not to at the last minute due to conflicting committments. Other voters who had not intended to votes decided late to show up. This is one reason for adopting the 2020 results with some statistical noise as the starting point.

The main difference between using `Binomial(1, 1)` and `Binomial(2, 2)` as priors in a Bayesian analysis lies in the shape and concentration of the prior distribution. Let's discuss each case separately:

1. `Binomial(1, 1)` prior:
   - This prior is equivalent to a `Beta(1, 1)` distribution, which is a uniform distribution over the interval [0, 1].
   - It assigns equal probability to all possible values of the parameter between 0 and 1.
   - The `Binomial(1, 1)` prior is often referred to as a "flat" or "uninformative" prior because it does not express any strong prior belief or preference for any particular value of the parameter.
   - This prior is commonly used when there is little or no prior knowledge about the parameter, and all values are considered equally likely.
   - The posterior distribution obtained using this prior will be heavily influenced by the observed data.

2. `Binomial(2, 2)` prior:
   - This prior is equivalent to a `Beta(2, 2)` distribution, which has a symmetric bell-shaped curve with a peak at 0.5.
   - It assigns higher probability to values around 0.5 and lower probability to values near 0 and 1.
   - The `Binomial(2, 2)` prior expresses a prior belief that the parameter is more likely to be close to 0.5 compared to extreme values.
   - This prior is more informative than the `Binomial(1, 1)` prior because it incorporates some prior knowledge or expectation about the parameter.
   - The posterior distribution obtained using this prior will be a compromise between the prior belief and the observed data.

In summary, the choice between `Binomial(1, 1)` and `Binomial(2, 2)` as priors depends on the prior knowledge or belief about the parameter being estimated. If there is no strong prior information, the `Binomial(1, 1)` prior can be used as a non-informative prior, allowing the data to dominate the posterior distribution. On the other hand, if there is some prior expectation that the parameter is more likely to be around 0.5, the `Binomial(2, 2)` prior can be used to incorporate that prior belief into the analysis.
