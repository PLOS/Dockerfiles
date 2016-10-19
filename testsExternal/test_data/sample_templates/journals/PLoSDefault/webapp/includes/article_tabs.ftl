<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSDefault/webapp/includes/article_tabs.ftl $
  $Id: article_tabs.ftl 15116 2013-06-14 05:35:45Z mbaehr $

  Copyright (c) 2007-2012 by Public Library of Science
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

<#--
    How to include this template:

    Each inclusion of this file should be immediately preceded by an assignment to the "tab" variable; for example:
        <#assign tab = "article" />
        <#include "../includes/article_tabs.ftl" />
    To indicate which tab is the active one, assign one of the values passed to @tabItem below.

    By default, this file assumes that it is being included on the active tab's root page, so the active tab should not
    be a link (because it would just take the user to the same page). When including this template on a page other than
    the root page, do
        <#assign isTabChildPage = true />
    before the #include. This will make the active tab a link to the root tab.

    By default, the DOI associated with this page is used to build the URLs that the tabs link to. From a page without
    an article DOI (for example, a comment thread page associated with an annotation ID), override those URLs by
    assigning values for articleTabURL, authorTabURL, etc. before including this template.

    Except for the values that are supplied in FreeMarker as documented above, this page may reference only values that
    are supplied from the ArticleHeaderAction interface. See article_header.ftl for details.
  -->

<#if !articleTabURL??><@s.url id="articleTabURL"  namespace="/article" action="fetchArticle" includeParams="none" articleURI="${articleURI}"/></#if>
<#if !authorTabURL??><@s.url id="authorTabURL"   namespace="/article" action="fetchArticleAuthors" includeParams="none" articleURI="${articleURI}"/></#if>
<#if !metricsTabURL??><@s.url id="metricsTabURL"  namespace="/article" action="fetchArticleMetrics" includeParams="none" articleURI="${articleURI}"/></#if>
<#if !relatedTabURL??><@s.url id="relatedTabURL"  namespace="/article" action="fetchArticleRelated" includeParams="none" articleURI="${articleURI}"/></#if>
<#if !commentsTabURL??><@s.url id="commentsTabURL" namespace="/article" action="fetchArticleComments" includeParams="none" articleURI="${articleURI}"/></#if>

<#macro tabItem tabValue linkTarget linkText>
  <li>
    <#if tab == tabValue>
      <#if isTabChildPage?? && isTabChildPage>
        <a href="${linkTarget}" class="active" name="${tabValue}">${linkText}</a>
      <#else>
        <span class="active" name="${tabValue}">${linkText}</span>
      </#if>
    <#else>
      <a href="${linkTarget}" name="${tabValue}">${linkText}</a>
    </#if>
  </li>
</#macro>

<#-- Change the number next to items to match the number of tabs -->
<div class="nav items-5" id="nav-article">
  <ul>
    <@tabItem "article" articleTabURL "Article"/>
    <#-- TODO JS should store "s" for efficiency.
    <#if hasAboutAuthorContent>
      <#if authors?size == 1>
        <#assign aboutTheAuthors = "About the Author"/>
      <#else>
        <#assign aboutTheAuthors = "About the Authors"/>
      </#if>
      <@tabItem "authors" authorTabURL aboutTheAuthors/>
    </#if>
    -->
    <@tabItem "authors" authorTabURL "About the Authors"/>
    <@tabItem "metrics" metricsTabURL "Metrics"/>
    <@tabItem "comments" commentsTabURL "Comments"/>
    <@tabItem "related" relatedTabURL "Related Content"/>
  </ul>
</div>

<script type="text/javascript">
  var selected_tab = "${tab}";
</script>