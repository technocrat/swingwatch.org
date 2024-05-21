+++
title = "The Beta Distribution"
+++

he Beta distribution is commonly used as a prior distribution in Bayesian analysis when the parameter of interest is a probability or a proportion. The Beta distribution is defined by two shape parameters, often denoted as α (alpha) and β (beta), which determine the shape and concentration of the distribution.

In a typical Bayesian analysis, the Beta distribution is used as a prior distribution based on prior knowledge or assumptions about the parameter of interest. The values of α and β are chosen to reflect the prior belief or information about the parameter. For example:

- If α = β = 1, the Beta distribution becomes a uniform distribution over the interval [0, 1], indicating no prior preference for any particular value.
- If α > 1 and β > 1, the Beta distribution is unimodal and concentrated around its mean, (α / (α + β)).
- If α < 1 and β < 1, the Beta distribution is bimodal, with peaks near 0 and 1.
- If α = 1 and β > 1 (or α > 1 and β = 1), the Beta distribution is monotonically decreasing (or increasing) over the interval [0, 1].

~~~
<img src="/assets/img/beta.png" style="width: 100%; display: block;">
~~~
For the polling model instead of specifying the α and β parameters directly based on prior knowledge, they are derived from the posterior distribution of the election results, initially for the March polling results and then the previous month's polling for subsequent months. This approach is known as "posterior updating" or "sequential updating."

The α and β parameters are derived from the previous posterior:

1. The mean (`posterior_mean`) and variance (`posterior_var`) of the posterior samples come from the previous analysis.

2. The mean and variance are used to compute the α and β parameters of the Beta distribution:

   ```julia
   		prior_alpha = posterior_mean * (posterior_mean * (1 - posterior_mean) / posterior_var - 1)
   
prior_beta = (1 - posterior_mean) * (posterior_mean * (1 - posterior_mean) / posterior_var - 1)
   ```

   These formulas are derived from the method of moments, which equates the theoretical moments of the Beta distribution (mean and variance) to the sample moments (posterior mean and variance).

Deriving the α and β parameters from the previous posterior, effectively incorporates the information learned from the previous analysis into the prior of the current analysis. The resulting Beta distribution will have a shape and concentration that reflects the posterior distribution of the previous analysis.

This approach differs from the typical use of the Beta distribution as a prior in the following ways:

1. The prior is not based on subjective prior knowledge or assumptions but rather on the results of a previous data analysis.
2. The prior is data-dependent and updated based on the observed data from the previous analysis.
3. The prior is more informative and concentrated around the values supported by the previous analysis, rather than being a diffuse or non-informative prior.

Using the posterior from a previous analysis to inform the prior of a current analysis is a powerful technique in Bayesian inference. It allows for the accumulation of knowledge and the updating of beliefs as new data becomes available. Deriving the Beta distribution parameters from the previous posterior leverages the information gained from the previous analysis to guide the current analysis, resulting in a more informative and data-driven prior distribution.