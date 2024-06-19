+++
title = "Michigan"
+++

* [May assessment](#may-assessment)
* [April assessment](#april-assessment)
* [March assessment](#march-assessment)
* [2020 election](#2020-election)
* [Scenarios](#scenarios)
* [State facts](#state-facts)
* [2022 demographics](#2022-demographics)
* [Terms](#terms)

# Model results

In the 2020 election President Biden won 51.41% (0.5141) of the votes cast for Biden or Trump in Michigan. This leaves out votes for third-party candidates. Taking the actual result as a starting point, the model introduces some uncertainty into the result to create a range of outcomes for that election from 51.36% to 51.45%. Next, the results of each month's polling are factored in on a rolling basis.

Assessments are based on three criteria.

* **Stringent**—Biden wins if all of the values in the credible interval (analogous to the confidence interval) are equal to or greater than his 2020 margin.
* **Historical**—fewer than 2.5% of the values in the credible interval are less than 2020 margin.
* **Relaxed**—fewer than 2.5% of the values in the credible interval are less than 50.01% of the two candidate vote.

## May assessment

Biden win under the *Relaxed* criterion.

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
      <td style = "text-align: right;">0.5139</td>
      <td style = "text-align: right;">0.5139</td>
      <td style = "text-align: right;">0.5139</td>
      <td style = "text-align: right;">0.5135</td>
      <td style = "text-align: right;">0.5144</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">1.0004</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/MI_may.png" style="width: 100%; display: block;">
~~~

## April assessment

Biden win under the *Relaxed* criterion.

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
      <td style = "text-align: right;">0.5141</td>
      <td style = "text-align: right;">0.5141</td>
      <td style = "text-align: right;">0.5141</td>
      <td style = "text-align: right;">0.5137</td>
      <td style = "text-align: right;">0.5145</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">1.0002</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/MI_apr.png" style="width: 100%; display: block;">
~~~


## March assessment

Biden win under the *Relaxed* criterion.

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
     <td style = "text-align: right;">0.514</td>
      <td style = "text-align: right;">0.514</td>
      <td style = "text-align: right;">0.5141</td>
      <td style = "text-align: right;">0.5136</td>
      <td style = "text-align: right;">0.5145</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">1.0</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/MI_mar.png" style="width: 100%; display: block;">

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
      <td style = "text-align: right;">0.5141</td>
      <td style = "text-align: right;">0.5141</td>
      <td style = "text-align: right;">0.5141</td>
      <td style = "text-align: right;">0.5137</td>
      <td style = "text-align: right;">0.5146</td>
      <td style = "text-align: right;">0.0</td>
      <td style = "text-align: right;">1.0002</td>
    </tr>
  </tbody>
</table>
<img src="/assets/img/models/MI_2020.png" style="width: 100%; display: block;">
~~~
## Scenarios

The scenario tables below show the possible outcomes that involve Michigan. Not included is the trivial case where one candidate takes all of the swing states. Michigan is represented in 64 of the 127 possible outcomes.  *The combinations shown are those representing swing states taken by Biden.*

### Biden wins
~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
      <th style = "text-align: right;">Scenario</th>
      <th style = "text-align: right;">Electoral Votes</th>
      <th style = "text-align: right;">Biden Votes</th>
      <th style = "text-align: right;">Trump Votes</th>
      <th style = "text-align: right;">Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, NC and AZ</td>
      <td style = "text-align: right;">58</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, PA and GA</td>
      <td style = "text-align: right;">58</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, NC, AZ and GA</td>
      <td style = "text-align: right;">58</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, AZ and GA</td>
      <td style = "text-align: right;">59</td>
      <td style = "text-align: right;">271</td>
      <td style = "text-align: right;">267</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, NC and PA</td>
      <td style = "text-align: right;">61</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, PA and GA</td>
      <td style = "text-align: right;">62</td>
      <td style = "text-align: right;">274</td>
      <td style = "text-align: right;">264</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, NC, AZ and PA</td>
      <td style = "text-align: right;">62</td>
      <td style = "text-align: right;">274</td>
      <td style = "text-align: right;">264</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, NC and GA</td>
      <td style = "text-align: right;">63</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, AZ and PA</td>
      <td style = "text-align: right;">63</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, AZ, PA and GA</td>
      <td style = "text-align: right;">63</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, NC, AZ and GA</td>
      <td style = "text-align: right;">64</td>
      <td style = "text-align: right;">276</td>
      <td style = "text-align: right;">262</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, NC and PA</td>
      <td style = "text-align: right;">67</td>
      <td style = "text-align: right;">279</td>
      <td style = "text-align: right;">259</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, NC, PA and GA</td>
      <td style = "text-align: right;">67</td>
      <td style = "text-align: right;">279</td>
      <td style = "text-align: right;">259</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, PA and GA</td>
      <td style = "text-align: right;">68</td>
      <td style = "text-align: right;">280</td>
      <td style = "text-align: right;">258</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, NC, AZ and PA</td>
      <td style = "text-align: right;">68</td>
      <td style = "text-align: right;">280</td>
      <td style = "text-align: right;">258</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, NC, AZ and GA</td>
      <td style = "text-align: right;">68</td>
      <td style = "text-align: right;">280</td>
      <td style = "text-align: right;">258</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, AZ, PA and GA</td>
      <td style = "text-align: right;">69</td>
      <td style = "text-align: right;">281</td>
      <td style = "text-align: right;">257</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, NC, AZ and PA</td>
      <td style = "text-align: right;">72</td>
      <td style = "text-align: right;">284</td>
      <td style = "text-align: right;">254</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, NC, PA and GA</td>
      <td style = "text-align: right;">73</td>
      <td style = "text-align: right;">285</td>
      <td style = "text-align: right;">253</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, AZ, PA and GA</td>
      <td style = "text-align: right;">73</td>
      <td style = "text-align: right;">285</td>
      <td style = "text-align: right;">253</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, NC, AZ and GA</td>
      <td style = "text-align: right;">74</td>
      <td style = "text-align: right;">286</td>
      <td style = "text-align: right;">252</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, NC, PA and GA</td>
      <td style = "text-align: right;">77</td>
      <td style = "text-align: right;">289</td>
      <td style = "text-align: right;">249</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, NC, AZ, PA and GA</td>
      <td style = "text-align: right;">78</td>
      <td style = "text-align: right;">290</td>
      <td style = "text-align: right;">248</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, NC, AZ and PA</td>
      <td style = "text-align: right;">78</td>
      <td style = "text-align: right;">290</td>
      <td style = "text-align: right;">248</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, AZ, PA and GA</td>
      <td style = "text-align: right;">79</td>
      <td style = "text-align: right;">291</td>
      <td style = "text-align: right;">247</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, NC, PA and GA</td>
      <td style = "text-align: right;">83</td>
      <td style = "text-align: right;">295</td>
      <td style = "text-align: right;">243</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, NC, AZ, PA and GA</td>
      <td style = "text-align: right;">84</td>
      <td style = "text-align: right;">296</td>
      <td style = "text-align: right;">242</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, NC, AZ, PA and GA</td>
      <td style = "text-align: right;">88</td>
      <td style = "text-align: right;">300</td>
      <td style = "text-align: right;">238</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI, NC, AZ, PA and GA</td>
      <td style = "text-align: right;">94</td>
      <td style = "text-align: right;">306</td>
      <td style = "text-align: right;">232</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
  </tbody>
</table>
~~~
### Electoral ties
~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
      <th style = "text-align: right;">Scenario</th>
      <th style = "text-align: right;">Electoral Votes</th>
      <th style = "text-align: right;">Biden Votes</th>
      <th style = "text-align: right;">Trump Votes</th>
      <th style = "text-align: right;">Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">NV, MI, NC and PA</td>
      <td style = "text-align: right;">57</td>
      <td style = "text-align: right;">269</td>
      <td style = "text-align: right;">269</td>
      <td style = "text-align: right;">Tie</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, NC and GA</td>
      <td style = "text-align: right;">57</td>
      <td style = "text-align: right;">269</td>
      <td style = "text-align: right;">269</td>
      <td style = "text-align: right;">Tie</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, AZ and PA</td>
      <td style = "text-align: right;">57</td>
      <td style = "text-align: right;">269</td>
      <td style = "text-align: right;">269</td>
      <td style = "text-align: right;">Tie</td>
    </tr>
  </tbody>
</table>
~~~
### Trump wins
~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
      <th style = "text-align: right;">Scenario</th>
      <th style = "text-align: right;">Electoral Votes</th>
      <th style = "text-align: right;">Biden Votes</th>
      <th style = "text-align: right;">Trump Votes</th>
      <th style = "text-align: right;">Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">MI</td>
      <td style = "text-align: right;">16</td>
      <td style = "text-align: right;">228</td>
      <td style = "text-align: right;">310</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV and MI</td>
      <td style = "text-align: right;">22</td>
      <td style = "text-align: right;">234</td>
      <td style = "text-align: right;">304</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI and WI</td>
      <td style = "text-align: right;">26</td>
      <td style = "text-align: right;">238</td>
      <td style = "text-align: right;">300</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI and AZ</td>
      <td style = "text-align: right;">27</td>
      <td style = "text-align: right;">239</td>
      <td style = "text-align: right;">299</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI and NC</td>
      <td style = "text-align: right;">31</td>
      <td style = "text-align: right;">243</td>
      <td style = "text-align: right;">295</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI and GA</td>
      <td style = "text-align: right;">32</td>
      <td style = "text-align: right;">244</td>
      <td style = "text-align: right;">294</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI and WI</td>
      <td style = "text-align: right;">32</td>
      <td style = "text-align: right;">244</td>
      <td style = "text-align: right;">294</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI and AZ</td>
      <td style = "text-align: right;">33</td>
      <td style = "text-align: right;">245</td>
      <td style = "text-align: right;">293</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI and PA</td>
      <td style = "text-align: right;">36</td>
      <td style = "text-align: right;">248</td>
      <td style = "text-align: right;">290</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI and NC</td>
      <td style = "text-align: right;">37</td>
      <td style = "text-align: right;">249</td>
      <td style = "text-align: right;">289</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI and AZ</td>
      <td style = "text-align: right;">37</td>
      <td style = "text-align: right;">249</td>
      <td style = "text-align: right;">289</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI and GA</td>
      <td style = "text-align: right;">38</td>
      <td style = "text-align: right;">250</td>
      <td style = "text-align: right;">288</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI and NC</td>
      <td style = "text-align: right;">41</td>
      <td style = "text-align: right;">253</td>
      <td style = "text-align: right;">285</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI and PA</td>
      <td style = "text-align: right;">42</td>
      <td style = "text-align: right;">254</td>
      <td style = "text-align: right;">284</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI and GA</td>
      <td style = "text-align: right;">42</td>
      <td style = "text-align: right;">254</td>
      <td style = "text-align: right;">284</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, NC and AZ</td>
      <td style = "text-align: right;">42</td>
      <td style = "text-align: right;">254</td>
      <td style = "text-align: right;">284</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI and AZ</td>
      <td style = "text-align: right;">43</td>
      <td style = "text-align: right;">255</td>
      <td style = "text-align: right;">283</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, AZ and GA</td>
      <td style = "text-align: right;">43</td>
      <td style = "text-align: right;">255</td>
      <td style = "text-align: right;">283</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI and PA</td>
      <td style = "text-align: right;">46</td>
      <td style = "text-align: right;">258</td>
      <td style = "text-align: right;">280</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI and NC</td>
      <td style = "text-align: right;">47</td>
      <td style = "text-align: right;">259</td>
      <td style = "text-align: right;">279</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, NC and GA</td>
      <td style = "text-align: right;">47</td>
      <td style = "text-align: right;">259</td>
      <td style = "text-align: right;">279</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, AZ and PA</td>
      <td style = "text-align: right;">47</td>
      <td style = "text-align: right;">259</td>
      <td style = "text-align: right;">279</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI and GA</td>
      <td style = "text-align: right;">48</td>
      <td style = "text-align: right;">260</td>
      <td style = "text-align: right;">278</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, NC and AZ</td>
      <td style = "text-align: right;">48</td>
      <td style = "text-align: right;">260</td>
      <td style = "text-align: right;">278</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, AZ and GA</td>
      <td style = "text-align: right;">49</td>
      <td style = "text-align: right;">261</td>
      <td style = "text-align: right;">277</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, NC and PA</td>
      <td style = "text-align: right;">51</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, WI and PA</td>
      <td style = "text-align: right;">52</td>
      <td style = "text-align: right;">264</td>
      <td style = "text-align: right;">274</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, NC and AZ</td>
      <td style = "text-align: right;">52</td>
      <td style = "text-align: right;">264</td>
      <td style = "text-align: right;">274</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, PA and GA</td>
      <td style = "text-align: right;">52</td>
      <td style = "text-align: right;">264</td>
      <td style = "text-align: right;">274</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, NC and GA</td>
      <td style = "text-align: right;">53</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, MI, AZ and PA</td>
      <td style = "text-align: right;">53</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MI, WI, AZ and GA</td>
      <td style = "text-align: right;">53</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">Trump</td>
    </tr>
  </tbody>
</table>
~~~

### Biden wins without Michigan


~~~
<img src="/assets/img/maps/no_mi.png" style="width: 100%; display: block;">
~~~

~~~
<table>
  <thead>
    <tr class = "header headerLastRow">
      <th style = "text-align: right;">Scenario</th>
      <th style = "text-align: right;">Electoral Votes</th>
      <th style = "text-align: right;">Biden Votes</th>
      <th style = "text-align: right;">Trump Votes</th>
      <th style = "text-align: right;">Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">NV, WI, NC, AZ and GA</td>
      <td style = "text-align: right;">58</td>
      <td style = "text-align: right;">270</td>
      <td style = "text-align: right;">268</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, NC, PA and GA</td>
      <td style = "text-align: right;">61</td>
      <td style = "text-align: right;">273</td>
      <td style = "text-align: right;">265</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, NC, AZ and PA</td>
      <td style = "text-align: right;">62</td>
      <td style = "text-align: right;">274</td>
      <td style = "text-align: right;">264</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NC, AZ, PA and GA</td>
      <td style = "text-align: right;">62</td>
      <td style = "text-align: right;">274</td>
      <td style = "text-align: right;">264</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, AZ, PA and GA</td>
      <td style = "text-align: right;">63</td>
      <td style = "text-align: right;">275</td>
      <td style = "text-align: right;">263</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, NC, PA and GA</td>
      <td style = "text-align: right;">67</td>
      <td style = "text-align: right;">279</td>
      <td style = "text-align: right;">259</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, NC, AZ, PA and GA</td>
      <td style = "text-align: right;">68</td>
      <td style = "text-align: right;">280</td>
      <td style = "text-align: right;">258</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WI, NC, AZ, PA and GA</td>
      <td style = "text-align: right;">72</td>
      <td style = "text-align: right;">284</td>
      <td style = "text-align: right;">254</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
    <tr>
      <td style = "text-align: right;">NV, WI, NC, AZ, PA and GA</td>
      <td style = "text-align: right;">78</td>
      <td style = "text-align: right;">290</td>
      <td style = "text-align: right;">248</td>
      <td style = "text-align: right;">Biden</td>
    </tr>
  </tbody>
</table>
~~~


## Michigan facts

* Electoral votes:              15 
* 2020:                         Biden
* 2016:                         Trump
* 2020 turnout:                 5,453,892
* 2020 margin:                  154,188 
* 2022 turnout (governor):      4,391,140      
* Governor:                     Gretchen Widmer (D)
* Senator up for election:      Debbie Stabenow (D)
* Senate:                       D (2)
* House:                        D (7) R (6)
* State House:                  D (56) R (54)
* State House 2024 election:    All seats
* State Senate:                 R (20) D (18)
* State Senate 2024 election:   None
* Secretary of State:           Jocelyn Benson (D)
* [SoS website](https://www.michigan.gov/sos/)
* Polls close:                  8 pm Eastern
* Mail-in voting:               Yes
* Early in-person voting:       Yes

## Michigan demographics

~~~
<table>
  <thead>
    <tr class = "header">
      <th style = "text-align: right;">Label (GROUPING)</th>
      <th style = "text-align: right;">MI</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style = "text-align: right;">TOTAL NUMBER OF RACES REPORTED</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Total population</td>
      <td style = "text-align: right;">10,034,118</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        One race</td>
      <td style = "text-align: right;">92.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Two races</td>
      <td style = "text-align: right;">6.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Three races</td>
      <td style = "text-align: right;">0.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Four or more races</td>
      <td style = "text-align: right;">0.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">SEX AND AGE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Total population</td>
      <td style = "text-align: right;">10,034,118</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Male</td>
      <td style = "text-align: right;">49.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female</td>
      <td style = "text-align: right;">50.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Under 5 years</td>
      <td style = "text-align: right;">5.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">5 to 17 years</td>
      <td style = "text-align: right;">15.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 to 24 years</td>
      <td style = "text-align: right;">9.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">25 to 34 years</td>
      <td style = "text-align: right;">13.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">35 to 44 years</td>
      <td style = "text-align: right;">12.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">45 to 54 years</td>
      <td style = "text-align: right;">12.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">55 to 64 years</td>
      <td style = "text-align: right;">13.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">65 to 74 years</td>
      <td style = "text-align: right;">11.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">75 years and over</td>
      <td style = "text-align: right;">7.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median age (years)</td>
      <td style = "text-align: right;">40.3</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 years and over</td>
      <td style = "text-align: right;">79.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">21 years and over</td>
      <td style = "text-align: right;">75.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">62 years and over</td>
      <td style = "text-align: right;">23.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">65 years and over</td>
      <td style = "text-align: right;">18.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Under 18 years</td>
      <td style = "text-align: right;">2,106,228</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">51.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">48.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 years and over</td>
      <td style = "text-align: right;">7,927,890</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">49.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">50.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 to 34 years</td>
      <td style = "text-align: right;">2,264,311</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">51.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">48.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">35 to 64 years</td>
      <td style = "text-align: right;">3,786,017</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">49.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">50.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">65 years and over</td>
      <td style = "text-align: right;">1,877,562</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">45.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">54.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">RELATIONSHIP</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Population in households</td>
      <td style = "text-align: right;">9,821,154</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Householder or spouse</td>
      <td style = "text-align: right;">60.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Unmarried partner</td>
      <td style = "text-align: right;">3.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Child</td>
      <td style = "text-align: right;">28.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Other relatives</td>
      <td style = "text-align: right;">5.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Other nonrelatives</td>
      <td style = "text-align: right;">2.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">HOUSEHOLDS BY TYPE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Households</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Family households</td>
      <td style = "text-align: right;">62.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With own children of the householder under 18 years</td>
      <td style = "text-align: right;">24.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Married-couple family</td>
      <td style = "text-align: right;">45.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With own children of the householder under 18 years</td>
      <td style = "text-align: right;">16.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female householder, no spouse present, family</td>
      <td style = "text-align: right;">11.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With own children of the householder under 18 years</td>
      <td style = "text-align: right;">5.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Nonfamily households</td>
      <td style = "text-align: right;">37.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male householder</td>
      <td style = "text-align: right;">18.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Living alone</td>
      <td style = "text-align: right;">14.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Not living alone</td>
      <td style = "text-align: right;">3.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female householder</td>
      <td style = "text-align: right;">19.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Living alone</td>
      <td style = "text-align: right;">16.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Not living alone</td>
      <td style = "text-align: right;">3.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Average household size</td>
      <td style = "text-align: right;">2.40</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Average family size</td>
      <td style = "text-align: right;">3.02</td>
    </tr>
    <tr>
      <td style = "text-align: right;">MARITAL STATUS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 15 years and over</td>
      <td style = "text-align: right;">8,310,382</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Now married, except separated</td>
      <td style = "text-align: right;">47.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Widowed</td>
      <td style = "text-align: right;">5.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Divorced</td>
      <td style = "text-align: right;">11.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Separated</td>
      <td style = "text-align: right;">1.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Never married</td>
      <td style = "text-align: right;">34.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Male 15 years and over</td>
      <td style = "text-align: right;">4,095,300</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Now married, except separated</td>
      <td style = "text-align: right;">48.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Widowed</td>
      <td style = "text-align: right;">2.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Divorced</td>
      <td style = "text-align: right;">10.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Separated</td>
      <td style = "text-align: right;">1.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Never married</td>
      <td style = "text-align: right;">37.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Female 15 years and over</td>
      <td style = "text-align: right;">4,215,082</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Now married, except separated</td>
      <td style = "text-align: right;">46.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Widowed</td>
      <td style = "text-align: right;">8.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Divorced</td>
      <td style = "text-align: right;">12.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Separated</td>
      <td style = "text-align: right;">1.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Never married</td>
      <td style = "text-align: right;">31.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">SCHOOL ENROLLMENT</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 3 years and over enrolled in school</td>
      <td style = "text-align: right;">2,291,873</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Nursery school, preschool</td>
      <td style = "text-align: right;">5.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Kindergarten</td>
      <td style = "text-align: right;">5.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Elementary school (grades 1-8)</td>
      <td style = "text-align: right;">40.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">High school (grades 9-12)</td>
      <td style = "text-align: right;">22.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        College or graduate school</td>
      <td style = "text-align: right;">26.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Male 3 years and over enrolled in school</td>
      <td style = "text-align: right;">1,135,923</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Percent enrolled in kindergarten to grade 12</td>
      <td style = "text-align: right;">70.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Percent enrolled in college or graduate school</td>
      <td style = "text-align: right;">23.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Female 3 years and over enrolled in school</td>
      <td style = "text-align: right;">1,155,950</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Percent enrolled in kindergarten to grade 12</td>
      <td style = "text-align: right;">65.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Percent enrolled in college or graduate school</td>
      <td style = "text-align: right;">29.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">EDUCATIONAL ATTAINMENT</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 25 years and over</td>
      <td style = "text-align: right;">6,978,952</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Less than high school diploma</td>
      <td style = "text-align: right;">8.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        High school graduate (includes equivalency)</td>
      <td style = "text-align: right;">28.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Some college or associate&apos;s degree</td>
      <td style = "text-align: right;">31.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Bachelor&apos;s degree</td>
      <td style = "text-align: right;">19.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Graduate or professional degree</td>
      <td style = "text-align: right;">12.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        High school graduate or higher</td>
      <td style = "text-align: right;">91.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male, high school graduate or higher</td>
      <td style = "text-align: right;">91.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female, high school graduate or higher</td>
      <td style = "text-align: right;">92.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Bachelor&apos;s degree or higher</td>
      <td style = "text-align: right;">32.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male, bachelor&apos;s degree or higher</td>
      <td style = "text-align: right;">31.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female, bachelor&apos;s degree or higher</td>
      <td style = "text-align: right;">33.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">FERTILITY</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Women 15 to 50 years</td>
      <td style = "text-align: right;">2,235,671</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Women 15 to 50 years who had a birth in the past 12 months</td>
      <td style = "text-align: right;">111,639</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Unmarried women 15 to 50 years who had a birth in the past 12 months</td>
      <td style = "text-align: right;">36,943</td>
    </tr>
    <tr>
      <td style = "text-align: right;">As a percent of all women with a birth in the past 12 months</td>
      <td style = "text-align: right;">33.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">RESPONSIBILITY FOR GRANDCHILDREN UNDER 18 YEARS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 30 years and over</td>
      <td style = "text-align: right;">6,330,291</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Grandparents living with grandchild(ren)</td>
      <td style = "text-align: right;">2.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Grandparents responsible for grandchildren as a percentage of living with grandchildren</td>
      <td style = "text-align: right;">30.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">VETERAN STATUS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian population 18 years and over</td>
      <td style = "text-align: right;">7,923,161</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Civilian veteran</td>
      <td style = "text-align: right;">5.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">DISABILITY STATUS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Total civilian noninstitutionalized population</td>
      <td style = "text-align: right;">9,929,781</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a disability</td>
      <td style = "text-align: right;">14.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian noninstitutionalized population under 18 years</td>
      <td style = "text-align: right;">2,103,940</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a disability</td>
      <td style = "text-align: right;">5.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian noninstitutionalized population 18 to 64 years</td>
      <td style = "text-align: right;">5,987,728</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a disability</td>
      <td style = "text-align: right;">12.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian noninstitutionalized population 65 years and older</td>
      <td style = "text-align: right;">1,838,113</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a disability</td>
      <td style = "text-align: right;">31.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">RESIDENCE 1 YEAR AGO</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 1 year and over</td>
      <td style = "text-align: right;">9,936,710</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Same house</td>
      <td style = "text-align: right;">88.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Different house in the U.S.</td>
      <td style = "text-align: right;">11.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Same county</td>
      <td style = "text-align: right;">6.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Different county</td>
      <td style = "text-align: right;">5.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Same state</td>
      <td style = "text-align: right;">3.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Different state</td>
      <td style = "text-align: right;">1.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Abroad</td>
      <td style = "text-align: right;">0.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">PLACE OF BIRTH, CITIZENSHIP STATUS AND YEAR OF ENTRY</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Native</td>
      <td style = "text-align: right;">9,338,915</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Male</td>
      <td style = "text-align: right;">49.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female</td>
      <td style = "text-align: right;">50.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Foreign born</td>
      <td style = "text-align: right;">695,203</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Male</td>
      <td style = "text-align: right;">49.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female</td>
      <td style = "text-align: right;">50.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Foreign born; naturalized U.S. citizen</td>
      <td style = "text-align: right;">396,976</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">48.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">52.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Foreign born; not a U.S. citizen</td>
      <td style = "text-align: right;">298,227</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">51.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">49.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Population born outside the United States</td>
      <td style = "text-align: right;">695,203</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Entered 2010 or later</td>
      <td style = "text-align: right;">38.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Entered 2000 to 2009</td>
      <td style = "text-align: right;">21.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Entered before 2000</td>
      <td style = "text-align: right;">39.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">WORLD REGION OF BIRTH OF FOREIGN BORN</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Foreign-born population excluding population born at sea</td>
      <td style = "text-align: right;">695,203</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Europe</td>
      <td style = "text-align: right;">16.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Asia</td>
      <td style = "text-align: right;">53.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Africa</td>
      <td style = "text-align: right;">5.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Oceania</td>
      <td style = "text-align: right;">0.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Latin America</td>
      <td style = "text-align: right;">18.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Northern America</td>
      <td style = "text-align: right;">4.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">LANGUAGE SPOKEN AT HOME AND ABILITY TO SPEAK ENGLISH</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 5 years and over</td>
      <td style = "text-align: right;">9,497,313</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        English only</td>
      <td style = "text-align: right;">89.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Language other than English</td>
      <td style = "text-align: right;">10.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Speak English less than &quot;very well&quot;</td>
      <td style = "text-align: right;">3.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">EMPLOYMENT STATUS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Population 16 years and over</td>
      <td style = "text-align: right;">8,179,427</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        In labor force</td>
      <td style = "text-align: right;">61.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Civilian labor force</td>
      <td style = "text-align: right;">61.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Employed</td>
      <td style = "text-align: right;">58.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Unemployed</td>
      <td style = "text-align: right;">2.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                    Unemployment Rate</td>
      <td style = "text-align: right;">4.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Armed Forces</td>
      <td style = "text-align: right;">0.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Not in labor force</td>
      <td style = "text-align: right;">38.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Females 16 years and over</td>
      <td style = "text-align: right;">4,152,360</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        In labor force</td>
      <td style = "text-align: right;">57.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Civilian labor force</td>
      <td style = "text-align: right;">57.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Employed</td>
      <td style = "text-align: right;">54.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                Unemployed</td>
      <td style = "text-align: right;">2.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">                    Unemployment Rate</td>
      <td style = "text-align: right;">4.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">COMMUTING TO WORK</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Workers 16 years and over</td>
      <td style = "text-align: right;">4,706,068</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Car, truck, or van - drove alone</td>
      <td style = "text-align: right;">74.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Car, truck, or van - carpooled</td>
      <td style = "text-align: right;">7.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Public transportation (excluding taxicab)</td>
      <td style = "text-align: right;">0.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Walked</td>
      <td style = "text-align: right;">2.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Other means</td>
      <td style = "text-align: right;">1.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Worked from home</td>
      <td style = "text-align: right;">13.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Mean travel time to work (minutes)</td>
      <td style = "text-align: right;">24.2</td>
    </tr>
    <tr>
      <td style = "text-align: right;">OCCUPATION</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian employed population 16 years and over</td>
      <td style = "text-align: right;">4,800,228</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Management, business, science, and arts occupations</td>
      <td style = "text-align: right;">40.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Service occupations</td>
      <td style = "text-align: right;">15.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Sales and office occupations</td>
      <td style = "text-align: right;">19.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Natural resources, construction, and maintenance occupations</td>
      <td style = "text-align: right;">7.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Production, transportation, and material moving occupations</td>
      <td style = "text-align: right;">16.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Male civilian employed population 16 years and over</td>
      <td style = "text-align: right;">2,530,898</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Management, business, science, and arts occupations</td>
      <td style = "text-align: right;">37.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Service occupations</td>
      <td style = "text-align: right;">12.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Sales and office occupations</td>
      <td style = "text-align: right;">13.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Natural resources, construction, and maintenance occupations</td>
      <td style = "text-align: right;">14.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Production, transportation, and material moving occupations</td>
      <td style = "text-align: right;">23.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Female civilian employed population 16 years and over</td>
      <td style = "text-align: right;">2,269,330</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Management, business, science, and arts occupations</td>
      <td style = "text-align: right;">44.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Service occupations</td>
      <td style = "text-align: right;">20.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Sales and office occupations</td>
      <td style = "text-align: right;">25.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Natural resources, construction, and maintenance occupations</td>
      <td style = "text-align: right;">0.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Production, transportation, and material moving occupations</td>
      <td style = "text-align: right;">8.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">INDUSTRY</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">Civilian employed population 16 years and over</td>
      <td style = "text-align: right;">4,800,228</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Agriculture, forestry, fishing and hunting, and mining</td>
      <td style = "text-align: right;">1.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Construction</td>
      <td style = "text-align: right;">5.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Manufacturing</td>
      <td style = "text-align: right;">18.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Wholesale trade</td>
      <td style = "text-align: right;">1.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Retail trade</td>
      <td style = "text-align: right;">10.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Transportation and warehousing, and utilities</td>
      <td style = "text-align: right;">5.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Information</td>
      <td style = "text-align: right;">1.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Finance and insurance, and real estate and rental and leasing</td>
      <td style = "text-align: right;">5.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Professional, scientific, and management, and administrative and waste management services</td>
      <td style = "text-align: right;">10.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Educational services, and health care and social assistance</td>
      <td style = "text-align: right;">23.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Arts, entertainment, and recreation, and accommodation and food services</td>
      <td style = "text-align: right;">8.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Other services (except public administration)</td>
      <td style = "text-align: right;">4.5%</td>
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
      <td style = "text-align: right;">4,800,228</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Private wage and salary workers</td>
      <td style = "text-align: right;">83.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Government workers</td>
      <td style = "text-align: right;">11.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Self-employed workers in own not incorporated business</td>
      <td style = "text-align: right;">5.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Unpaid family workers</td>
      <td style = "text-align: right;">0.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">INCOME IN THE PAST 12 MONTHS (IN 2022 INFLATION-ADJUSTED DOLLARS)</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Households</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median household income (dollars)</td>
      <td style = "text-align: right;">66,986</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With earnings</td>
      <td style = "text-align: right;">74.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean earnings (dollars)</td>
      <td style = "text-align: right;">94,540</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With Social Security income</td>
      <td style = "text-align: right;">34.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean Social Security income (dollars)</td>
      <td style = "text-align: right;">23,068</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With Supplemental Security Income</td>
      <td style = "text-align: right;">5.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean Supplemental Security Income (dollars)</td>
      <td style = "text-align: right;">11,164</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With cash public assistance income</td>
      <td style = "text-align: right;">2.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean cash public assistance income (dollars)</td>
      <td style = "text-align: right;">3,460</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With retirement income</td>
      <td style = "text-align: right;">27.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Mean retirement income (dollars)</td>
      <td style = "text-align: right;">26,950</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With Food Stamp/SNAP benefits</td>
      <td style = "text-align: right;">13.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Families</td>
      <td style = "text-align: right;">2,548,560</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median family income (dollars)</td>
      <td style = "text-align: right;">85,865</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Married-couple family</td>
      <td style = "text-align: right;">73.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median income (dollars)</td>
      <td style = "text-align: right;">102,076</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male householder, no spouse present, family</td>
      <td style = "text-align: right;">7.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median income (dollars)</td>
      <td style = "text-align: right;">60,615</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female householder, no husband present, family</td>
      <td style = "text-align: right;">18.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median income (dollars)</td>
      <td style = "text-align: right;">44,192</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Individuals</td>
      <td style = "text-align: right;">10,034,118</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Per capita income (dollars)</td>
      <td style = "text-align: right;">38,151</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With earnings for full-time, year-round workers:</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">1,938,740</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">1,436,983</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Mean earnings (dollars)  for full-time, year-round workers:</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">81,467</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">61,245</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median earnings (dollars) full-time, year-round workers:</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Male</td>
      <td style = "text-align: right;">61,623</td>
    </tr>
    <tr>
      <td style = "text-align: right;">            Female</td>
      <td style = "text-align: right;">49,665</td>
    </tr>
    <tr>
      <td style = "text-align: right;">HEALTH INSURANCE COVERAGE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Civilian noninstitutionalized population</td>
      <td style = "text-align: right;">9,929,781</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With private health insurance</td>
      <td style = "text-align: right;">70.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With public coverage</td>
      <td style = "text-align: right;">41.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        No health insurance coverage</td>
      <td style = "text-align: right;">4.5%</td>
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
      <td style = "text-align: right;">15.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 5 years only</td>
      <td style = "text-align: right;">13.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Married-couple family</td>
      <td style = "text-align: right;">4.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 18 years</td>
      <td style = "text-align: right;">6.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 5 years only</td>
      <td style = "text-align: right;">4.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Female householder, no spouse present, family</td>
      <td style = "text-align: right;">25.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 18 years</td>
      <td style = "text-align: right;">35.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">With related children of the householder under 5 years only</td>
      <td style = "text-align: right;">41.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">    All people</td>
      <td style = "text-align: right;">13.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Under 18 years</td>
      <td style = "text-align: right;">18.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Related children of the householder under 18 years</td>
      <td style = "text-align: right;">17.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Related children of the householder under 5 years</td>
      <td style = "text-align: right;">19.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Related children of the householder 5 to 17 years</td>
      <td style = "text-align: right;">17.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 years and over</td>
      <td style = "text-align: right;">12.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">18 to 64 years</td>
      <td style = "text-align: right;">12.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">65 years and over</td>
      <td style = "text-align: right;">9.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        People in families</td>
      <td style = "text-align: right;">10.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Unrelated individuals 15 years and over</td>
      <td style = "text-align: right;">25.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">HOUSING TENURE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Owner-occupied housing units</td>
      <td style = "text-align: right;">73.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Renter-occupied housing units</td>
      <td style = "text-align: right;">26.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Average household size of owner-occupied unit</td>
      <td style = "text-align: right;">2.52</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Average household size of renter-occupied unit</td>
      <td style = "text-align: right;">2.08</td>
    </tr>
    <tr>
      <td style = "text-align: right;">UNITS IN STRUCTURE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">1-unit, detached or attached</td>
      <td style = "text-align: right;">77.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">2 to 4 units</td>
      <td style = "text-align: right;">4.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">5 or more units</td>
      <td style = "text-align: right;">13.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Mobile home, boat, RV, van, etc.</td>
      <td style = "text-align: right;">4.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">YEAR STRUCTURE BUILT</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 2020 or later</td>
      <td style = "text-align: right;">0.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 2010 to 2019</td>
      <td style = "text-align: right;">5.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 2000 to 2009</td>
      <td style = "text-align: right;">10.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 1980 to 1999</td>
      <td style = "text-align: right;">21.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 1960 to 1979</td>
      <td style = "text-align: right;">26.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 1940 to 1959</td>
      <td style = "text-align: right;">20.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Built 1939 or earlier</td>
      <td style = "text-align: right;">13.7%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">VEHICLES AVAILABLE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        None</td>
      <td style = "text-align: right;">6.9%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">1 or more</td>
      <td style = "text-align: right;">93.1%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">HOUSE HEATING FUEL</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Gas</td>
      <td style = "text-align: right;">83.4%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Electricity</td>
      <td style = "text-align: right;">12.3%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        All other fuels</td>
      <td style = "text-align: right;">3.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        No fuel used</td>
      <td style = "text-align: right;">0.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">SELECTED CHARACTERISTICS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied housing units</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        No telephone service available</td>
      <td style = "text-align: right;">0.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">1.01 or more occupants per room</td>
      <td style = "text-align: right;">1.6%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">SELECTED MONTHLY OWNER COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Housing units with a mortgage (excluding units where SMOC cannot be computed)</td>
      <td style = "text-align: right;">1,724,683</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Less than 30 percent</td>
      <td style = "text-align: right;">76.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">30 percent or more</td>
      <td style = "text-align: right;">24.0%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">OWNER CHARACTERISTICS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Owner-occupied housing units</td>
      <td style = "text-align: right;">2,991,685</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median value (dollars)</td>
      <td style = "text-align: right;">224,400</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median selected monthly owner costs with a mortgage (dollars)</td>
      <td style = "text-align: right;">1,435</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median selected monthly owner costs without a mortgage (dollars)</td>
      <td style = "text-align: right;">565</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied units paying rent (excluding units where GRAPI cannot be computed)</td>
      <td style = "text-align: right;">1,008,054</td>
    </tr>
    <tr>
      <td style = "text-align: right;">Less than 30 percent</td>
      <td style = "text-align: right;">49.2%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">30 percent or more</td>
      <td style = "text-align: right;">50.8%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">GROSS RENT</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Occupied units paying rent</td>
      <td style = "text-align: right;">1,034,449</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        Median gross rent (dollars)</td>
      <td style = "text-align: right;">1,052</td>
    </tr>
    <tr>
      <td style = "text-align: right;">COMPUTERS AND INTERNET USE</td>
      <td style = "text-align: right;"></td>
    </tr>
    <tr>
      <td style = "text-align: right;">    Total households</td>
      <td style = "text-align: right;">4,089,794</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a computer</td>
      <td style = "text-align: right;">95.5%</td>
    </tr>
    <tr>
      <td style = "text-align: right;">        With a broadband Internet subscription</td>
      <td style = "text-align: right;">90.5%</td>
    </tr>
  </tbody>
</table>

~~~

[Source: U.S. Census Bureau, 2022 American Community Survey 1-Year Estimates](https://data.census.gov/table/ACSDP1Y2022.DP05?q=DP05&g=040XX00US04,13,26,32,37,42,55)
