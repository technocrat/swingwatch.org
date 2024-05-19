+++
title = "Election of 2020"
+++

## Purpose

The model used to assess monthly polls begins with the assumption that the 2024 election will resemble the 2020 election in that

* Biden will win the same states as in 2020, except for seven swing states
* Trump will win the same states as in 2020, except for North Carolina

Models of the 2020 election for each of the seven swing states considers the number of votes won by Biden as a starting point. The results of each model will feed-forward as partial inputs to monthly poll models. In turn, the results of those will be input for subsequent months.

~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
      <th style = "text-align: right;">State</th>
      <th style = "text-align: right;">Biden Proportion</th>
      <th style = "text-align: right;">Biden Votes</th>
      <th style = "text-align: right;">Both Candidate Votes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">AZ</td>
      <td style = "text-align: right;">0.5016</td>
      <td style = "text-align: right;">1,672,143</td>
      <td style = "text-align: right;">3,333,829</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GA</td>
      <td style = "text-align: right;">0.5012</td>
      <td style = "text-align: right;">2,473,633</td>
      <td style = "text-align: right;">4,935,487</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI</td>
      <td style = "text-align: right;">0.5141</td>
      <td style = "text-align: right;">2,804,040</td>
      <td style = "text-align: right;">5,453,892</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV</td>
      <td style = "text-align: right;">0.5122</td>
      <td style = "text-align: right;">703,486</td>
      <td style = "text-align: right;">1,373,376</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NC</td>
      <td style = "text-align: right;">0.4932</td>
      <td style = "text-align: right;">2,684,292</td>
      <td style = "text-align: right;">5,443,067</td>
    </tr>
    <tr>
      <td style = "text-align: right;">PA</td>
      <td style = "text-align: right;">0.5059</td>
      <td style = "text-align: right;">3,458,229</td>
      <td style = "text-align: right;">6,835,903</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI</td>
      <td style = "text-align: right;">0.5032</td>
      <td style = "text-align: right;">1,630,866</td>
      <td style = "text-align: right;">3,241,050</td>
    </tr>
  </tbody>
</table>
~~~

## Explanation

- **Median**: Half of the random samples have probabilities greater than and half less than the median.
- **Mean**: The average of the 10,000 random samples constructed. It coincides with the Biden Proportion in the table above.
- **Mode**: The probability that occurs most often.
- **q025**: The value below which 2.5% of the probabilities occur.
- **q975**: The value above which 97.5% of the probabilities occur.
- **MCSE**: Measures the precision of Markov Chain Monte Carlo (MCMC) estimates by quantifying the variability due to finite sampling. Smaller values indicate better precision. Values close to zero indicate that little of the variability in the estimate arises from using MCMC.
- **R-hat**: Assesses the convergence of MCMC chains by comparing within-chain and between-chain variances. Values close to 1 indicate convergence.

These diagnostics are used to assess usefulness of models using MCMC methods in determining whether the MCMC chains have run long enough to provide accurate and stable estimates of the posterior distributions.

The density plots show the number of observations on the $y$-axis and the probabilities on the $x$-axis. The shaded area in the center shows the credible interval within which 95% of the probabilities fall. The unshaded areas show that the proportion of the votes are likely to be either less than or greater than the credible interval.

## Rationale

Although there will be a different electorate, for the reasons explained [here](/typology), most voters in 2024 are highly likely to have voted in 2020. A high degere of political polarization makes it likely that most of those voters will vote the same way. However, it is unrealistic to expect that they will vote exactly the same way. An approach to adjusting for this is to introduce mathematical uncertainty into the results of the 2020 election, explained in more detail [here](/prior).

## Results



### Pennsylvania

### Georgia

### North Carolina

### Michigan

### Arizona
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

### Wisconsin

### Nevada
