<#include "journal_include.ftl">
<#-- begin : content -->

<h1>List of RSS Feeds</h1>

<p><em>PLOS Biology</em> provides the following <a href="rssInfo.action">RSS feeds</a> which are updated as new
  articles are published.
  To create RSS feeds based on search results, click the "RSS" icon on any search result page.
</p>
<ul>
<@s.url id="articleFeed" namespace="/article/feed" action="getFeed" />
  <li><@s.a href="${articleFeed}">New Articles</@s.a></li>
</ul>

<#-- end : content -->
