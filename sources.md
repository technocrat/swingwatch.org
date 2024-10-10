+++
title = "Sources"
+++

## 2020 election data

* [Official returns](https://www.archives.gov/electoral-college/2020)
* [Full 2020 election results](https://www.wikiwand.com/en/2020_United_States_presidential_election#Results_by_state 2024-03-16)[^1]
* [2020 election in CSV format](https://gist.githubusercontent.com/technocrat/18810a6c1c3d6d2c443876f06df0ad28/raw/a4b7ebf2d6429c5224417a133caa61dedfaa433e/2020vote.csv)
---
```julia
using CSV
using DataFrames
using HTTP

# URL of the raw CSV file from the GitHub Gist
gist_url = "https://gist.githubusercontent.com/technocrat/18810a6c1c3d6d2c443876f06df0ad28/raw/a4b7ebf2d6429c5224417a133caa61dedfaa433e/2020vote.csv"

# Fetch the CSV data from the Gist URL
csv_data = HTTP.get(gist_url).body

# Read the CSV data into a DataFrame
df = CSV.read(IOBuffer(csv_data), DataFrame)

# Now `df` contains the data from the CSV file
```
* [2024 Electoral College vote allocations](https://www.archives.gov/electoral-college/allocation)[^2]
* [2020 election popular vote using 2024 Electoral College vote allocation](https://raw.githubusercontent.com/technocrat/swingwatch.org/main/_assets/objs/2024vote.csv)

---
[^1]: Wikiwand is a Wikipedia reader showing the same content.]
[^2]: The 2020 election used the 2010 Census to allocate the Electoral College results among the states, and the 2024 election will use the 2024 Census. Seventeen states were affected through losing or gaining votes. [See summary.](http://swingwatch.org/changes/)

---

## Polls used[^3]

[Links to original sources were collected from RealClearPolling.com](https://www.realclearpolling.com/latest-polls/election) Results were taken from the summary tables for each swing state and had to include the number of respondents ($N$). 

* [Pennsylvania](https://www.realclearpolling.com/polls/president/general/2024/pennsylvania/trump-vs-harris)
* [Georgia](https://www.realclearpolling.com/polls/president/general/2024/pennsylvania/trump-vs-harris)
* [North Carolina](https://www.realclearpolling.com/polls/president/general/2024/north-carolina/trump-vs-harris)
* [Michigan](https://www.realclearpolling.com/polls/president/general/2024/michigan/trump-vs-harris)
* [Arizona](https://www.realclearpolling.com/polls/president/general/2024/arizona/trump-vs-harris)
* [Wisconsin](https://www.realclearpolling.com/polls/president/general/2024/wisconsin/trump-vs-harris)
* [Nevada](https://www.realclearpolling.com/polls/president/general/2024/nevada/trump-vs-harris)

## Demographics

The U.S. Census Bureau's American Community Survey (ACS) is an ongoing survey that provides vital information on a yearly basis about the United States and its people. U.S. Census Bureau, 2022 American Community Survey 1-Year Estimates offers a snapshot of various demographic, social, economic, and housing characteristics across the nation.

Key points about the data source:

1. Conducted by the U.S. Census Bureau: The ACS is administered by the U.S. Census Bureau, which is the primary government agency responsible for collecting and providing data about the American people and economy.

2. Annual survey: Unlike the decennial census, which is conducted every ten years, the ACS is conducted annually, providing more up-to-date information on the U.S. population.

3. Representative sample: The ACS surveys a representative sample of the population, and the data is then weighted to produce estimates for the entire population.

4. 1-Year Estimates: The 1-Year Estimates provide data for geographic areas with populations of 65,000 or more. These estimates are the most current but have a larger margin of error compared to 5-Year Estimates due to the smaller sample size.

5. Wide range of topics: The ACS collects data on various subjects, including demographics, education, employment, income, housing, and more.

## AI research and drafting aids

* [Claude Opus](https://claude.ai)
* [Copilot](https://bing.com)
* [GPT-4](https://perplexity.ai)


