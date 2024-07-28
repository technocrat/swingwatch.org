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
  - [Bloomberg/Morning Consult: conducted May](https://pro-assets.morningconsult.com/wp-uploads/2024/05/Bloomberg-Election-Tracking-Wave-8-Toplines-Crosstabs.pdf)
  - [Bloomberg/Morning Consult: conducted March](https://pro-assets.morningconsult.com/wp-uploads/2024/03/Bloomberg_2024-Election-Tracking-Wave-6.pdf) 
  - [Bloomberg/Morning Consult: conducted July pre-July](https://pro-assets.morningconsult.com/wp-uploads/2024/07/Bloomberg-Election-Tracking-Wave-9-Toplines-Crosstabs.pdf)
  - [Emerson College: conducted June](https://docs.google.com/spreadsheets/d/1vGeTKW3MRDR5dXHM2IjM8ORz7HOyP5Le/edit?gid=532631346#gid=532631346)
  - [Emerson College: conducted April](https://emersoncollegepolling.com/trump-holds-edge-over-biden-in-seven-key-swing-state-polls/)
  - [Emerson College: conducted March](https://emersoncollegepolling.com/category/state-poll/)
  - [Emerson College: conducted July pre-Harris](https://docs.google.com/spreadsheets/d/1zJrIOcXtzIRkaa34BDkxoVe9HY3stwFc/edit?gid=1704598980#gid=1704598980)
  - [New York Times/Sienna: conducted May](https://www.nytimes.com/interactive/2024/05/13/us/elections/times-siena-poll-registered-voter-crosstabs.html)
  - [Wall Street Journal: conducted March ]((https://s.wsj.net/public/resources/documents/WSJ_Swing_States_Partial_March_2024.pdf))
  - [YouGov: conducted July pre-Harris](https://ygo-assets-websites-editorial-emea.yougov.net/documents/Times_SAY24_20240712_state_poll_results.pdf)


---

*Single State*

* Arizona
  - [Fox News: conducted March](https://static.foxnews.com/foxnews.com/content/uploads/2024/03/Fox_March-7-11-2024_Arizona_Topline_March-13-Release.pdf)
  - [Fox News: conducted June](https://static.foxnews.com/foxnews.com/content/uploads/2024/06/Fox_June-1-4-2024_ARIZONA_Topline_June-6-Release.pdf)
  - [CBS: conducted May](https://www.scribd.com/document/733845819/cbsnews-20240519-AZ-1-SUN#1fullscreen=1)
  - [Nobel Predictive Insights: conducted May](https://www.scribd.com/document/733845819/cbsnews-20240519-AZ-1-SUN#1fullscreen=1)
  - [American Greatness: conducted June](https://cdn.amgreatness.com/app/uploads/2024/06/AZ-June-Toplines.pdf)
  - [Emerson College: conducted June](https://docs.google.com/spreadsheets/d/1vGeTKW3MRDR5dXHM2IjM8ORz7HOyP5Le/edit?gid=532631346#gid=532631346)
  - [Rasmussen Reports: conducted June](https://www.rasmussenreports.com/public_content/politics/public_surveys/crosstabs_2_arizona_june_2024)
  - [Public Policy Polling conducted July pre-Harris](https://www.nytimes.com/interactive/2024/us/politics/presidential-candidates-third-party-independent.html)
  - [Insider Advantage: conducted July pre-Harris](https://insideradvantage.com/top-line-cross-tabs-for-insideradvantage-az-nv-and-pa-july-15-16-surveys/)
  
* Georgia
  - [Fox News: conducted April](https://static.foxnews.com/foxnews.com/content/uploads/2024/04/Fox_April-11-16-2024_GEORGIA_Topline_April-18-Release-1.pdf)
  - [Insider Advantage: conducted July pre-Harris](https://insideradvantage.com/top-line-tabs-for-insideradvantage-fox5-atlanta-survey/)
* Michigan
  - [CBS: conducted in April](https://www.scribd.com/document/727317994/Cbsnews-20240428-MI-SUN)
  - [Fox News: conducted April](https://static.foxnews.com/foxnews.com/content/uploads/2024/04/Fox_April-11-16-2024_MICHIGAN_Topline_April-18-Release.pdf)
  - [Marketing Resource Group: conducted April](https://www.realclearpolitics.com/docs/2024/michigan-poll-presidential-election-Press_Release.pdf)
  - [Mitchell Research and Communications: conducted March](https://www.realclearpolitics.com/docs/2024/Mitchell-MIRS_MI_Poll_Press_Release_-_Presidential_Race_12_NOON_3-20-24.pdf)
  -  [Mitchell Research and Communications: conducted May](https://www.realclearpolitics.com/docs/2024/Mitchell-MIRS_MI_Poll_Press_Release_-_Presidential_Race_517_PM_5-27-24.pdf)
  - [Atlantic Journal Constitution: completed June](https://www.ajc.com/news/am-atl-poll-trump-edging-biden/2SN4MIOROZA4DFOFDNXE2CFCJU/)
  - [Quinnipiac University: conducted March](https://poll.qu.edu/poll-release?releaseid=3893)
  - [Quinnipiac University: conducted June](https://poll.qu.edu/images/polling/ga/ga06052024_ggwb04.pdf)
  - [Fox News: conducted June](https://static.foxnews.com/foxnews.com/content/uploads/2024/06/Fox_June-1-4-2024_NEVADA_Topline_June-6-Release.pdf)
  - [EPIC-MRA: conducted in July, pre-Harris](https://ssl2002.webhosting.comcast.net/epic-mra/press/Stwd_Survey_July2024_Media_Freq.pdf)
  - [Trafalger: conducted July pre-Harris](https://www.thetrafalgargroup.org/wp-content/uploads/2024/07/MI-Gen-Pres-Poll-Report-0718.pdf)
* Pennsylvania
  - [CBS: conducted April](https://www.scribd.com/document/727318459/Cbsnews-20240428-PA-SUN)
  - [Franklin & Marshall College Poll: conducted March](https://www.fandmpoll.org/franklin-marshall-poll-release-april-2024)
* North Carolina
  - [High Point: conduct May](https://www.highpoint.edu/src/files/2023/08/103memo.pdf)
  -  [Marist: conducted March ](https://maristpoll.marist.edu/wp-content/uploads/2024/03/Marist-Poll_North-Carolina-NOS-and-Tables_202403181357.pdf)
  - [Highpoint University: conducted March](https://www.highpoint.edu/src/files/2023/08/102memo.pdf)
  - [Highpoint University: conducted May](https://www.highpoint.edu/src/files/2023/08/103memo.pdf)
  - [Mason-Dixon: conducted April](https://thehill.com/homenews/campaign/4603458-trump-leads-biden-in-north-carolina-poll/)
  - [Quinnipiac: conducted April](https://poll.qu.edu/images/polling/nc/nc04102024_ncaa99.pdf)
  - [WRAL: conducted March](https://wwwcache.wral.com/asset/news/state/nccapitol/2024/03/12/21325738/3247050-Poll_Report_-_PollPrint-DMID1-628w54pob.pdf)
  - [ECU: conducted June](https://surveyresearch-ecu.reportablenews.com/pr/trump-leads-biden-by-5-points-in-north-carolina-gubernatorial-election-remains-close-with-stein-up-1-on-robinson-trump-guilty-verdict-has-little-impact-on-nc-voter-intentions-for-november)
  - [Insider Advantage: conducted July pre-Harris](https://insideradvantage.com/top-line-cross-tabs-for-insideradvantage-az-nv-and-pa-july-15-16-surveys/)
* Wisconsin
  - [CBS: conducted April](https://www.scribd.com/document/727319278/Cbsnews-20240428-WI-SUN)
  - [Fox News: conducted April](https://static.foxnews.com/foxnews.com/content/uploads/2024/04/b002d3b3-Fox_April-11-16-2024_WISCONSIN_Topline_April-18-Release.pdf)
  - [Quinnipiac conducted May](https://poll.qu.edu/images/polling/wi/wi05082024_wizz76.pdf)
  
---
[^3]: Results selected for analysis here are for two-way preference questions if asked, except in cases in which Robert F. Kennedy, Jr. qualified for the ballot prior to poll. For polls with only multiple choices in addition to Harris and Trump, their respective percentages of responses were recorded. In all cases those percentages were normalized to 100% to reflect the relative, not absolute, support of the two candidates.
---

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


