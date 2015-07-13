<#include "/global/paging_macro.ftl">

<#if !(sort??) || sort="">
  <#assign sort = "Date, newest first">
</#if>

<#if category??>
  <@s.url id="feedURL" unformattedQuery="subject:\"${category}\"" sort = "${sort}" filterJournals = "${currentJournal}" namespace="/article/feed" action="executeFeedSearch" />
<#else>
  <@s.url id="feedURL" unformattedQuery="*:*" sort = "${sort}" filterJournals = "${currentJournal}" namespace="/article/feed" action="executeFeedSearch" />
</#if>

<#assign totalPages = ((totalNoOfResults + pageSize - 1) / pageSize)?int>

<div id="pagebdy-wrap" class="bg-dk">
<div id="pagebdy" class="subject-listing visible">

<div id="search-results-block" class="cf">

<div class="filter-bar subject cf">
  <h1>${category!"All Subject Areas"}</h1>
  <ul>
    <li class="first">
      <a href="#" title="Related content">Related content</a><span></span>
      <#-- This xmlns mark up is for search engines to understand the hiearchy a bit -->
      <div xmlns:v="http://rdf.data-vocabulary.org/#" class="dropdown">
        <ul typeof="v:Breadcrumb">
          <#if parents?? && parents?size gt 0>
            <#list parents as parent>
              <@s.url id="browseURL" namespace="/" action="browse" category="${parent?replace(' ','_')?lower_case?url}" />
              <#-- Only mark up the first element as part of the breadcrumb parent -->
              <#if parent_index == 0>
                <li><a rel="v:url" property="v:title" href="${browseURL}">${parent}</a></li>
              <#else>
                <li><a href="${browseURL}">${parent}</a></li>
              </#if>
            </#list>
          <#else>
            <#if category??>
              <@s.url id="browseURL" namespace="/" action="browse" />
              <li><a rel="v:url" property="v:title" href="${browseURL}">All Subject Areas</a></li>
            </#if>
          </#if>
          <li class="here" rel="v:child">
            <#if category??>
              <@s.url id="browseURL" namespace="/" action="browse" category="${category?replace(' ','_')?lower_case?url}" />
            <#else>
              <@s.url id="browseURL" namespace="/" action="browse" />
            </#if>
            <a typeof="v:Breadcrumb" rel="v:url" href="${browseURL}"><div property="v:title" >${category!"All Subject Areas"}</div><span></span></a>
            <ul>
              <#if children??>
                <#list children as child>
                  <@s.url id="browseURL" namespace="/" action="browse" category="${child?replace(' ','_')?lower_case?url}" />
                  <li><a href="${browseURL}">${child}</a></li>
                </#list>
              </#if>
            </ul>
          </li>
        </ul>
      </div><!-- /.dropdown -->
    </li>
    <#if category??>
      <li class="middle">
        <#if Session?exists && Session[freemarker_config.userAttributeKey]?exists>
          <#if subscribed>
            <#assign subscribedClass = " subscribed">
          <#else>
            <#assign subscribedClass = "">
          </#if>
            <a href="#" title="Get an email alert for ${category}" class="journal-alert${subscribedClass}" id="save-journal-alert-link" data-category="${category}">Get an email alert for ${category}</a>
        <#else>
          <a href="#" title="Get an email alert for ${category}" id="login-link" data-category="${category}">Get an email alert for ${category}</a>
        </#if>
      </li>
    </#if>
    <li class="last"><a href="${feedURL}" title="Get the RSS feed for ${category!"all articles"}">Get the RSS feed for ${category!"all articles"}</a></li>
  </ul>
</div><!-- /.filter-bar -->

<@s.url id="browseURL" includeParams="category" namespace="/" action="browse" category="${category!''}"/>

