<#include "../global/variables.ftl">
<#assign numArticles = recentArticles?size>

<#if (numArticles > 0)>
  <ul class="articles">
    <#list 0..numArticles-1 as index>
      <#assign article = recentArticles[index]>
      <#if index % 2 == 0>
        <li class="even">
      <#else>
        <li>
      </#if>
        <@s.url id="articleURL" includeParams="none" namespace="/article" action="fetchArticle" articleURI="${article.uri}"/>
        <a href="${articleURL}" title="Read Open Access Article"><@articleFormat>${article.title}</@articleFormat></a>
        </li>
    </#list>
  </ul>
  <a href="${recentArticlesURL}" class="btn browseRecent" title="All Recently Published Articles">All recently published articles</a>
<#else>
  <p>Recently published article information is currently not available. Please check back later.</p>
</#if>