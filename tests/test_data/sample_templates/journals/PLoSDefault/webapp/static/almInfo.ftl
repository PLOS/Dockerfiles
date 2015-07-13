<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSDefault/webap#$
  $Id: almInfo.ftl 14627 2013-05-07 17:34:23Z nmeechoonuk $

  Copyright (c) 2007-2010 by Public Library of Science
  http://plos.org
  http://ambraproject.org

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- begin : main content -->
<!-- begin : content -->


<h1>Article-Level Metrics Information</h1>

<@s.url id="journalStatisticsURL" includeParams="none" namespace="/static" action="journalStatistics" />
<p class="intro">This page contains information about each of the article-level
  metrics that we track. <a href="${journalStatisticsURL}#${journalContext}">Summary tables of
  'average usage'</a> are also available, as well as a page containing a <a href=
  "/static/usageData">technical description of our usage
  data</a> in particular; and a <a href=
  "http://article-level-metrics.plos.org/plos-alm-data/">summary Excel file</a> containing the full
  data set.</p>

<a id="background" name="background"></a>
<h2>Background</h2>
<p>At PLOS, we believe that research articles should primarily be judged on their individual merits, rather than on the basis of the journal in which they were published. In March 2009, we inaugurated a program to provide "article-level metrics" on every article across all journals. This suite of relevant indicators of impact helps users determine the value of an article to them and to their scientific community. The regularly updated data fall into the following categories: </p>

<ul>
  <li>Viewed</li>
  <li>Cited</li>
  <li>Saved</li>
  <li>Discussed</li>
  <li>Recommended</li>
</ul>

<p>They are described further in the sections below.</p>
<p>Article-Level Metrics (ALMs) leverage the acceleration of research communication made possible by the networked landscape of researcher tools and services. Also by incorporating the manifold ways in which research is disseminated, these article impact indicators are made available rapidly after publication and are continually updated. It is important to note that the behavior of metrics varies by time (and needless to say by field and research area). For example, some metrics tend to accrue slowly over time; some are quicker to do so. Newly published articles will typically show lower levels of activity (for any given metric) for the initial weeks or months after publication than older articles. Further discussion of known limitations to individual metrics is detailed in the <a href="#knownIssues" title="Go to known issues">section below</a>.</p>

<p>PLOS is committed to the open provision of these metrics; we encourage researchers to investigate and analyze them in new and interesting ways. Therefore, the entire dataset of all ALMs are made available as a summary Excel file. This file will be updated periodically. We also provide an API and accompanying documentation for the automatic retrieval of the full set of ALM data. </p>

<a id="usageInfo" name="usageInfo"></a>

<h1>Article-Level Metrics Suite</h1>

<h2>Viewed</h2>
<p>Online usage via the PLOS platform is presented according to industry standard definitions of usage and is COUNTER 3-compliant (this is a standard which has been developed to report the usage of an entire journal in the context of a subscribing library, however we have applied the same rules to our own data analysis).</p>
<p>PLOS articles are provided in three different formats&ndash; HTML (browser view), PDF (often the preferred method when printing an article), and the original XML (back-end information, which generates the HTML and PDF files) &ndash; and we record the online activity of users across these three formats. These "article views" (divided by the three types of file format) are provided as an aggregate metric or broken down, month-by-month, in graphical format. Detailed, technical information relating to PLOS usage data can be found at the <a href="help#articleMetrics">Usage Help</a> page.</p>
<p>We also display COUNTER 3-compliant PubMed Central (PMC) usage data for each article. PMC individually counts the number of html page views and PDF downloads of the article on their site. The results are only made available to PLOS once a month, not in real-time. As a result, articles may experience a lag with the display of PMC data of up to one month. This will also impact the data shown on recently published articles, which may not show PMC usage data for their first month of publication. The total article usage data displayed on the Metrics Tab is an aggregate of both PLOS and PMC usage.</p>
<p>Online usage data should be interpreted with caution. In general, it is dependent on the age of the article and its subject area. To assist in the interpretation of usage data, PLOS provides <a href="journalStatistics" title="Go to summary page"> summary tables</a> showing useful average figures. In addition, interested researchers can download the entire dataset as an <a href="plos-alm.zip" title="Download excel"> Excel file </a>(updated periodically).</p>
<p>Robot activity may impact usage data. While we comply with COUNTER 3's requirements to exclude its defined list of robots from reports, we employ more stringent benchmarks with an <a href="robotsFilter" title="Robot information"> expanded list.</a> PLOS will accommodate new COUNTER standards (e.g., standards devoted to article-level usage or expanded numbers of robot services to exclude) in the future as they come into effect. Be aware that PMC exclude a different (smaller) list of robots than is applied to the PLOS data.</p>
<p>Article-Level Metrics Article Usage charts are produced with <a href="http://shop.highsoft.com/highcharts.html">Highcharts</a>. Highcharts is not free for commercial use.</p>
<p>We also provide <a href="usageData" title="Go to technical information"> detailed, technical information about our online usage data.</a></p>

