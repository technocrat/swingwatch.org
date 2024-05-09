+++
title = "Statistical terms"
+++

- **Bayesian statistics**: Bayesian statistics is a branch of statistics that applies the principles of probability theory to update the probability estimates for hypotheses as new evidence or data becomes available. It is based on Bayes' theorem, which describes the conditional probability of an event occurring given prior knowledge of the event's probability.

The key principles of Bayesian statistics are:

1. Prior probability: This is the initial probability assigned to a hypothesis before observing any new data. It represents the existing knowledge or belief about the hypothesis.

2. Likelihood: This is the probability of observing the data given the hypothesis is true. It measures how well the data supports the hypothesis.

3. Posterior probability: This is the updated probability of the hypothesis after considering the new data. It is calculated by combining the prior probability and the likelihood using Bayes' theorem.

The fundamental equation of Bayesian statistics is:

Posterior probability = (Prior probability × Likelihood) / Marginal likelihood

Unlike frequentist statistics, which relies on repeated sampling and long-run frequencies, Bayesian statistics treats probabilities as degrees of belief or plausibility and updates those beliefs as new data becomes available. Bayesian methods allow for the incorporation of prior knowledge or expert opinion into the analysis, which can be valuable when dealing with limited data or complex problems.

Bayesian statistics finds applications in various fields, including machine learning, data analysis, decision theory, and scientific research, where it provides a coherent framework for quantifying uncertainty and making inferences based on observed data and prior information.

- **Central limit theorem**: The Central Limit Theorem (CLT) is a fundamental concept in statistics that explains the behavior of the means of random samples drawn from a population. In simple terms, the theorem states that when you take many large random samples from any population, the distribution of the sample means will approximate a normal distribution, *regardless* of the shape of the original population distribution.

Key points of the Central Limit Theorem:

1. Sample size: The theorem applies when the sample size is sufficiently large (usually n ≥ 30).

2. Population distribution: The original population can have any distribution (normal, skewed, bimodal, etc.).

3. Sample means distribution: If you draw many random samples of the same size from the population and calculate the mean for each sample, the distribution of these sample means will be approximately normal.

4. Parameters of the sample means distribution:
   - The mean of the sample means will be equal to the mean of the population.
   - The standard deviation of the sample means (also called the standard error) will be equal to the population standard deviation divided by the square root of the sample size.

Implications of the Central Limit Theorem:

1. Statistical inference: CLT allows researchers to make inferences about the population mean based on the sample mean, even when the population distribution is unknown or non-normal.

2. Confidence intervals: The normal distribution of sample means enables the calculation of confidence intervals for the population mean.

3. Hypothesis testing: Many statistical tests, such as the t-test and ANOVA, rely on the assumption of normality, which is justified by the CLT when sample sizes are large enough.

In summary, the Central Limit Theorem is essential because it provides a foundation for many statistical methods and allows researchers to make inferences about populations based on samples, even when the population distribution is unknown or non-normal.

- **Normal distribution**: A variable is said to be normally distributed if it follows a normal distribution, also known as a Gaussian distribution or a "bell curve." The normal distribution is a continuous probability distribution that is symmetric about its mean, with data points clustered around the mean and tapering off symmetrically as the distance from the mean increases. Many natural phenomena and variables, such as heights, weights, and test scores, often follow a normal distribution.

Key characteristics of a normal distribution:

1. Symmetry: The normal distribution is symmetric around its mean, with an equal number of data points on both sides of the mean.

2. Bell-shaped curve: When plotted, the normal distribution forms a bell-shaped curve, with the highest point at the mean and the curve tapering off symmetrically on both sides.

3. Mean, median, and mode: In a normal distribution, the mean, median, and mode are all equal and located at the center of the distribution.

4. Defined by mean and standard deviation: A normal distribution is fully described by its mean (μ) and standard deviation (σ). The mean determines the location of the center of the distribution, while the standard deviation measures the spread of the data points.

5. 68-95-99.7 rule: In a normal distribution, approximately 68% of the data points fall within one standard deviation of the mean, 95% within two standard deviations, and 99.7% within three standard deviations.

6. Infinite range: Theoretically, the normal distribution extends infinitely in both directions, although most of the data points are concentrated near the mean.

7. Central Limit Theorem: The normal distribution is crucial in statistics due to the Central Limit Theorem, which states that the sampling distribution of the mean of any independent, random variable will be normal or nearly normal, if the sample size is large enough.

Properties of the standard normal distribution:

1. Standard normal distribution: A special case of the normal distribution with a mean of 0 and a standard deviation of 1.

2. Z-scores: In a standard normal distribution, data points are often expressed as z-scores, which measure the number of standard deviations a data point is from the mean.

3. Probability calculations: The standard normal distribution allows for easy probability calculations using z-scores and standard normal tables or statistical software.

Understanding normal distributions is essential in statistics, as many inferential techniques, such as t-tests, ANOVA, and regression analysis, assume that the variables involved are normally distributed. When data is not normally distributed, researchers may need to use alternative methods or transform the data to meet the normality assumption.

- **Parameter**: A statistical parameter is a numerical summary measure that describes a characteristic of a population. Unlike a statistic, which is a summary measure calculated from a sample, a parameter represents a fixed value that is typically unknown and is estimated using sample data. Parameters are often denoted using Greek letters, such as μ (mu) for the population mean and σ (sigma) for the population standard deviation.

Key points about statistical parameters:

1. Population characteristic: A parameter describes a specific attribute of an entire population, such as its center, spread, or shape.

2. Fixed value: A parameter is a fixed, unknown value that does not change unless the population itself changes.

