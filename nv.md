+++
title = "Nevada"
+++

* [April assessment](#april-assessment)
* [March assessment](#march-assessment)
* [2020 election](#2020-election)
* [Scenarios](#scenarios)
* [State facts](#state-facts)
* [2022 demographics](#2022-demographics)
* [Terms](#terms)

# Model results

In the 2020 election President Biden won 51.22% (0.5122) of the votes cast for Biden or Trump in Nevada. This leaves out votes for third-party candidates. Taking the actual result as a starting point, the model introduces some uncertainty into the result to create a range of outcomes for that election from 51.14% to 51.31%. Next, the results of each month's polling are factored in on a rolling basis

Assessments are based on three criteria.

* **Stringent**—Biden wins if all of the values in the credible interval (analogous to the confidence interval) are equal to or greater than his 2020 margin.
* **Historical**—fewer than 2.5% of the values in the credible interval are less than 2020 margin.
* **Relaxed**—fewer than 2.5% of the values in the credible interval are less than 50.01% of the two candidate vote.

## April assessment

Biden wins under the *Relaxed criterion*
~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
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
      <td style = "text-align: right;">0.5122</td>
      <td style = "text-align: right;">0.5122</td>
      <td style = "text-align: right;">0.5122</td>
      <td style = "text-align: right;">0.5113</td>
      <td style = "text-align: right;">0.513</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">1.0</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/NV_apr.png" style="width: 100%; display: block;">

~~~
## March assessment

Biden wins under the *Relaxed criterion*


~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
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
      <td style = "text-align: right;">0.5122</td>
      <td style = "text-align: right;">0.5122</td>
      <td style = "text-align: right;">0.5123</td>
      <td style = "text-align: right;">0.5113</td>
      <td style = "text-align: right;">0.513</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">1.0</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/NV_mar.png" style="width: 100%; display: block;">

~~~

## 2020 election
~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
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
      <td style = "text-align: right;">0.5122</td>
      <td style = "text-align: right;">0.5122</td>
      <td style = "text-align: right;">0.5121</td>
      <td style = "text-align: right;">0.5114</td>
      <td style = "text-align: right;">0.5131</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">1.0</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/NV_2020.png" style="width: 100%; display: block;">
~~~

### [Bloomberg/Morning Consult] (https://pro-assets.morningconsult.com/wp-uploads/2024/03/Bloomberg_2024-Election-Tracking-Wave-6.pdf) 

### [Emerson College](https://docs.google.com/spreadsheets/d/1UHAF-0j9PCycKwiSO75dsrkbn8fFqnkQmGZpC7GzPHg/edit#gid=0)

### [WSJ](https://s.wsj.net/public/resources/documents/WSJ_Swing_States_Partial_March_2024.pdf)

## News

A ballot initiative to amend the state constitution has been [cleared](https://nevadacurrent.com/briefs/abortion-rights-petition-okayed-by-nevada-supreme-court/) by the Nevada Supreme Court.

## Scenarios

The scenario tables below show the possible outcomes that involve Nevada. Not included is the trivial case where one candidate takes all of the swing states. Nevada is represented in 64 of the 127 possible outcomes.  *The combinations shown are those representing swing states taken by Biden.*

### Biden wins
~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
      <th style = "text-align: right;">States won by Biden </th>
      <th style = "text-align: right;">Electoral Votes</th>
      <th style = "text-align: right;">Biden Votes</th>
      <th style = "text-align: right;">Trump Votes</th>
      <th style = "text-align: right;">Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ and PA</td>
      <td style = "text-align: right;">46</td>
      <td style = "text-align: right;">271</td>
      <td style = "text-align: right;">267</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, GA and MI</td>
      <td style = "text-align: right;">47</td>
      <td style = "text-align: right;">272</td>
      <td style = "text-align: right;">266</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, MI and NC</td>
      <td style = "text-align: right;">47</td>
      <td style = "text-align: right;">272</td>
      <td style = "text-align: right;">266</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, GA and NC</td>
      <td style = "text-align: right;">48</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, GA and MI</td>
      <td style = "text-align: right;">48</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, MI and NC</td>
      <td style = "text-align: right;">48</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, GA and NC</td>
      <td style = "text-align: right;">49</td>
      <td style = "text-align: right;">274</td>
      <td style = "text-align: right;">264</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, MI and PA</td>
      <td style = "text-align: right;">50</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, GA and PA</td>
      <td style = "text-align: right;">51</td>
      <td style = "text-align: right;">276</td>
      <td style = "text-align: right;">262</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, PA and NC</td>
      <td style = "text-align: right;">51</td>
      <td style = "text-align: right;">276</td>
      <td style = "text-align: right;">262</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, MI and PA</td>
      <td style = "text-align: right;">51</td>
      <td style = "text-align: right;">276</td>
      <td style = "text-align: right;">262</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, GA and PA</td>
      <td style = "text-align: right;">52</td>
      <td style = "text-align: right;">277</td>
      <td style = "text-align: right;">261</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, PA and NC</td>
      <td style = "text-align: right;">52</td>
      <td style = "text-align: right;">277</td>
      <td style = "text-align: right;">261</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, GA, MI and NC</td>
      <td style = "text-align: right;">53</td>
      <td style = "text-align: right;">278</td>
      <td style = "text-align: right;">260</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, GA, MI and PA</td>
      <td style = "text-align: right;">56</td>
      <td style = "text-align: right;">281</td>
      <td style = "text-align: right;">257</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, PA and NC</td>
      <td style = "text-align: right;">56</td>
      <td style = "text-align: right;">281</td>
      <td style = "text-align: right;">257</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, GA, PA and NC</td>
      <td style = "text-align: right;">57</td>
      <td style = "text-align: right;">282</td>
      <td style = "text-align: right;">256</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, GA and MI</td>
      <td style = "text-align: right;">58</td>
      <td style = "text-align: right;">283</td>
      <td style = "text-align: right;">255</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, MI and NC</td>
      <td style = "text-align: right;">58</td>
      <td style = "text-align: right;">283</td>
      <td style = "text-align: right;">255</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, GA and NC</td>
      <td style = "text-align: right;">59</td>
      <td style = "text-align: right;">284</td>
      <td style = "text-align: right;">254</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, MI and PA</td>
      <td style = "text-align: right;">61</td>
      <td style = "text-align: right;">286</td>
      <td style = "text-align: right;">252</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, GA and PA</td>
      <td style = "text-align: right;">62</td>
      <td style = "text-align: right;">287</td>
      <td style = "text-align: right;">251</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, PA and NC</td>
      <td style = "text-align: right;">62</td>
      <td style = "text-align: right;">287</td>
      <td style = "text-align: right;">251</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, GA, MI and NC</td>
      <td style = "text-align: right;">63</td>
      <td style = "text-align: right;">288</td>
      <td style = "text-align: right;">250</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, GA, MI and NC</td>
      <td style = "text-align: right;">64</td>
      <td style = "text-align: right;">289</td>
      <td style = "text-align: right;">249</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, GA, MI and PA</td>
      <td style = "text-align: right;">66</td>
      <td style = "text-align: right;">291</td>
      <td style = "text-align: right;">247</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, MI, PA and NC</td>
      <td style = "text-align: right;">66</td>
      <td style = "text-align: right;">291</td>
      <td style = "text-align: right;">247</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, GA, PA and NC</td>
      <td style = "text-align: right;">67</td>
      <td style = "text-align: right;">292</td>
      <td style = "text-align: right;">246</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, GA, MI and PA</td>
      <td style = "text-align: right;">67</td>
      <td style = "text-align: right;">292</td>
      <td style = "text-align: right;">246</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, MI, PA and NC</td>
      <td style = "text-align: right;">67</td>
      <td style = "text-align: right;">292</td>
      <td style = "text-align: right;">246</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, GA, PA and NC</td>
      <td style = "text-align: right;">68</td>
      <td style = "text-align: right;">293</td>
      <td style = "text-align: right;">245</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, GA, MI, PA and NC</td>
      <td style = "text-align: right;">72</td>
      <td style = "text-align: right;">297</td>
      <td style = "text-align: right;">241</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, GA, MI and NC</td>
      <td style = "text-align: right;">74</td>
      <td style = "text-align: right;">299</td>
      <td style = "text-align: right;">239</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, GA, MI and PA</td>
      <td style = "text-align: right;">77</td>
      <td style = "text-align: right;">302</td>
      <td style = "text-align: right;">236</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, MI, PA and NC</td>
      <td style = "text-align: right;">77</td>
      <td style = "text-align: right;">302</td>
      <td style = "text-align: right;">236</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, GA, PA and NC</td>
      <td style = "text-align: right;">78</td>
      <td style = "text-align: right;">303</td>
      <td style = "text-align: right;">235</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, GA, MI, PA and NC</td>
      <td style = "text-align: right;">82</td>
      <td style = "text-align: right;">307</td>
      <td style = "text-align: right;">231</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ, GA, MI, PA and NC</td>
      <td style = "text-align: right;">83</td>
      <td style = "text-align: right;">308</td>
      <td style = "text-align: right;">230</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, GA, MI, PA and NC</td>
      <td style = "text-align: right;">93</td>
      <td style = "text-align: right;">318</td>
      <td style = "text-align: right;">220</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
  </tbody>
</table>  
~~~
### Trump wins
~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
      <th style = "text-align: right;">States won by Biden </th>
      <th style = "text-align: right;">Electoral Votes</th>
      <th style = "text-align: right;">Biden Votes</th>
      <th style = "text-align: right;">Trump Votes</th>
      <th style = "text-align: right;">Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">NV</td>
      <td style = "text-align: right;">6</td>
      <td style = "text-align: right;">231</td>
      <td style = "text-align: right;">307</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV and WI</td>
      <td style = "text-align: right;">16</td>
      <td style = "text-align: right;">241</td>
      <td style = "text-align: right;">297</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV and AZ</td>
      <td style = "text-align: right;">17</td>
      <td style = "text-align: right;">242</td>
      <td style = "text-align: right;">296</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV and MI</td>
      <td style = "text-align: right;">21</td>
      <td style = "text-align: right;">246</td>
      <td style = "text-align: right;">292</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV and GA</td>
      <td style = "text-align: right;">22</td>
      <td style = "text-align: right;">247</td>
      <td style = "text-align: right;">291</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV and NC</td>
      <td style = "text-align: right;">22</td>
      <td style = "text-align: right;">247</td>
      <td style = "text-align: right;">291</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV and PA</td>
      <td style = "text-align: right;">25</td>
      <td style = "text-align: right;">250</td>
      <td style = "text-align: right;">288</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI and AZ</td>
      <td style = "text-align: right;">27</td>
      <td style = "text-align: right;">252</td>
      <td style = "text-align: right;">286</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI and MI</td>
      <td style = "text-align: right;">31</td>
      <td style = "text-align: right;">256</td>
      <td style = "text-align: right;">282</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI and GA</td>
      <td style = "text-align: right;">32</td>
      <td style = "text-align: right;">257</td>
      <td style = "text-align: right;">281</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI and NC</td>
      <td style = "text-align: right;">32</td>
      <td style = "text-align: right;">257</td>
      <td style = "text-align: right;">281</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ and MI</td>
      <td style = "text-align: right;">32</td>
      <td style = "text-align: right;">257</td>
      <td style = "text-align: right;">281</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ and GA</td>
      <td style = "text-align: right;">33</td>
      <td style = "text-align: right;">258</td>
      <td style = "text-align: right;">280</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ and NC</td>
      <td style = "text-align: right;">33</td>
      <td style = "text-align: right;">258</td>
      <td style = "text-align: right;">280</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI and PA</td>
      <td style = "text-align: right;">35</td>
      <td style = "text-align: right;">260</td>
      <td style = "text-align: right;">278</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, AZ and PA</td>
      <td style = "text-align: right;">36</td>
      <td style = "text-align: right;">261</td>
      <td style = "text-align: right;">277</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, GA and MI</td>
      <td style = "text-align: right;">37</td>
      <td style = "text-align: right;">262</td>
      <td style = "text-align: right;">276</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI and NC</td>
      <td style = "text-align: right;">37</td>
      <td style = "text-align: right;">262</td>
      <td style = "text-align: right;">276</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, GA and NC</td>
      <td style = "text-align: right;">38</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI and PA</td>
      <td style = "text-align: right;">40</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, GA and PA</td>
      <td style = "text-align: right;">41</td>
      <td style = "text-align: right;">266</td>
      <td style = "text-align: right;">272</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, PA and NC</td>
      <td style = "text-align: right;">41</td>
      <td style = "text-align: right;">266</td>
      <td style = "text-align: right;">272</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ and MI</td>
      <td style = "text-align: right;">42</td>
      <td style = "text-align: right;">267</td>
      <td style = "text-align: right;">271</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ and GA</td>
      <td style = "text-align: right;">43</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ and NC</td>
      <td style = "text-align: right;">43</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
  </tbody>
</table>
~~~
### Biden wins without Nevada


~~~
<img src="/assets/img/maps/no_nv.png" style="width: 100%; display: block;">
~~~

~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
      <th style = "text-align: right;">States won by Biden </th>
      <th style = "text-align: right;">Electoral Votes</th>
      <th style = "text-align: right;">Biden Votes</th>
      <th style = "text-align: right;">Trump Votes</th>
      <th style = "text-align: right;">Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">WI, GA and PA</td>
      <td style = "text-align: right;">45</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, PA and NC</td>
      <td style = "text-align: right;">45</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">AZ, MI and PA</td>
      <td style = "text-align: right;">45</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">AZ, GA and PA</td>
      <td style = "text-align: right;">46</td>
      <td style = "text-align: right;">271</td>
      <td style = "text-align: right;">267</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">AZ, PA and NC</td>
      <td style = "text-align: right;">46</td>
      <td style = "text-align: right;">271</td>
      <td style = "text-align: right;">267</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GA, MI and NC</td>
      <td style = "text-align: right;">47</td>
      <td style = "text-align: right;">272</td>
      <td style = "text-align: right;">266</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GA, MI and PA</td>
      <td style = "text-align: right;">50</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, PA and NC</td>
      <td style = "text-align: right;">50</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GA, PA and NC</td>
      <td style = "text-align: right;">51</td>
      <td style = "text-align: right;">276</td>
      <td style = "text-align: right;">262</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, GA and MI</td>
      <td style = "text-align: right;">52</td>
      <td style = "text-align: right;">277</td>
      <td style = "text-align: right;">261</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, MI and NC</td>
      <td style = "text-align: right;">52</td>
      <td style = "text-align: right;">277</td>
      <td style = "text-align: right;">261</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, GA and NC</td>
      <td style = "text-align: right;">53</td>
      <td style = "text-align: right;">278</td>
      <td style = "text-align: right;">260</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, MI and PA</td>
      <td style = "text-align: right;">55</td>
      <td style = "text-align: right;">280</td>
      <td style = "text-align: right;">258</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, GA and PA</td>
      <td style = "text-align: right;">56</td>
      <td style = "text-align: right;">281</td>
      <td style = "text-align: right;">257</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, PA and NC</td>
      <td style = "text-align: right;">56</td>
      <td style = "text-align: right;">281</td>
      <td style = "text-align: right;">257</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, GA, MI and NC</td>
      <td style = "text-align: right;">57</td>
      <td style = "text-align: right;">282</td>
      <td style = "text-align: right;">256</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">AZ, GA, MI and NC</td>
      <td style = "text-align: right;">58</td>
      <td style = "text-align: right;">283</td>
      <td style = "text-align: right;">255</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, GA, MI and PA</td>
      <td style = "text-align: right;">60</td>
      <td style = "text-align: right;">285</td>
      <td style = "text-align: right;">253</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, MI, PA and NC</td>
      <td style = "text-align: right;">60</td>
      <td style = "text-align: right;">285</td>
      <td style = "text-align: right;">253</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, GA, PA and NC</td>
      <td style = "text-align: right;">61</td>
      <td style = "text-align: right;">286</td>
      <td style = "text-align: right;">252</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">AZ, GA, MI and PA</td>
      <td style = "text-align: right;">61</td>
      <td style = "text-align: right;">286</td>
      <td style = "text-align: right;">252</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">AZ, MI, PA and NC</td>
      <td style = "text-align: right;">61</td>
      <td style = "text-align: right;">286</td>
      <td style = "text-align: right;">252</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">AZ, GA, PA and NC</td>
      <td style = "text-align: right;">62</td>
      <td style = "text-align: right;">287</td>
      <td style = "text-align: right;">251</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GA, MI, PA and NC</td>
      <td style = "text-align: right;">66</td>
      <td style = "text-align: right;">291</td>
      <td style = "text-align: right;">247</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, GA, MI and NC</td>
      <td style = "text-align: right;">68</td>
      <td style = "text-align: right;">293</td>
      <td style = "text-align: right;">245</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, GA, MI and PA</td>
      <td style = "text-align: right;">71</td>
      <td style = "text-align: right;">296</td>
      <td style = "text-align: right;">242</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, MI, PA and NC</td>
      <td style = "text-align: right;">71</td>
      <td style = "text-align: right;">296</td>
      <td style = "text-align: right;">242</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, GA, PA and NC</td>
      <td style = "text-align: right;">72</td>
      <td style = "text-align: right;">297</td>
      <td style = "text-align: right;">241</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, GA, MI, PA and NC</td>
      <td style = "text-align: right;">76</td>
      <td style = "text-align: right;">301</td>
      <td style = "text-align: right;">237</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">AZ, GA, MI, PA and NC</td>
      <td style = "text-align: right;">77</td>
      <td style = "text-align: right;">302</td>
      <td style = "text-align: right;">236</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, AZ, GA, MI, PA and NC</td>
      <td style = "text-align: right;">87</td>
      <td style = "text-align: right;">312</td>
      <td style = "text-align: right;">226</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
  </tbody>
</table>
~~~
## Other news

### Nevada acceptance of mailed ballots after election day

On May 3, 2025, the Republican National Committee and others filed a complaint in Federal District Court for the District of Nevada against Nevada election officials seeking to prevent mail-in ballots not received by election day from being counted. 

> REPUBLICAN NATIONAL COMMITTEE; NEVADA REPUBLICAN PARTY; DONALD J.TRUMP FOR PRESIDENT 2024, INC.; and DONALD J. SZYMANSKI, Plaintiffs, v.CARI-ANN BURGESS, in her official capacity as the Washoe County Registrar of Voters; JAN GALASSINI, in her official capacity as the Washoe County Clerk; LORENA PORTILLO, in her official capacity as the Clark County Registrar of Voters; LYNN MARIE GOYA, in her official capacity as the Clark County Clerk; FRANCISCO AGUILAR, in his official capacity as Nevada Secretary of State, Defendants. Case 3:24-cv-00198.

> Nevada contravenes those federal laws by counting mail ballots that are received up to four business days after Election Day, Nev. Rev. Stat. §293.269921(1)(b), and by presuming that ballots received up to three days after Election Day “have been postmarked on or before the day of the election,” id. §293.269921(2). Nevada effectively extends Nevada’s federal election past the Election Day established by Congress. 

**Comment** Similar actions can be expected in all other jurisdictions that have similar arrangements. One of the allegations cites the Electors Clause

> Exercising that power [pursuant to the Electors Clause], Congress has established that “[t]he electors of President and Vice President shall be appointed, in each State, *on election day*, in accordance with the laws of the State enacted prior to election day.” 3 U.S.C. §1. [*emphasis added*]

which could also be used to argue that electors must be appointed on election day and that no votes counted after midnight can be considered. However, that argument runs counter to 3 U.S.C. § 5

> (a)In general.--
> (1) Certification.--Not later than the date that is 6 days before the time fixed for the meeting of the electors, the executive of each State shall issue a certificate of ascertainment of appointment of electors, under and in pursuance of the laws of such State providing for such appointment and ascertainment enacted prior to election day.

## State facts

* Electoral votes:              6 
* 2020:                         Biden
* 2016:                         Trump
* 2020 turnout:                 1,373,376
* 2020 margin:                  33,596
* 2022 turnout (Senate):        988,704
* Governor:                     Joe Lombardo
* Senator up for election:      Jackie Rosen (D)
* Senate:                       D (2)
* House:                        D (3) R (1)
* State House:                  D (28) R (14)
* State House 2024 election:    All seats
* State Senate:                 D (13) R (7) V (1)
* State Senate 2024 election:   D ( 6) R (4) V (1)
* Secretary of State:           Francisco V. Aguilar
* [SoS website](https://www.nvsos.gov/sos)
* Polls close:                  7 pm Pacific
* Mail-in voting:               Yes
* Early in-person voting:       Yes

## State demographics

~~~
<table>
  <thead>
    <tr class = "header">
      <th style = "text-align: right;">Label (GROUPING)</th>
      <th style = "text-align: right;">NV</th>
    </tr>
  <tbody>
    <tr>
      <td style = "text-align: right;">TOTAL NUMBER OF RACES REPORTED</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Total population</td>
      <td style = "text-align: right;">3,177,772</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        One race</td>
      <td style = "text-align: right;">82.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Two races</td>
      <td style = "text-align: right;">16.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Three races</td>
      <td style = "text-align: right;">1.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Four or more races</td>
      <td style = "text-align: right;">0.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">SEX AND AGE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Total population</td>
      <td style = "text-align: right;">3,177,772</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Male</td>
      <td style = "text-align: right;">50.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female</td>
      <td style = "text-align: right;">49.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Under 5 years</td>
      <td style = "text-align: right;">5.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">5 to 17 years</td>
      <td style = "text-align: right;">16.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 to 24 years</td>
      <td style = "text-align: right;">8.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">25 to 34 years</td>
      <td style = "text-align: right;">14.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">35 to 44 years</td>
      <td style = "text-align: right;">13.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">45 to 54 years</td>
      <td style = "text-align: right;">12.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">55 to 64 years</td>
      <td style = "text-align: right;">12.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">65 to 74 years</td>
      <td style = "text-align: right;">10.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">75 years and over</td>
      <td style = "text-align: right;">6.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median age (years)</td>
      <td style = "text-align: right;">39.0</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 years and over</td>
      <td style = "text-align: right;">78.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">21 years and over</td>
      <td style = "text-align: right;">74.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">62 years and over</td>
      <td style = "text-align: right;">20.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">65 years and over</td>
      <td style = "text-align: right;">16.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Under 18 years</td>
      <td style = "text-align: right;">689,653</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">50.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">49.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 years and over</td>
      <td style = "text-align: right;">2,488,119</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">50.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">49.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 to 34 years</td>
      <td style = "text-align: right;">720,689</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">51.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">48.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">35 to 64 years</td>
      <td style = "text-align: right;">1,228,939</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">50.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">49.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">65 years and over</td>
      <td style = "text-align: right;">538,491</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">46.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">53.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">RELATIONSHIP</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Population in households</td>
      <td style = "text-align: right;">3,142,947</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Householder or spouse</td>
      <td style = "text-align: right;">54.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Unmarried partner</td>
      <td style = "text-align: right;">3.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Child</td>
      <td style = "text-align: right;">28.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Other relatives</td>
      <td style = "text-align: right;">9.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Other nonrelatives</td>
      <td style = "text-align: right;">4.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">HOUSEHOLDS BY TYPE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Households</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Family households</td>
      <td style = "text-align: right;">64.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With own children of the householder under 18 years</td>
      <td style = "text-align: right;">25.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Married-couple family</td>
      <td style = "text-align: right;">44.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With own children of the householder under 18 years</td>
      <td style = "text-align: right;">16.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female householder, no spouse present, family</td>
      <td style = "text-align: right;">13.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With own children of the householder under 18 years</td>
      <td style = "text-align: right;">6.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Nonfamily households</td>
      <td style = "text-align: right;">35.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male householder</td>
      <td style = "text-align: right;">18.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Living alone</td>
      <td style = "text-align: right;">14.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Not living alone</td>
      <td style = "text-align: right;">4.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female householder</td>
      <td style = "text-align: right;">17.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Living alone</td>
      <td style = "text-align: right;">13.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Not living alone</td>
      <td style = "text-align: right;">3.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Average household size</td>
      <td style = "text-align: right;">2.62</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Average family size</td>
      <td style = "text-align: right;">3.21</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MARITAL STATUS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 15 years and over</td>
      <td style = "text-align: right;">2,612,414</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Now married, except separated</td>
      <td style = "text-align: right;">45.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Widowed</td>
      <td style = "text-align: right;">5.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Divorced</td>
      <td style = "text-align: right;">13.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Separated</td>
      <td style = "text-align: right;">1.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Never married</td>
      <td style = "text-align: right;">34.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Male 15 years and over</td>
      <td style = "text-align: right;">1,311,824</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Now married, except separated</td>
      <td style = "text-align: right;">46.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Widowed</td>
      <td style = "text-align: right;">2.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Divorced</td>
      <td style = "text-align: right;">11.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Separated</td>
      <td style = "text-align: right;">1.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Never married</td>
      <td style = "text-align: right;">38.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Female 15 years and over</td>
      <td style = "text-align: right;">1,300,590</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Now married, except separated</td>
      <td style = "text-align: right;">44.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Widowed</td>
      <td style = "text-align: right;">8.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Divorced</td>
      <td style = "text-align: right;">14.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Separated</td>
      <td style = "text-align: right;">2.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Never married</td>
      <td style = "text-align: right;">30.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">SCHOOL ENROLLMENT</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 3 years and over enrolled in school</td>
      <td style = "text-align: right;">697,833</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Nursery school, preschool</td>
      <td style = "text-align: right;">4.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Kindergarten</td>
      <td style = "text-align: right;">5.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Elementary school (grades 1-8)</td>
      <td style = "text-align: right;">44.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">High school (grades 9-12)</td>
      <td style = "text-align: right;">23.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        College or graduate school</td>
      <td style = "text-align: right;">22.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Male 3 years and over enrolled in school</td>
      <td style = "text-align: right;">344,041</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Percent enrolled in kindergarten to grade 12</td>
      <td style = "text-align: right;">76.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Percent enrolled in college or graduate school</td>
      <td style = "text-align: right;">19.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Female 3 years and over enrolled in school</td>
      <td style = "text-align: right;">353,792</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Percent enrolled in kindergarten to grade 12</td>
      <td style = "text-align: right;">70.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Percent enrolled in college or graduate school</td>
      <td style = "text-align: right;">24.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">EDUCATIONAL ATTAINMENT</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 25 years and over</td>
      <td style = "text-align: right;">2,223,852</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Less than high school diploma</td>
      <td style = "text-align: right;">12.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        High school graduate (includes equivalency)</td>
      <td style = "text-align: right;">27.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Some college or associate&apos;s degree</td>
      <td style = "text-align: right;">32.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Bachelor&apos;s degree</td>
      <td style = "text-align: right;">17.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Graduate or professional degree</td>
      <td style = "text-align: right;">9.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        High school graduate or higher</td>
      <td style = "text-align: right;">87.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male, high school graduate or higher</td>
      <td style = "text-align: right;">86.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female, high school graduate or higher</td>
      <td style = "text-align: right;">87.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Bachelor&apos;s degree or higher</td>
      <td style = "text-align: right;">27.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male, bachelor&apos;s degree or higher</td>
      <td style = "text-align: right;">25.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female, bachelor&apos;s degree or higher</td>
      <td style = "text-align: right;">28.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">FERTILITY</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Women 15 to 50 years</td>
      <td style = "text-align: right;">741,887</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Women 15 to 50 years who had a birth in the past 12 months</td>
      <td style = "text-align: right;">41,310</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Unmarried women 15 to 50 years who had a birth in the past 12 months</td>
      <td style = "text-align: right;">12,221</td>
    </tr>
    <tr>
      <td style = "text-align: right;">As a percent of all women with a birth in the past 12 months</td>
      <td style = "text-align: right;">29.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">RESPONSIBILITY FOR GRANDCHILDREN UNDER 18 YEARS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 30 years and over</td>
      <td style = "text-align: right;">2,005,818</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Grandparents living with grandchild(ren)</td>
      <td style = "text-align: right;">4.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Grandparents responsible for grandchildren as a percentage of living with grandchildren</td>
      <td style = "text-align: right;">27.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">VETERAN STATUS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian population 18 years and over</td>
      <td style = "text-align: right;">2,473,493</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Civilian veteran</td>
      <td style = "text-align: right;">8.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">DISABILITY STATUS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Total civilian noninstitutionalized population</td>
      <td style = "text-align: right;">3,139,304</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a disability</td>
      <td style = "text-align: right;">14.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian noninstitutionalized population under 18 years</td>
      <td style = "text-align: right;">688,935</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a disability</td>
      <td style = "text-align: right;">5.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian noninstitutionalized population 18 to 64 years</td>
      <td style = "text-align: right;">1,916,374</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a disability</td>
      <td style = "text-align: right;">11.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian noninstitutionalized population 65 years and older</td>
      <td style = "text-align: right;">533,995</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a disability</td>
      <td style = "text-align: right;">34.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">RESIDENCE 1 YEAR AGO</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 1 year and over</td>
      <td style = "text-align: right;">3,145,500</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Same house</td>
      <td style = "text-align: right;">86.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Different house in the U.S.</td>
      <td style = "text-align: right;">13.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Same county</td>
      <td style = "text-align: right;">8.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Different county</td>
      <td style = "text-align: right;">4.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Same state</td>
      <td style = "text-align: right;">0.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Different state</td>
      <td style = "text-align: right;">4.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Abroad</td>
      <td style = "text-align: right;">0.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">PLACE OF BIRTH, CITIZENSHIP STATUS AND YEAR OF ENTRY</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Native</td>
      <td style = "text-align: right;">2,576,815</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Male</td>
      <td style = "text-align: right;">50.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female</td>
      <td style = "text-align: right;">49.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Foreign born</td>
      <td style = "text-align: right;">600,957</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Male</td>
      <td style = "text-align: right;">48.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female</td>
      <td style = "text-align: right;">52.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Foreign born; naturalized U.S. citizen</td>
      <td style = "text-align: right;">324,092</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">44.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">55.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Foreign born; not a U.S. citizen</td>
      <td style = "text-align: right;">276,865</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">51.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">48.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Population born outside the United States</td>
      <td style = "text-align: right;">600,957</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Entered 2010 or later</td>
      <td style = "text-align: right;">23.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Entered 2000 to 2009</td>
      <td style = "text-align: right;">24.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Entered before 2000</td>
      <td style = "text-align: right;">52.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WORLD REGION OF BIRTH OF FOREIGN BORN</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Foreign-born population excluding population born at sea</td>
      <td style = "text-align: right;">600,957</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Europe</td>
      <td style = "text-align: right;">6.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Asia</td>
      <td style = "text-align: right;">32.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Africa</td>
      <td style = "text-align: right;">2.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Oceania</td>
      <td style = "text-align: right;">0.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Latin America</td>
      <td style = "text-align: right;">55.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Northern America</td>
      <td style = "text-align: right;">2.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">LANGUAGE SPOKEN AT HOME AND ABILITY TO SPEAK ENGLISH</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 5 years and over</td>
      <td style = "text-align: right;">3,005,197</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        English only</td>
      <td style = "text-align: right;">70.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Language other than English</td>
      <td style = "text-align: right;">29.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Speak English less than &quot;very well&quot;</td>
      <td style = "text-align: right;">11.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">EMPLOYMENT STATUS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 16 years and over</td>
      <td style = "text-align: right;">2,572,023</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        In labor force</td>
      <td style = "text-align: right;">63.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Civilian labor force</td>
      <td style = "text-align: right;">62.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Employed</td>
      <td style = "text-align: right;">59.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Unemployed</td>
      <td style = "text-align: right;">3.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                    Unemployment Rate</td>
      <td style = "text-align: right;">5.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Armed Forces</td>
      <td style = "text-align: right;">0.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Not in labor force</td>
      <td style = "text-align: right;">36.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Females 16 years and over</td>
      <td style = "text-align: right;">1,279,958</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        In labor force</td>
      <td style = "text-align: right;">58.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Civilian labor force</td>
      <td style = "text-align: right;">58.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Employed</td>
      <td style = "text-align: right;">55.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Unemployed</td>
      <td style = "text-align: right;">3.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                    Unemployment Rate</td>
      <td style = "text-align: right;">5.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">COMMUTING TO WORK</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Workers 16 years and over</td>
      <td style = "text-align: right;">1,506,293</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Car, truck, or van - drove alone</td>
      <td style = "text-align: right;">70.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Car, truck, or van - carpooled</td>
      <td style = "text-align: right;">11.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Public transportation (excluding taxicab)</td>
      <td style = "text-align: right;">2.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Walked</td>
      <td style = "text-align: right;">1.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Other means</td>
      <td style = "text-align: right;">3.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Worked from home</td>
      <td style = "text-align: right;">12.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Mean travel time to work (minutes)</td>
      <td style = "text-align: right;">24.5</td>
    </tr>
    <tr>
      <td style = "text-align: right;">OCCUPATION</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian employed population 16 years and over</td>
      <td style = "text-align: right;">1,524,894</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Management, business, science, and arts occupations</td>
      <td style = "text-align: right;">33.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Service occupations</td>
      <td style = "text-align: right;">22.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Sales and office occupations</td>
      <td style = "text-align: right;">21.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Natural resources, construction, and maintenance occupations</td>
      <td style = "text-align: right;">8.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Production, transportation, and material moving occupations</td>
      <td style = "text-align: right;">13.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Male civilian employed population 16 years and over</td>
      <td style = "text-align: right;">820,038</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Management, business, science, and arts occupations</td>
      <td style = "text-align: right;">29.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Service occupations</td>
      <td style = "text-align: right;">20.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Sales and office occupations</td>
      <td style = "text-align: right;">16.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Natural resources, construction, and maintenance occupations</td>
      <td style = "text-align: right;">15.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Production, transportation, and material moving occupations</td>
      <td style = "text-align: right;">17.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Female civilian employed population 16 years and over</td>
      <td style = "text-align: right;">704,856</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Management, business, science, and arts occupations</td>
      <td style = "text-align: right;">37.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Service occupations</td>
      <td style = "text-align: right;">25.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Sales and office occupations</td>
      <td style = "text-align: right;">28.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Natural resources, construction, and maintenance occupations</td>
      <td style = "text-align: right;">1.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Production, transportation, and material moving occupations</td>
      <td style = "text-align: right;">7.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">INDUSTRY</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian employed population 16 years and over</td>
      <td style = "text-align: right;">1,524,894</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Agriculture, forestry, fishing and hunting, and mining</td>
      <td style = "text-align: right;">1.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Construction</td>
      <td style = "text-align: right;">7.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Manufacturing</td>
      <td style = "text-align: right;">5.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Wholesale trade</td>
      <td style = "text-align: right;">2.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Retail trade</td>
      <td style = "text-align: right;">11.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Transportation and warehousing, and utilities</td>
      <td style = "text-align: right;">7.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Information</td>
      <td style = "text-align: right;">1.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Finance and insurance, and real estate and rental and leasing</td>
      <td style = "text-align: right;">5.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Professional, scientific, and management, and administrative and waste management services</td>
      <td style = "text-align: right;">12.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Educational services, and health care and social assistance</td>
      <td style = "text-align: right;">16.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Arts, entertainment, and recreation, and accommodation and food services</td>
      <td style = "text-align: right;">19.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Other services (except public administration)</td>
      <td style = "text-align: right;">4.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Public administration</td>
      <td style = "text-align: right;">3.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">CLASS OF WORKER</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian employed population 16 years and over</td>
      <td style = "text-align: right;">1,524,894</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Private wage and salary workers</td>
      <td style = "text-align: right;">82.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Government workers</td>
      <td style = "text-align: right;">11.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Self-employed workers in own not incorporated business</td>
      <td style = "text-align: right;">5.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Unpaid family workers</td>
      <td style = "text-align: right;">0.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">INCOME IN THE PAST 12 MONTHS (IN 2022 INFLATION-ADJUSTED DOLLARS)</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Households</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median household income (dollars)</td>
      <td style = "text-align: right;">72,333</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With earnings</td>
      <td style = "text-align: right;">77.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean earnings (dollars)</td>
      <td style = "text-align: right;">97,079</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With Social Security income</td>
      <td style = "text-align: right;">31.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean Social Security income (dollars)</td>
      <td style = "text-align: right;">21,342</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With Supplemental Security Income</td>
      <td style = "text-align: right;">4.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean Supplemental Security Income (dollars)</td>
      <td style = "text-align: right;">11,287</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With cash public assistance income</td>
      <td style = "text-align: right;">3.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean cash public assistance income (dollars)</td>
      <td style = "text-align: right;">3,758</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With retirement income</td>
      <td style = "text-align: right;">24.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean retirement income (dollars)</td>
      <td style = "text-align: right;">33,150</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With Food Stamp/SNAP benefits</td>
      <td style = "text-align: right;">13.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Families</td>
      <td style = "text-align: right;">773,666</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median family income (dollars)</td>
      <td style = "text-align: right;">85,593</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Married-couple family</td>
      <td style = "text-align: right;">68.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median income (dollars)</td>
      <td style = "text-align: right;">100,620</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male householder, no spouse present, family</td>
      <td style = "text-align: right;">10.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median income (dollars)</td>
      <td style = "text-align: right;">69,898</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female householder, no husband present, family</td>
      <td style = "text-align: right;">20.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median income (dollars)</td>
      <td style = "text-align: right;">51,080</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Individuals</td>
      <td style = "text-align: right;">3,177,772</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Per capita income (dollars)</td>
      <td style = "text-align: right;">38,183</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With earnings for full-time, year-round workers:</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">636,702</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">480,066</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Mean earnings (dollars)  for full-time, year-round workers:</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">74,052</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">62,377</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median earnings (dollars) full-time, year-round workers:</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">53,821</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">46,691</td>
    </tr>
    <tr>
      <td style = "text-align: right;">HEALTH INSURANCE COVERAGE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Civilian noninstitutionalized population</td>
      <td style = "text-align: right;">3,139,304</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With private health insurance</td>
      <td style = "text-align: right;">63.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With public coverage</td>
      <td style = "text-align: right;">36.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        No health insurance coverage</td>
      <td style = "text-align: right;">11.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">POVERTY RATES FOR FAMILIES AND PEOPLE FOR WHOM POVERTY STATUS IS DETERMINED</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    All families</td>
      <td style = "text-align: right;">9.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 18 years</td>
      <td style = "text-align: right;">14.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 5 years only</td>
      <td style = "text-align: right;">12.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Married-couple family</td>
      <td style = "text-align: right;">5.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 18 years</td>
      <td style = "text-align: right;">7.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 5 years only</td>
      <td style = "text-align: right;">4.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female householder, no spouse present, family</td>
      <td style = "text-align: right;">21.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 18 years</td>
      <td style = "text-align: right;">28.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 5 years only</td>
      <td style = "text-align: right;">32.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    All people</td>
      <td style = "text-align: right;">12.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Under 18 years</td>
      <td style = "text-align: right;">16.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Related children of the householder under 18 years</td>
      <td style = "text-align: right;">15.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Related children of the householder under 5 years</td>
      <td style = "text-align: right;">17.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Related children of the householder 5 to 17 years</td>
      <td style = "text-align: right;">15.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 years and over</td>
      <td style = "text-align: right;">11.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 to 64 years</td>
      <td style = "text-align: right;">11.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">65 years and over</td>
      <td style = "text-align: right;">10.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        People in families</td>
      <td style = "text-align: right;">9.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Unrelated individuals 15 years and over</td>
      <td style = "text-align: right;">23.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">HOUSING TENURE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Owner-occupied housing units</td>
      <td style = "text-align: right;">60.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Renter-occupied housing units</td>
      <td style = "text-align: right;">39.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Average household size of owner-occupied unit</td>
      <td style = "text-align: right;">2.69</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Average household size of renter-occupied unit</td>
      <td style = "text-align: right;">2.53</td>
    </tr>
    <tr>
      <td style = "text-align: right;">UNITS IN STRUCTURE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">1-unit, detached or attached</td>
      <td style = "text-align: right;">68.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">2 to 4 units</td>
      <td style = "text-align: right;">7.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">5 or more units</td>
      <td style = "text-align: right;">19.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Mobile home, boat, RV, van, etc.</td>
      <td style = "text-align: right;">5.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">YEAR STRUCTURE BUILT</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 2020 or later</td>
      <td style = "text-align: right;">2.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 2010 to 2019</td>
      <td style = "text-align: right;">13.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 2000 to 2009</td>
      <td style = "text-align: right;">26.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 1980 to 1999</td>
      <td style = "text-align: right;">36.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 1960 to 1979</td>
      <td style = "text-align: right;">16.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 1940 to 1959</td>
      <td style = "text-align: right;">3.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 1939 or earlier</td>
      <td style = "text-align: right;">0.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">VEHICLES AVAILABLE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        None</td>
      <td style = "text-align: right;">7.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">1 or more</td>
      <td style = "text-align: right;">93.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">HOUSE HEATING FUEL</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Gas</td>
      <td style = "text-align: right;">62.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Electricity</td>
      <td style = "text-align: right;">34.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        All other fuels</td>
      <td style = "text-align: right;">3.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        No fuel used</td>
      <td style = "text-align: right;">0.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">SELECTED CHARACTERISTICS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        No telephone service available</td>
      <td style = "text-align: right;">1.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">1.01 or more occupants per room</td>
      <td style = "text-align: right;">4.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">SELECTED MONTHLY OWNER COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Housing units with a mortgage (excluding units where SMOC cannot be computed)</td>
      <td style = "text-align: right;">473,798</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Less than 30 percent</td>
      <td style = "text-align: right;">69.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">30 percent or more</td>
      <td style = "text-align: right;">31.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">OWNER CHARACTERISTICS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Owner-occupied housing units</td>
      <td style = "text-align: right;">722,684</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median value (dollars)</td>
      <td style = "text-align: right;">434,700</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median selected monthly owner costs with a mortgage (dollars)</td>
      <td style = "text-align: right;">1,730</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median selected monthly owner costs without a mortgage (dollars)</td>
      <td style = "text-align: right;">486</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied units paying rent (excluding units where GRAPI cannot be computed)</td>
      <td style = "text-align: right;">450,409</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Less than 30 percent</td>
      <td style = "text-align: right;">42.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">30 percent or more</td>
      <td style = "text-align: right;">57.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GROSS RENT</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied units paying rent</td>
      <td style = "text-align: right;">462,009</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median gross rent (dollars)</td>
      <td style = "text-align: right;">1,461</td>
    </tr>
    <tr>
      <td style = "text-align: right;">COMPUTERS AND INTERNET USE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Total households</td>
      <td style = "text-align: right;">1,198,356</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a computer</td>
      <td style = "text-align: right;">97.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a broadband Internet subscription</td>
      <td style = "text-align: right;">91.5%</td>
    </tr>
  </tbody>
</table>
~~~
[Source: U.S. Census Bureau, 2022 American Community Survey 1-Year Estimates](https://data.census.gov/table/ACSDP1Y2022.DP05?q=DP05&g=040XX00US04,13,26,32,37,42,55)