<a id="citationInfo" name="citationInfo"></a>
<h2>Cited</h2>
<p>PLOS provides citation data on each article as computed by the following third-party citation measuring services: <a href="http://www.scopus.com/home.url" title="Go to Scopus">Scopus</a>,
<a href="http://apps.isiknowledge.com/WOS_GeneralSearch_input.do?product=WOS&search_mode=GeneralSearch&SID=2C6GAAHkD75pG3n9e3l&preferencesSaved=&highlighted_tab=WOS"
 title="Go to Web of Science">
Web of Science</a>,
<a href="http://www.pubmedcentral.nih.gov" title="Go to PubMed Central">PubMed Central</a> and <a href="http://www.crossref.org" title="Go to CrossRef">CrossRef</a>. Each displays a single number (article citations) and links to a landing page containing information related to the citing articles. PLOS also collects data for articles cited in Wikipedia encyclopedia entries. There is no external link for the Wikipedia landing page at this time.</p>
<p>Citation counts often vary between services, as each draws upon a different database. To attain the most comprehensive view of citations, consult all lists and "de-duplicate" the results.</p>
<p>Although Google Scholar extends the search for article citations beyond formal scholarly literature, it does not offer a formal mechanism to capture the data (i.e., an API service). As such, we provide a direct link to search article citations on Google Scholar's site, but we are unable to provide a citation figure as measured by Google Scholar.</p>

<a id="socialBookmarks" name="socialBookmarks"></a>
<h2>Saved</h2>

<p>
We provide activity data from common online reference management services which allow researchers to bookmark papers, collate references, and share sources with their community. Specifically, we capture data from the primary providers &ndash; CiteULike and Mendeley &ndash; to indicate how many times the research article in question has been bookmarked by individual researchers or research groups. Each is linked to a landing page that allows users to navigate to other services such as subject tags and other bookmarked articles. For data that is displayed as an aggregate number, we display the breakdown of these counts in a table that appears as you hover over the respective tile.
</p>
<p>The CiteULike landing page captures total number of individuals and groups who have added the article to their CiteULike bookmarking account. There may be multiple users attached to each posting on this landing page, and they are found hyperlinked by the article listing. For example, the listing with the description: "posted by UserX along with 2 people and 1 group" will have a total count of 4. The Mendeley count is an aggregate of the number of individuals and groups who have added the article. </p>

<a id="blogCoverage" name="blogCoverage"></a>
<h2>Discussed</h2>

<p>With the establishment of a networked landscape in research, researchers today employ a host of tools from which to share and discuss each other's work. PLOS has integrated the leading channels within these three areas into the ALM data suite to offer a more comprehensive view of the article's impact after publication.</p>

<p>We believe that appropriate use of the social network data types will aid the discovery of related papers as well as reveal the article's readership reach. In collaboration with Cameron Neylon, this <a href="http://vimeo.com/channels/plosconversations/5696434" title="Go to video">informational video</a> discusses the power of such metrics as a research and discovery tool.</p>

<p>Blog posts serve as a common dissemination channel for articles published in PLOS journals. To identify and link to them from each article, we use third party blog aggregators: Researchblogging.org and Nature Blogs. For each service, we provide a numerical indicator of how many blog articles they have identified (relating to the article in question) and a link to their landing page containing the blogs counted.</p>

