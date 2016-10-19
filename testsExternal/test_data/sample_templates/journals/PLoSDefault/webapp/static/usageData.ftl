<!-- begin : main content -->
<div id="content" class="static">

<h1>Usage Data Help</h1>
<@s.url id="journalStatisticsURL" includeParams="none" namespace="/static" action="journalStatistics" />
<p class="intro">This page contains a technical description of our online
  article usage data. For a more general overview, see our page of
  <a href="/static/almInfo">Article-Level Metrics
  Information</a>. <a href=
  "${journalStatisticsURL}#${journalContext}">Summary tables of
  &#8216;average usage'</a> are also available, as well as an
  <a href="http://www.plos.org/about/faq.html#metrics">FAQ
  page</a>. To get the full data set in Excel format, download our
  <a href="http://article-level-metrics.plos.org/plos-alm-data/">summary Excel file</a>.</p>

<a id="usage" name="usage"></a>
<h2>What is online article usage data? </h2>

<p>We provide our content in 3 different formats (HTML, PDF and XML) and so we report usage data for all three formats:</p>
<ul>
        <li>HTML Page views – An HTML page view is counted when a user requests an HTML page from the web server (normally by clicking on a link or entering a URL in their browser). This should not be confused with "hits" which counts number of files requested from the server. One page is often comprised of many hits, and we do not report hits.</li>
        <li>PDF Downloads – The number of times a PDF file has been requested from the web server (normally by clicking on a link or entering a URL in a browser).</li>
        <li>XML Downloads – XML (Extensible Markup Language) is an open standard for encoding documents electronically. Normally used for a computer to quickly understand the structure of documents, XML allows greater interoperability and exchange of data between different systems. We provide the XML file for all articles as a separate downloadable file, and so the number here represents the number of times someone requested the XML file and is counted in the same manner that PDF downloads are counted.</li>
</ul>
<a id="interpretation" name="interpretation"></a>
<h2>How to interpret usage data</h2>
<ul>
          <li>Usage data should be interpreted with caution. For example, it should not be assumed that a certain amount of usage equates to a certain number of 'real' people reading (or even viewing) an article. Similarly, it may be impossible to absolutely compare the usage of one article against any other, due to the large number of factors that might be at play, many of which would not be obvious from the data provided. Therefore, while the understanding (and reporting) of usage data remains in its infancy, we recommend that you interpret these data with caution and we suggest that you simply regard the numbers as an indicator of usage levels rather than an absolute measure of usage.</li>
          <li>For our data, we have conformed to the <a href="http://www.projectcounter.org/code_practice.html" title="Go to Counter site">COUNTER 3</a> standards (industry standard guidelines used to report the usage of online journals to subscribing libraries). However we have exceeded those standards by excluding more <a href="robotsFilter" title="View excluded robots">robots</a> than those standards require (in an attempt to get as close as possible to the number of views and downloads from actual readers of each article).</li>
          <li>Usage data may vary greatly from one article to the next for a number of different reasons. In addition to factors such as age, topic, format and article type, usage may also be influenced by marketing or other promotional activities; by activity resulting from scripted downloading software, and by automated indexing software. There is no way to truly understand the effect of each activity without doing a lot of processing of referral data (and we have not provided the referral data at this time).</li>
          <li>We are not aggregating usage data by session. What this means is that the same user may conceivably view the HTML page and download the article in both the PDF and XML file formats. If a user were to do this, then it will be counted as 3 distinct events.</li>
          <li>Related to the issue of not tracking by user session, the same user could come to our site on consecutive days and view the article repeatedly. We count each of these page views equally, regardless of repeat visits.</li>
          <li>Some usage, which might be considered to be 'unwanted', remains in our data (for example multiple downloads from a single IP address in a short period of time). However this usage does adhere to the COUNTER 3 definitions for reportable usage, and without detailed investigation of each case it could conceivably have a 'legitimate' purpose. Therefore, in order to meet the COUNTER 3 standards, and to provide transparent, reliable data, that usage is included in the data set. If you identify suspicious usage of this type then please e-mail us as <strong>alm [at] plos.org</strong>.</li>
</ul>

<a id="sources" name="sources"></a>
<h2>Data sources</h2>
<ul>
          <li>We obtain our download and page view data from our apache log files. However, these log files have originated from article usage on two different publication platforms (AllenPress and Ambra). In addition, we currently have no access to the raw apache logs for two periods of Ambra hosting, and so we have taken the data for that period from a service known as AWStats (a usage reporting tool which received our original apache log files and 'pre-processed' them). For these reasons our complete data set has not undergone an identical process for all time periods across all of our journals. However to the best of our abilities, all data has been processed in as consistent a manner as possible, and the transitions between the data sources are noted below.</li>