<div class="header hdr-results subject cf">
  <div class="main">
    <p class="count">Showing ${(startPage * pageSize) + 1} - <#if (totalNoOfResults lt pageSize)>${totalNoOfResults}<#else>
    <#if ((startPage + 1) * pageSize gt totalNoOfResults)>${totalNoOfResults}<#else>${(startPage + 1) * pageSize}</#if></#if> of ${totalNoOfResults}</p>
    <p class="sort">
      <span>View by:</span>
      <#if resultView != "list">
        <a id="cover-page-link" title="Cover page view" href="${browseURL}?<@URLParameters parameters=searchParameters names="resultView" values="fig" />" class="active">Cover Page</a>
        <a id="list-page-link" title="List page view" href="${browseURL}?<@URLParameters parameters=searchParameters names="resultView" values="list" />">List Articles</a>
      <#else>
        <a id="cover-page-link" title="Cover page view" href="${browseURL}?<@URLParameters parameters=searchParameters names="resultView" values="fig" />">Cover Page</a>
        <a id="list-page-link" title="List page view" href="${browseURL}?<@URLParameters parameters=searchParameters names="resultView" values="list"/>" class="active">List Articles</a>
      </#if>
    </p>
  </div><!-- /.main -->
  <div class="sidebar">
    <p class="sort">
      <span>Sort by:</span>
      <#if sort == "Date, newest first">
        <span class="active">Recent</span>
        <a title="Sort by most viewed, all time" href="${browseURL}?<@URLParameters parameters=searchParameters names="sortKey" values="Most views, all time" />"">Popular</a>
      <#else>
        <a title="Sort by most recent" href="${browseURL}?<@URLParameters parameters=searchParameters names="sortKey" values="Date, newest first" />"" >Recent</a>
        <span class="active">Popular</span>
      </#if>
    </p>
  </div><!-- /.sidebar -->
</div><!-- /.hdr-results -->


<#-- cover view -->
<#if resultView != "list">
  <div id="subject-cover-view" class="subject-cover">
    <div class="articles-list cf">
      <#list resultsSinglePage.hits as hit>
        <@s.url id="strickImageURL" action="fetchArticleMetrics" namespace="/article" articleURI="info:doi/${hit.uri}" includeParams="none"/>
        <@s.url id="fetchArticleURL" action="fetchArticle" namespace="/article" articleURI="info:doi/${hit.uri}" includeParams="none"/>

        <div class="article-block">
          <a href="${fetchArticleURL}">
            <#if (hit.strikingImage?? && hit.strikingImage?length > 0) >
              <@s.url id="fetchStrikingImgURL" action="fetchObject" namespace="/article" uri="${hit.strikingImage}" representation="PNG_M" />
              <img src="${fetchStrikingImgURL}" alt="">
            <#else>
              <img src="/images/generic-article-image.png" alt="">
            </#if>
          <div class="details">
            <h2><a href="${fetchArticleURL}" title="<@articleFormat>${hit.title}</@articleFormat>"><@articleFormat>${hit.truncatedTitle}</@articleFormat></a></h2>
            <p>${hit.firstSecondLastCreator!""}</p>
          </div><!-- /.details -->
          <ul class="actions">
            <#if (hit.abstract?? && hit.abstract?length > 0)>
                <li><a data-doi="info:doi/${hit.uri}" class="abstract">Abstract</a></li>
              <#else>
                <li class="disabled"><span>Abstract</span></li>
            </#if>
            <#if (hit.hasAssets == true) >
                <li><a data-doi="info:doi/${hit.uri}" class="figures">Figures</a></li>
            <#else>
                <li class="disabled"><span>Figures</span></li>
            </#if>
            <li class="last"><a href="${fetchArticleURL}">Full Text</a></li>
          </ul>
        </div><!-- /.article-block -->
      </#list>
    </div>

    <!-- twitter -->
    <div id="browseTwitterStream">
      <a class="twitter-timeline" data-dnt="true"
         href="https://twitter.com/search?q=%40plosone+OR+%23plosone+OR+%5C%22PLOS+One%5C%22+OR+%5C%22plosone%5C%22+lang%3Aen"
         data-widget-id="357290350571827201"
         data-chrome="nofooter"></a>

      <script>
        !function (d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0],
            p = /^http:/.test(d.location) ? 'http' : 'https';

          if (!d.getElementById(id)) {
            js = d.createElement(s);
            js.id = id;
            js.src = p + "://platform.twitter.com/widgets.js";
            fjs.parentNode.insertBefore(js, fjs);
          }
        }(document, "script", "twitter-wjs");

        //Wait for a response from twitter, and then render the content
        function displayOnComplete() {
          if($(".twitter-timeline-rendered").height() >= 10) {
            clearInterval(twitter_interval_handle);
            $(".twitter-timeline-rendered").fadeIn("slow");
          }
        }

        var twitter_interval_handle = setInterval(displayOnComplete, 100);

      </script>
    </div>
    <!-- end twitter -->

    <div class="ad ad-alt ad-position">
      <iframe width="300" scrolling="no" height="250" frameborder="0" src="http://ads.plos.org/www/delivery/afr.php?zoneid=357&amp;cb=6619" name="a81f67a3" id="a81f67a3"></iframe>
      <div class="title">Advertisement</div>
    </div><!-- /.ad -->

    <div class="connect-with-us">
      <h2>Connect with Us</h2>
      <ul class="lnk-social cf">
        <li class="lnk-email ir"><a title="E-mail Alerts" href="/user/secure/editProfile.action?tabId=alerts">E-mail Alerts</a></li>
        <li class="lnk-rss ir"><a title="RSS" href="/taxonomy">RSS</a></li>
        <li class="lnk-twtr ir"><a target="_blank" title="PLOS ONE on Twitter" href="http://twitter.com/plosone">PLOS ONE on Twitter</a></li>
        <li class="lnk-fb ir"><a target="_blank" title="PLOS on Facebook" href="http://www.facebook.com/plos.org">PLOS on Facebook</a></li>
        <li class="lnk-join ir"><a title="Join PLOS" href="http://blogs.plos.org/">Join PLOS</a></li>
      </ul>
    </div><!-- /.connect-with-us -->
  </div><!--subject-cover -->