<p>The blog activity reported depends on the method of aggregation specific to each service. To attain the most comprehensive picture of how many (and which) blogs cite the article in question, consult all the constitutive lists and de-duplicate repeated entries. Linking to blog coverage is not yet comprehensive: we rely on the ability of third parties to find blog postings and match them to PLOS articles. In many cases, blog authors do not reference the article in a way that allows for automated aggregation, and the aggregating services we link to cover only a selection of all possible blogs. Therefore, there will potentially be many more blogs about an article than these aggregators are able to identify. In recognition of this issue, we provide a link to a search on Google Blogs that may provide additional links to unlisted blogs.</p>

<p>We also track the dissemination activity of articles through the online mechanisms of Twitter and Facebook. Given the ease and scope of digital propagation, researchers increasingly employ this social channel to recommend articles. This activity thus represents interest in the article, in a similar manner as usage data and provides insight into the reach of the article.</p>

<p>We track the sharing of PLOS articles on Twitter and provide the total number of tweets. We also display an archive of the tweets captured so that users can review the content of each tweet. The Facebook count reflects the aggregate number of Facebook Likes, "shares," "posts," and "comments" on an article (as reported by the Facebook API). At this time, the Facebook service does not offer a landing page which displays the entire collection of events included in the aggregate counts, and so they are not linked in the same manner as the other data sources.
</p>

<p>We also track article discussion on the PLOS publishing platform, which allows users to leave Comments about an entire article or specific parts of the article, respectively. Comments cannot be anonymous and must adhere to PLOS's <a href="commentGuidelines" title="Go to guideline"> guidelines for commenting</a>. Commentators must declare competing interests (when they exist). PLOS staff monitors all comments. Although we provide information on the number of Comment threads that have been created, each Comment thread may also contain multiple replies, which are not separately counted in the Metrics tab. Under the Comments tab, the full text can be found, accompanied by all replies.</p>


<!--<a id="recommended" name="recommended"></a>-->
<h2>Recommended</h2>
<p>We provide data on sources that capture formal endorsements of PLOS research articles via a platform such as an online recommendation channel. F1000Prime is a directory of recommended articles by their expert team of scientists and clinical researchers in biology and medicine. Each reviewer provides a numerical score to their qualitative evaluation. The metric is thus a sum of the scores from all the reviews, which the recommended article has received.</p>


<a id="relativeMetrics" name="relativeMetrics"></a>
<h2>Relative Metrics</h2>
<p>PLOS ALM relative metrics are a set of summary statistics aimed to provide context to primary ALM data. These metrics are statistical interpretations of the direct measurements that come directly from each of the ALM sources, and can be used to inform readers of the scope, meaning, and coverage of the primary data. The relative metrics set is still expanding, but at the moment, we offer the following: views-downloads ratio and average usage.  The latter is in Beta mode as we continue to receive user feedback to refine the metric.</p>

<p><b>Views-downloads ratio:</b> Though the research community engages with the article in numerous ways, the most basic mode is article access ("Usage").  The views-downloads ratio gives readers a view into the level of engagement on this particular dimension, based on the premise that a PDF download denotes expanded consideration of an article.  We divide the HTML views by the PDF downloads to arrive at the percentage of views leading to a download. This ratio automatically normalizes articles by article age.</p>

<p><i>Limitations:</i> In the event that an external link points directly to an article's PDF download, readers will arrive at the PDF download without creating an imprint on the HTML page.  This occurrence will slightly inflate the proportion of downloads and lead to a lower views-downloads ratio.  </p>

<p><b>Average Usage:</b> The average usage calculation is a proximate measure of how a paper's total usage compares to the overall usage of a group of related papers.  We define this reference set based on likeness across two dimensions, subject area and age, and then calculate the average from the usage count amongst this group.  We use the median as the measure for central tendency.</p>

<p>We group articles based on age so as to control for large-scale institutional changes in reader behavior over time.  We then group based on the seed article's subject matter, using its first and second level subject categories based on user selection.  From this reference set of related papers, we calculate the average usage on a month-by-month basis.  In this fashion, month X usage of the focal article is compared directly to the average usage for month X usage of all papers in its cohort and controls for the small variations in publication age amongst this set.  Results are displayed as a line overlaid on the historical cumulative usage chart of the seed article.</p>

