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

[Links to original sources were collected from RealClearPolling.com](https://www.realclearpolling.com/latest-polls/election) Results were taken from the most detailed reports found and had to include the number of respondents ($N$). In cases where presidential preference questions were directed to subgroups, the applicable $N$ was applied.

*Multistate*

  - [Bloomberg/Morning Consult: conducted April](https://pro-assets.morningconsult.com/wp-uploads/2024/04/Bloomberg_2024-Election-Tracking-Wave-7.pdf)
  - [Bloomberg/Morning Consult: conducted March](https://pro-assets.morningconsult.com/wp-uploads/2024/03/Bloomberg_2024-Election-Tracking-Wave-6.pdf) 
  - [Emerson College: conducted April](https://emersoncollegepolling.com/trump-holds-edge-over-biden-in-seven-key-swing-state-polls/)
  - [Emerson College: conducted March](https://emersoncollegepolling.com/category/state-poll/)
  - [Wall Street Journal: conducted March ]((https://s.wsj.net/public/resources/documents/WSJ_Swing_States_Partial_March_2024.pdf))

---

*Single State*

* Arizona
  - [Fox News: conducted March](https://static.foxnews.com/foxnews.com/content/uploads/2024/03/Fox_March-7-11-2024_Arizona_Topline_March-13-Release.pdf)
* Georgia
  - [Fox News: conducted April](https://static.foxnews.com/foxnews.com/content/uploads/2024/04/Fox_April-11-16-2024_GEORGIA_Topline_April-18-Release-1.pdf)
* Michigan
  - [CBS: conducted in April](https://www.scribd.com/document/727317994/Cbsnews-20240428-MI-SUN)
  - [Fox News: conducted April](https://static.foxnews.com/foxnews.com/content/uploads/2024/04/Fox_April-11-16-2024_MICHIGAN_Topline_April-18-Release.pdf)
  - [Marketing Resource Group: conducted April](https://www.realclearpolitics.com/docs/2024/michigan-poll-presidential-election-Press_Release.pdf)
  - [Mitchell Research and Communications: conducted March](https://www.realclearpolitics.com/docs/2024/Mitchell-MIRS_MI_Poll_Press_Release_-_Presidential_Race_12_NOON_3-20-24.pdf)
  - [Quinnipiac University: conducted March](https://poll.qu.edu/poll-release?releaseid=3893)
* Pennsylvania
  - [CBS: conducted April](https://www.scribd.com/document/727318459/Cbsnews-20240428-PA-SUN)
  - [Franklin & Marshall College Poll: conducted March](https://www.fandmpoll.org/franklin-marshall-poll-release-april-2024)
* North Carolina
  -  [Marist: conducted March ](https://maristpoll.marist.edu/wp-content/uploads/2024/03/Marist-Poll_North-Carolina-NOS-and-Tables_202403181357.pdf)
  - [Highpoint University: conducted March](https://www.highpoint.edu/src/files/2023/08/102memo.pdf)\
  - [Mason-Dixon: conducted April](https://thehill.com/homenews/campaign/4603458-trump-leads-biden-in-north-carolina-poll/)
  - [Quinnipiac: conducted April](https://poll.qu.edu/images/polling/nc/nc04102024_ncaa99.pdf)
  - [WRAL: conducted March](https://wwwcache.wral.com/asset/news/state/nccapitol/2024/03/12/21325738/3247050-Poll_Report_-_PollPrint-DMID1-628w54pob.pdf)
* Wisconsin
    - [CBS: conducted April](https://www.scribd.com/document/727319278/Cbsnews-20240428-WI-SUN)
  - [Fox News: conducted April](https://static.foxnews.com/foxnews.com/content/uploads/2024/04/b002d3b3-Fox_April-11-16-2024_WISCONSIN_Topline_April-18-Release.pdf)
---
[^3]: Results selected for analysis here are for two-way preference questions if asked, except in cases in which a third-party candidate qualified for the ballot prior to poll. For polls with only multiple choices in addition to Biden and Trump, their respective percentages of responses were recorded. In all cases those percentages were normalized to 100% to reflect the relative, not absolute, support of the two candidates.
---
## AI research and drafting aids

* [Claude Opus](https://claude.ai)
* [Copilot](https://bing.com)
* [GPT-4](https://perplexity.ai)
