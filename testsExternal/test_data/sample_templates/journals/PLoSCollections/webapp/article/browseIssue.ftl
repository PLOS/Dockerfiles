<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCollections/webapp/article/browseIssue.ftl $
  $Id: browseIssue.ftl 15116 2013-06-14 05:35:45Z mbaehr $

  Copyright (c) 2007-2012 by Public Library of Science
  http://www.plos.org

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

<#macro related articleInfo>
  <#if articleInfo.relatedArticles?size gt 0>
  <div class="related">
    <h4>Related ${freemarker_config.orgName} Articles</h4>
    <ul>
      <#list articleInfo.relatedArticles as ra>
        <#assign docURL = "${freemarker_config.doiResolverURL}${ra.doi?replace('info:doi/','')}">
        <li><a href="${docURL}" title="Read Open Access Article"><@articleFormat>${ra.title}</@articleFormat></a></li>
      </#list>
    </ul>
  </div>
  </#if>
</#macro>

<div id="pagebdy-wrap" class="bg-dk">
  <div id="pagebdy">

    <div id="toc-block">
      <h1>Table of Contents: ${issueInfo.displayName}</h1>

      <div class="layout-160_755 cf">

        <div class="col-1">
          <div class="nav" id="nav-toc"></div>
        </div>
        <!-- col-1 -->

        <div class="col-2">

          <div class="section cover cf">
            <a id="cover" name="cover" toc="cover" title="Cover"></a>

            <div class="header">
              <div class="kicker">COVER</div>
            <@s.url id="issueURL" action="issue" namespace="/article/browse" issue="${issueInfo.issueURI}"/>
              <h2><a href="${issueURL}">${issueTitle}</a></h2>

              <div class="credit">Image Credit: ${issueImageCredit}</div>
            </div>
            <div class="txt">
              <div class="img">
              <#if issueInfo.imageArticle?has_content>
                <@s.url id="imageSmURL" action="fetchObject" namespace="/article" uri="${issueInfo.imageArticle}.g001" representation="PNG_M" includeParams="none"/>
                <img src="${imageSmURL}" alt="Issue Image" data-doi="${issueInfo.imageArticle}">
              </#if>
              </div>
            ${issueDescription}
            </div>
          </div>

        <#list articleGroups as articleGrp>
          <div class="section">
            <a id="${articleGrp.id}" name="${articleGrp.id}" toc="${articleGrp.id}" title="${articleGrp.heading}"></a>
            <#if (articleGrp.count > 1)>
              <#assign articleHeader="${articleGrp.pluralHeading!articleGrp.heading!'No Header Defined'}">
            <#else>
              <#assign articleHeader="${articleGrp.heading!'No Header Defined'}">
            </#if>
            <h2>${articleHeader!"No Header Defined"}</h2>
            <#list articleGrp.articles as articleInfo>
              <div class="item cf">
                <@s.url id="fetchArticleURL" action="fetchArticle" namespace="/article" articleURI="${articleInfo.doi}"
                includeParams="none"/>
                <div class="header">
                  <h3><@s.a href="%{fetchArticleURL}" title="Read Open Access Article">
                          <@articleFormat>${articleInfo.title}</@articleFormat></@s.a>
                  </h3>

                  <div class="authors">
                    <#list articleInfo.authors as auth>
                    ${auth?trim}<#if auth_has_next>,</#if>
                    </#list>
                    <#if (articleInfo.collaborativeAuthors??)>
                      <#if (articleInfo.authors?size > 0) && (articleInfo.collaborativeAuthors?size > 0)>,</#if>
                      <#list articleInfo.collaborativeAuthors as cauth>
                      ${cauth?trim}<#if cauth_has_next>,</#if>
                      </#list>
                    </#if>
                  </div>
                </div>

                <#--Don't have content for this section yet>
                  <div class="txt">
                  <p></p>
                </div>-->

                <div class="article-info">
                  <p><b>${articleInfo.publishedJournal}:</b> published ${articleInfo.date?date?string("dd MMM yyyy")} | ${articleInfo.doi}</p>
                </div>

                <#if (articleGrp.heading == "Research Article") >
                  <div class="links">
                  <#--assuming that all research articles have abstract-->
                    <a data-doi="${articleInfo.doi}" class="abstract">Abstract</a>
                    <#if (articleInfo.hasFigures)>
                      &bull; <a data-doi="${articleInfo.doi}" class="figures">Figures</a>
                    </#if>
                  </div>
                </#if>

                <@related articleInfo=articleInfo/>
              </div>
            </#list>
          </div>
        </#list>

        </div>
        <!-- col-2 -->

      </div>
      <!-- layout-625_300 -->
    </div>
    <!-- toc-block -->
  </div>
  <!-- pagebdy -->

</div><!-- pagebdy-wrap -->