<p><i>Limitations:</i> The context provided in the average usage is limited to the PLOS corpus as usage data is not widely available beyond PLOS journals at the moment.  We begin displaying the average usage three months after an article's publication date to ensure there is sufficient data to compute a summary statistic.  Due to the average usage methodological design, which groups articles based on publication year, an article may display a curtailed line depending on its publication date relative to the calendar year.  Younger articles will reach a point in which they have been fully calculated and no longer have data to contribute to the monthly calculation.  We cease to calculate the average usage at the point in which the first article drops out of the reference set.  In the event that a reference set does not meet the minimum size for statistical significance (less than 25 articles) or usage data availability disruptions occur for an article in the reference set, the average usage is not computed.  In the former, we suppress the subject category so that it is does not appear as a selection item.  This situation may arise in certain niche subject areas that are not frequently covered.   In the latter, the average usage line will be displayed up to the point in which such event occurs.
</p>


<a id="knownIssues" name="knownIssues"></a>
<h2>Known Issues with Article-Level Metrics</h2>
<p>Known limitations with ALMs include the following:</p>
<p>Robot activity may impact online usage data. PLOS has excluded all that are identified on this growing list, however PMC will be excluding a different list. No robot list is exhaustive and some level of robot usage will undoubtedly remain in the data.</p>
<p>Differences in PLOS usage data for article published prior to July 1st, 2005: Usage data reported for these articles is shown as an HTML view but actually represents a "combined" figure made up of the 3 view types. This primarily affects articles published in PLOS Biology and PLOS Medicine. Usage between HTML, PDF and XML view types cannot be separated due to problems with early log files before July 1st, 2005.</p>
<p>PubMed Central usage data: PMC statistics are COUNTER 3- compliant to the extent that they exclude internal use and crawlers/bots, and do not count duplicate requests for HTML pages or PDFs that are made within the limits specified by the standard. They are not compliant in that NLM does not provide usage data by specific IP, user, or organization. PMC began to make their usage data available to PLOS on January of 2010. Articles published before that point will not have PMC data prior to that time. We receive monthly reports from PMC of the prior month's usage and so there may be a lag in the display of data up to one month's time.</p>
<p>Scopus Citations: Scopus sometimes significantly undercounts the number of citations to a specific article. This is due to the existence of double records in their database for many PLOS articles. Hence, citations are spread across both records. PLOS is working with Scopus to improve their database in this respect, and so Scopus citation counts may increase in the future.</p>
<p>ISI Web of Science&#x24c7; Citations: The Web of Science&#x24c7; count reflects the sum total of citations for an article across all years and all five citations indices in their database. Individual users who search from their account may obtain lower results than the quoted Times Cited count if they do not have full access to the complete suite of ISI Web of Science® databases. To read more about how the ISI Web of Science&#x24c7; counts citing articles, please visit their <a href="http://images.webofknowledge.com/WOK46/help/WOS/hcr_times_cited.html" title="Go to help"> help file.</a></p>
<p>CrossRef Citations: These citations to the article are provided by the CrossRef Cited-by Linking service. The data are limited to journals participating in CrossRef's Cited-by Linking service.</p>
<p>"Go-live" Dates for Different Data Sources and Functionalities: PLOS gradually expanded the set of data channels over time. Article published before the data source was integrated may not contain any data. Also, Commenting, Note making, Star rating and Trackback functionality were introduced at different points in time between journals. Articles published before this functionality was made live will typically show fewer comments/notes/ratings than articles published after this date. In addition, PLOS migrated the technology platforms for PLOS Biology, PLOS Medicine, PLOS Pathogens, PLOS Computational Biology, and PLOS Genetics, but it was not possible to include the "posting" dates of the comments that had been made up until that point. For these articles, all commenting data shows a "posting date" of the date of migration. The original posting date can be found by clicking into each comment.</p>
<p>Twitter: We began collecting tweets for PLOS articles on June 1, 2012, and the Twitter ALM count does not include data prior to this time period. We search and pull tweets based upon the DOI of the article, which is embedded in the article URL. Shortened URLs substantially modify this original URL structure, however. To the extent possible we attempt to reconstruct the long-form, original tweet URL and collect it for display.</p>
<p>
The following have discontinued their services since the launch of ALMs:
<ul>
<li>Postgenomic</li>
<li>Bloglines</li>
<li>Connotea</li>
</ul>
As a result, we no longer collect data from these entities. Furthermore, we have removed the following PLOS ALMs: Ratings, Notes, and Trackbacks from the ALM suite as of January 2013.
</p>

<!-- end : main contents -->