</#if>

<#-- end cover view -->
  <#-- List view -->
  <#if resultView == "list">
    <div id="subject-list-view" class="main">
      <#list resultsSinglePage.hits as hit>
        <ul id="search-results">
          <@s.url id="fetchArticleMetricsURL" action="fetchArticleMetrics" namespace="/article" articleURI="info:doi/${hit.uri}" includeParams="none"/>
          <@s.url id="fetchArticleURL" action="fetchArticle" namespace="/article" articleURI="info:doi/${hit.uri}" includeParams="none"/>
          <@s.url id="fetchArticlePDF" action="fetchObject" namespace="/article" uri="info:doi/${hit.uri}" representation="PDF"/>
          <li data-doi="${hit.uri}" data-pdate="${hit.date.getTime()?string.computer}" data-metricsurl="${fetchArticleMetricsURL}">
            <h2><a href="${fetchArticleURL}" title="<@articleFormat>${hit.title}</@articleFormat>"><@articleFormat>${hit.title}</@articleFormat></a></h2>
            <p class="authors">${hit.creator!""}</p>
            <p class="date">published ${hit.date?string("dd MMM yyyy")}</p>
            <span class="metrics"><span>Loading metrics information...</span></span>
            <p class="actions">
              <a data-doi="info:doi/${hit.uri}" class="abstract" href="#">Abstract</a> &nbsp;&nbsp;|&nbsp;&nbsp;
              <#if (hit.hasAssets == true) >
                <a data-doi="info:doi/${hit.uri}" class="figures" href="#">Figures</a> &nbsp;&nbsp;|&nbsp;&nbsp;
              <#else>
                <span class="disabled">Figures</span> &nbsp;&nbsp;|&nbsp;&nbsp;
              </#if>
              <a href="${fetchArticleURL}">Full Text</a> &nbsp;&nbsp;|&nbsp;&nbsp;
              <a href="${fetchArticlePDF}" target="_blank">Download PDF</a>
            </p>
          </li>
        </ul>
      </#list>
    </div><!--main -->
  </#if>

  <#if resultView == "list">
    <div id="subject-list-sidebar" class="sidebar">
      <#if featuredArticle??>
        <@s.url id="fetchArticleURL" action="fetchArticle" namespace="/article" articleURI="info:doi/${featuredArticle.doi}" includeParams="none"/>
        <@s.url id="fetchStrikingImgURL" action="fetchObject" namespace="/article" uri="${featuredArticle.strkImgURI}" representation="PNG_M" />

        <#-- Fix longer titles to not overrun the box -->
        <#assign shortTitle>${featuredArticle.title}</#assign>
        <#if (shortTitle?length gt 100)>
          <#assign shortTitle>${shortTitle?substring(0, 100)}...</#assign>
        </#if>

        <div class="article-block">
          <a href="${fetchArticleURL}"><img src="${fetchStrikingImgURL}" alt="" /></a>
          <div class="details">
            <p>${featuredArticle.type}</p>
            <h2><a href="${fetchArticleURL}" title="<@articleFormat>${featuredArticle.title}</@articleFormat>"><@articleFormat>${shortTitle}</@articleFormat></a></h2>
          </div><!-- /.details -->
        </div><!-- /.article-block -->
      </#if>

      <!-- twitter -->
      <div id="browseTwitterStream">
        <a class="twitter-timeline" data-dnt="true"
           href="https://twitter.com/search?q=%40plosone+OR+%23plosone+OR+%5C%22PLOS+One%5C%22+OR+%5C%22plosone%5C%22+lang%3Aen"
           data-widget-id="357290350571827201"
           data-chrome="nofooter"></a>

        <script>
          !function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0],
              p = /^http:/.test(d.location) ? 'http' : 'https';

            if (!d.getElementById(id)) {
              js = d.createElement(s);
              js.id = id;
              js.src = p + "://platform.twitter.com/widgets.js";
              fjs.parentNode.insertBefore(js, fjs);
            }
          }(document, "script", "twitter-wjs");

          //Wait for a response from twitter, and then render the content
          function displayOnComplete() {
            if($(".twitter-timeline-rendered").height() >= 10) {
              clearInterval(twitter_interval_handle);
              $(".twitter-timeline-rendered").fadeIn("slow");
            }
          }

          var twitter_interval_handle = setInterval(displayOnComplete, 100);

        </script>
      </div>
      <!-- end twitter -->

      <div class="ad ad-alt">
        <iframe width="300" scrolling="no" height="250" frameborder="0" src="http://ads.plos.org/www/delivery/afr.php?zoneid=357&amp;cb=6619" name="a81f67a3" id="a81f67a3"></iframe>
        <div class="title">Advertisement</div>
      </div><!-- /.ad -->

      <div class="connect-with-us">
        <h2>Connect with Us</h2>
        <ul class="lnk-social cf">
          <li class="lnk-email ir"><a title="E-mail Alerts" href="/user/secure/editProfile.action?tabId=alerts">E-mail Alerts</a></li>
          <li class="lnk-rss ir"><a title="RSS" href="/taxonomy">RSS</a></li>
          <li class="lnk-twtr ir"><a target="_blank" title="PLOS ONE on Twitter" href="http://twitter.com/plosone">PLOS ONE on Twitter</a></li>
          <li class="lnk-fb ir"><a target="_blank" title="PLOS on Facebook" href="http://www.facebook.com/plos.org">PLOS on Facebook</a></li>
          <li class="lnk-join ir"><a title="Join PLOS" href="http://blogs.plos.org/">Join PLOS</a></li>
        </ul>
      </div><!-- /.connect-with-us -->

    </div><!--sidebar-->
  </#if>
  <#-- end list view -->
</div><!--search-results-block-->

<@renderSearchPaginationLinks browseURL totalPages startPage/>

</div><!-- pagebdy -->
</div><!-- pagebdy-wrap -->

<div id="journal-alert-box" class="journalAlert inlinePopup">
  <#include "saveJournalAlertPopup.ftl"/>
</div>

<div id="login-box" class="login inlinePopup">
  <#include "loginJournalAlertPopup.ftl"/>
</div>