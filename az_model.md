+++
title = "Arizona Models"
+++

- **Median**: Half of the random samples have probabilities greater than and half less than the median.
- **Mean**: The average of the 10,000 random samples constructed. It coincides with the Biden Proportion in the table above.
- **Mode**: The probability that occurs most often.
- **q025**: The value below which 2.5% of the probabilities occur.
- **q975**: The value below which 97.5% of the probabilities occur.
- **MCSE**: Measures the precision of Markov Chain Monte Carlo (MCMC) estimates by quantifying the variability due to finite sampling. Smaller values indicate better precision. Values close to zero indicate that little of the variability in the estimate arises from using MCMC.
- **Rhat**: Assesses the convergence of MCMC chains by comparing within-chain and between-chain variances. Values close to 1 indicate convergence.

These diagnostics are used to assess usefulness of models using MCMC methods in determining whether the MCMC chains have run long enough to provide accurate and stable estimates of the posterior distributions.

The density plots show the number of observations on the $y$-axis and the probabilities on the $x$-axis. The shaded area in the center shows the credible interval within which 95% of the probabilities fall. The unshaded areas show that the proportion of the votes are likely to be either less than or greater than the credible interval.

## March
~~~
<table>
  <thead>
    <tr class = "header">
      <th style = "text-align: right;">median</th>
      <th style = "text-align: right;">mean</th>
      <th style = "text-align: right;">mode</th>
      <th style = "text-align: right;">q025</th>
      <th style = "text-align: right;">q975</th>
      <th style = "text-align: right;">mcse</th>
      <th style = "text-align: right;">rhat</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">0.5015</td>
      <td style = "text-align: right;">0.5015</td>
      <td style = "text-align: right;">0.5015</td>
      <td style = "text-align: right;">0.501</td>
      <td style = "text-align: right;">0.5021</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">0.9999</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/AZ_mar.png" style="width: 100%; display: block;">
~~~

## 2020 Election

~~~
<table>
  <thead>
    <tr class = "header">
      <th style = "text-align: right;">median</th>
      <th style = "text-align: right;">mean</th>
      <th style = "text-align: right;">mode</th>
      <th style = "text-align: right;">q025</th>
      <th style = "text-align: right;">q975</th>
      <th style = "text-align: right;">mcse</th>
      <th style = "text-align: right;">rhat</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">0.5016</td>
      <td style = "text-align: right;">0.5016</td>
      <td style = "text-align: right;">0.5015</td>
      <td style = "text-align: right;">0.501</td>
      <td style = "text-align: right;">0.5021</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">1.0002</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/AZ_2020.png" style="width: 100%; display: block;">
~~~