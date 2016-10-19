<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSMedicine/weba#$
  $Id: rssFeeds.ftl 15116 2013-06-14 05:35:45Z mbaehr $
  
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

<#-- begin : main content -->

<h1><em>PLOS Medicine</em> RSS Feeds</h1>

<p>
  <em>PLOS Medicine</em> provides the following <a href="/static/rssInfo.action">RSS feeds</a> which are updated as new
  articles are published.
  To create RSS feeds based on search results, click the "RSS" icon on any search result page.
</p>

<ul>

<@s.url id="articleFeed" namespace="/article/feed" action="getFeed" />
  <li><@s.a href="${articleFeed}">New Articles</@s.a></li>

</ul>

<#-- end : main contents -->