3. Estimation: Since measuring an entire population is often impractical or impossible, parameters are typically estimated using sample data and inferential statistics.

4. Inference: The goal of many statistical analyses is to use sample data to make inferences about population parameters.

5. Symbols: Parameters are usually represented by Greek letters to distinguish them from sample statistics, which are typically denoted by Latin letters (e.g., x̄ for sample mean, s for sample standard deviation).

Examples of common statistical parameters:

1. Population mean (μ): The arithmetic average of all values in a population.

2. Population variance (σ²): The average of the squared deviations from the population mean.

3. Population standard deviation (σ): The square root of the population variance, measuring the spread of values around the mean.

4. Population proportion (p): The fraction or percentage of the population that possesses a specific characteristic.

5. Population correlation coefficient (ρ): A measure of the linear relationship between two variables in a population.

In practice, researchers use sample data to calculate statistics, which are then used to estimate the corresponding population parameters. For example, a sample mean (x̄) can be used to estimate the population mean (μ). Inferential statistics, such as confidence intervals and hypothesis tests, help quantify the uncertainty associated with these estimates and allow researchers to make informed conclusions about population parameters based on sample data.

- **Sample space**: In probability theory, a sample space is the set of all possible outcomes of a random experiment or a probability experiment. It is usually denoted by the symbol "S" or "Ω" (omega).

Key points about sample space:

1. **Exhaustive** The sample space must include all possible outcomes of the experiment. No outcome should be left out.

2. **Mutually exclusive**: The outcomes in the sample space should be distinct and non-overlapping. The occurrence of one outcome means that no other outcome has occurred.

- **Selection bias**: The sample is not representative of the population due to the method of selection. Selection bias is a type of bias that occurs when the sample chosen for a study is not representative of the population intended to be analyzed. This can happen when the selection process favors some individuals or groups over others, leading to a sample that systematically differs from the target population. As a result, the findings based on the biased sample may not be generalizable to the entire population.

Types and causes of selection bias:

1. Sampling bias: This occurs when the method used to select the sample is not truly random, leading to over- or under-representation of certain groups. For example, a telephone survey that only calls landlines may underrepresent younger individuals who primarily use mobile phones.

2. Self-selection bias: This happens when individuals voluntarily participate in a study, and those who choose to participate differ from those who do not. For instance, people with strong opinions on a topic may be more likely to respond to a survey about that topic, leading to a biased sample.

Consequences of selection bias:

1. Reduced generalizability: Findings based on a biased sample may not be applicable to the entire population, limiting the study's external validity.

2. Inaccurate conclusions: Selection bias can lead to overestimating or underestimating the true effect of an intervention or the prevalence of a condition in the population.

3. Flawed decision-making: Policies or decisions based on biased research may be ineffective or even harmful.

To minimize selection bias, researchers should:

1. Use truly random sampling methods when possible.
2. Clearly define the target population and eligibility criteria.
3. Monitor and address issues of non-response and attrition.
4. Use statistical methods to adjust for known biases in the sample.
5. Be transparent about the study's limitations and potential sources of bias.

By understanding and addressing selection bias, researchers can improve the quality and reliability of their findings, leading to more accurate conclusions and better-informed decision-making.

- **Simple random sampling error**: Also known as sampling error, it is the difference between a sample statistic and the corresponding population parameter due to the inherent variability that arises from randomly selecting a subset of the population. This error occurs because a sample, even when randomly selected, may not perfectly represent the entire population,**even a population that is normally distributed**, leading to estimates that differ from the true population values.

Key points about simple random sampling error:

1. Inherent variability: Sampling error is an unavoidable consequence of using a sample to estimate population parameters, as no sample can perfectly mirror the population.

2. Random sampling: Simple random sampling error occurs when a sample is selected using a random process, ensuring that each member of the population has an equal chance of being included in the sample.

3. Sample size: Generally, larger sample sizes tend to have smaller sampling errors, as they are more likely to be representative of the population.

4. Variability: Sampling error is a measure of the variability between different samples drawn from the same population.

5. Estimation: Sampling error affects the accuracy of estimates made about population parameters based on sample statistics.

6. Confidence intervals: Sampling error is often quantified using confidence intervals, which provide a range of plausible values for the population parameter based on the sample data and the desired level of confidence.

7. Margin of error: The margin of error is a common way to express sampling error, representing the maximum expected difference between the sample statistic and the population parameter at a given confidence level.

Factors affecting simple random sampling error:

1. Sample size: Increasing the sample size generally reduces sampling error, as larger samples are more likely to be representative of the population.

2. Population variability: More heterogeneous populations tend to have larger sampling errors, as a sample is less likely to capture all the variability in the population.

3. Sampling design: While simple random sampling is designed to minimize bias, other sampling methods (e.g., stratified sampling) may be used to reduce sampling error by ensuring that important subgroups are adequately represented in the sample.

It is important to note that sampling error is distinct from other sources of error in a study, such as measurement error or non-response bias. While sampling error is an inherent part of using samples to make inferences about populations, researchers can minimize its impact by using appropriate sampling methods, increasing sample sizes when feasible, and reporting the uncertainty associated with their estimates using confidence intervals or margins of error.

- **Statistical bias**: A systematic error that results in a difference between the true value (or ground truth) of a statistical parameter and its estimated value obtained from a sample. This can arise from sources of data collection, analysis, or interpretation, leading to results that are not representative of the entire population. Bias affects the validity and reliability of conclusions drawn from a statistical method. In the analysis of presidential preference poll results, some measure can be captured by an allowance for **design error** that affects the data collection process.