</ul>
<p>Specifically:</p>
<ul>
        <li>Due to problems with our early log files, for those articles published prior to July 2005 it was not possible to separate usage between HTML, PDF and XML view types. Therefore, the usage data reported for those articles, for all months prior to July 2005, is shown as an HTML view but actually represents a 'combined' figure made up of the 3 view types. These data have originated from Allen Press.</li>
        <li>For <em>PLOS Medicine</em>, usage data originated from the AllenPress platform for June 17th 2005 – March 31st 2009; and from the Ambra platform from March 23rd 2009 onwards (there was a period of 8 days when the journal resided on both platforms).</li>
        <li>For <em>PLOS Biology</em>, usage data originated from the AllenPress platform for June 17th 2005 – May 12th 2009; and from the Ambra platform from May 5th 2009 onwards (there was a period of 7 days when the journal resided on both platforms).</li>
        <li>For <em>PLOS ONE</em>, usage data was recorded by AWStats from Dec 20th 2006 – Jan 2007; originated from the Ambra platform from Feb 2007 – July 2008; was recorded by AWStats for Aug – Sept 2008; and originated from the Ambra platform from Oct 2008 onwards.</li>
        <li>For <em>PLOS Pathogens</em>, usage data originated from the AllenPress platform from launch through Feb 2009; from the Ambra platform from March– July 2008; remained on Ambra but had its usage recorded via AWStats for Aug – Sept 2008; and resumed Ambra data from Oct 2008 onwards.</li>
        <li>For <em>PLOS Neglected Tropical Diseases</em> usage data originated from the Ambra platform from launch through July 2008; remained on Ambra but had its usage recorded via AWStats for Aug – Sept 2008; and resumed Ambra data from Oct 2008 onwards.</li>
        <li>For <em>PLOS Genetics</em> usage data originated from the Allen Press platform from launch through Feb 2008; from the Ambra platform from Mar - July 2008; remained on Ambra but had its usage recorded via AWStats for Aug – Sep 2008; and resumed Ambra data from Oct 2008 onwards.</li>
        <li>For <em>PLOS Computational Biology</em> usage data originated from the Allen Press platform from launch through Feb 2008; from the Ambra platform Mar – July 2008; remained on Ambra but had its usage recorded via AWStats for Aug – Sep 2008; and resumed Ambra data from Oct 2008 onwards.</li>
        <li>For <em>PLOS Clinical Trials</em> usage data originated from the Allen Press platform from launch through Sep 2007; from the Ambra platform from Oct 2007 – July 2008; had its usage recorded via AWStats from Aug– Sep 2008; and resumed Ambra data from Oct 2008 onwards. This journal was merged with <em>PLOS ONE</em> in August 2007, but usage on those articles published under the <em>PLOS Clinical Trials</em> title is reported separately.</li>
</ul>
<a id="processing" name="processing"></a>
<h2>How we processed the data</h2>
<ul>
          <li><a href="http://www.projectcounter.org/about.html" title="Go to Counter site">COUNTER</a> is an international initiative to improve the reliability of online usage statistics of academic journals. COUNTER's objective is to ensure that online usage reports provided by vendors are credible, compatible and consistent (when applied to journals that are purchased by a subscribing institution). However, the usage that we are reporting is the global usage of a single article (as opposed to the usage of an entire journal within a single location) and therefore COUNTER 3 is not an ideal standard to adhere to. COUNTER is currently the only usage reporting standard which exists for academic journals and so we have adhered to it as far as possible. Specifically, we have adhered to the <a href="http://www.projectcounter.org/code_practice.html" title="Go to Counter site">COUNTER 3</a> release of the COUNTER standards</li>
          <li>We have excluded 179 <a href="robotsFilter" title="View list of excluded robots">robots</a> from our usage data. This exceeds the minimum number recommended by COUNTER 3. However it has been done in an attempt to report only 'real' usage (as far as possible). More information is provided <a href="#robots">below</a>.</li>
          <li>We have excluded all usage originating from our own sites, as well as from those of our production partners.</li>
          <li>We only report usage that has recorded by our own publishing platforms (i.e. Allen Press and Ambra). In the future we may be able to incorporate the additional usage that has happened via third party sites (e.g. PubMed Central).</li>
          <li>Historically, some articles were made available ahead of their official publication date. This happened for a number of articles in PLOS Genetics, PLOS Pathogens, PLOS Computational Biology and PLOS Neglected Tropical Diseases and the practice did not continue past January 2008. To avoid confusion, we are only graphing usage from the 'official' publication date onwards, however these articles did accrue usage prior to their official publication date and that usage is noted in the <a href="plos-alm.zip" title="Download Excel file">summary Excel file</a> that we are providing. </li>
</ul>

<a id="robots" name="robots"></a>
<h2>List of robots we exclude</h2>
<ul>
          <li>Initially, we noticed some anomalies in our usage numbers, caused by robots that were not excluded by the COUNTER definitions. Therefore, we have made an attempt to filter out the usage data caused by these robots so that the data more closely reflect actual usage. As a result, we have used a greatly expanded <a href="robotsFilter" title="View list of excluded robots">list of robots</a> as compared to the list defined by COUNTER 3 (a list which they consider to be the minimum needed to meet their standard).</li>
          <li>The original COUNTER 3 robot list is short as these standards have been developed to report usage at the journal level, from within a subscribing University's IP range. As a general rule, robots do not originate from those addresses and so there was less need to be concerned about this effect.</li>
          <li>If you are a publisher and want to provide the same analysis of your own usage data then the COUNTER 3 standard can be found <a href="http://www.projectcounter.org/code_practice.html" title="Go to Counter site">here</a> and the list of Robots that we excluded can be found <a href="robotsFilter" title="View list of excluded robots">here</a>. If you utilize these two sources then your data should be comparable to our own. </li>
</ul>
</div>
<!-- end : main contents -->
