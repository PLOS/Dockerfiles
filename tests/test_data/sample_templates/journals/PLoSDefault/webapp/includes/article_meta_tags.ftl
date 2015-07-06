<#--
  Copyright (c) 2007-2013 by Public Library of Science

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
<#if articleInfoX??>
  <#import "/article/article_variables.ftl" as article>
  <meta name="citation_publisher" content="${articleInfoX.publisher}"/>
  <meta name="citation_doi" content="${article.shortDOI}"/>
  <meta name="dc.identifier" content="${article.shortDOI}" />

  <#if articleInfoX.unformattedTitle??>
    <meta name="citation_title" content="${articleInfoX.unformattedTitle}"/>
    <meta itemprop="name" content="${articleInfoX.unformattedTitle}"/>
  </#if>

  <#if authors?? >
    <#list authors as author>
      <meta name="citation_author" content="${author.fullName}"/>
      <#if author.affiliations?? >
        <#list author.affiliations as affiliation>
          <#if affiliation?? >
            <meta name="citation_author_institution" content="${affiliation?trim}"/>
          </#if>
        </#list>
      </#if>
    </#list>
  </#if>

  <#if articleInfoX.date??>
    <meta name="citation_date" content="${articleInfoX.date?date?string("yyyy/M/d")}"/>
  </#if>

  <#assign pdfURL = "${freemarker_config.doiResolverURL}${articleInfoX.doi?replace('info:doi/','')}" + ".pdf" />
  <meta name="citation_pdf_url" content="${pdfURL}" />

  <#if articleInfoX??>
    <#if publishedJournal??>
      <meta name="citation_journal_title" content="${publishedJournal}" />
    </#if>
    <meta name="citation_firstpage" content="${articleInfoX.eLocationId!}"/>
    <meta name="citation_issue" content="${articleInfoX.issue}"/>
    <meta name="citation_volume" content="${articleInfoX.volume}"/>
    <meta name="citation_issn" content="${articleInfoX.eIssn}"/>
  </#if>

  <#if journalAbbrev??>
    <meta name="citation_journal_abbrev" content="${journalAbbrev}" />
  </#if>

  <#if references??>
    <#list references as reference>
      <meta name="citation_reference" content="${reference.referenceContent}" />
    </#list>
  </#if>

  <link rel="canonical" href="${article.jDocURL}" />

  <#if (articleDescription??)>
    <meta name="twitter:card" content="summary"/>
    <meta name="twitter:site" content="${twitterUsername}"/>
    <meta name="twitter:title" content="${article.noHTMLDocTitle}"/>
    <meta name="twitter:description" content="${articleDescription?replace('<.+?>',' ','r')}"/>
    <#if (articleInfoX.strkImgURI?? && (articleInfoX.strkImgURI?length > 0)) >
      <meta name="twitter:image" content="${freemarker_config.doiResolverURL}${articleInfoX.strkImgURI?replace('info:doi/','')}"/>
    </#if>
  </#if>

  <meta property="og:title" content="${article.noHTMLDocTitle}" />
  <meta property="og:type" content="article" />
  <meta property="og:url" content="${article.jDocURL}" />

</#if> <!--end articleInfoX-->

<#--TODO this file suppose to have only meta tags, move below code to appropriate place-->
<#if pgURL?contains('fetchArticle.action') && articleInfoX??>
  <#--
  Do not mess with the whitespace in the following tag!
  It is specified by http://www.hixie.ch/specs/pingback/pingback-1.0#TOC2.2
  There should be exactly one space before the closing slash. If an auto-formatter ate it, please put it back.
  -->
  <link rel="pingback" href="${Request[freemarker_config.journalContextAttributeKey].baseUrl}/pingback" />
</#if>
