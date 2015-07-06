<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSBiology/webapp/includes/article_header_kicker.ftl $
  $Id: article_header_kicker.ftl 12936 2012-11-30 21:54:56Z josowski $

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

<#assign communityPage>
The Community Page is a forum for organizations and societies to highlight their efforts to enhance the dissemination and value of scientific knowledge.
</#assign>

<#assign education>
The Education Series features noteworthy, innovative open-education programs to enhance understanding of biology.
</#assign>

<#assign essay>
Essays articulate a specific perspective on a topic of broad interest to scientists.
</#assign>

<#assign historicalPhilosophicalPerspectives>
The Historical and Philosophical Perspectives series provides professional historians and philosophers of science with a forum to reflect on topical issues in contemporary biology.
</#assign>

<#assign journalClub>
Journal Club is a forum for postdoctoral scientists and graduate students to discuss an important paper in the context of their own scientific interests.
</#assign>

<#assign perspective>
The Perspective section provides experts with a forum to comment on topical or controversial issues of broad interest.
</#assign>

<#assign primer>
Primers provide a concise introduction into an important aspect of biology highlighted by a current PLOS Biology research article.
</#assign>

<#assign synopsis>
Selected PLOS Biology research articles are accompanied by a synopsis written for a general audience to provide non-experts with insight into the significance of the published work.
</#assign>

<#assign unsolvedMystery>
Unsolved Mysteries discuss a topic of biological importance that is poorly understood and in need of research attention.
</#assign>

<div class="article-kicker">
  <#if articleType.heading == "Correction">
    <span class="corr_header"></span>
    <span id="article-type-heading">
      ${articleType.heading}
    </span>
  <#else>
    <#if articleType.heading == "Retraction" || articleType.heading == "Expression of Concern" >
      <span class="eoc-ret-header"></span>
      <span id="article-type-heading" class="eoc-ret">
        ${articleType.heading}
      </span>
    <#else>
      <span id="article-type-heading">
        ${articleType.heading}
      </span>
    </#if>
  </#if>

  <#if articleType.code??>
    <#if articleType.code != "research_article">

      <@s.url action="descriptions" namespace="/static" includeParams="none" id="articleTypeDescriptions"/>

      <div class="article-kicker-desc-container">
        <div class="article-kicker-desc">
          <p>
            <a href="${articleTypeDescriptions}#${articleType.code}">${articleType.heading}</a>

            <#if (articleType.heading == "Community Page")>
              ${communityPage}
            <#elseif (articleType.heading == "Education")>
              ${education}
            <#elseif (articleType.heading == "Essay")>
              ${essay}
            <#elseif (articleType.heading == "Historical and Philosophical Perspectives")>
              ${historicalPhilosophicalPerspectives}
            <#elseif (articleType.heading == "Journal Club")>
              ${journalClub}
            <#elseif (articleType.heading == "Perspective")>
              ${perspective}
            <#elseif (articleType.heading == "Primer")>
              ${primer}
            <#elseif (articleType.heading == "Synopsis")>
              ${synopsis}
            <#elseif (articleType.heading == "Unsolved Mystery")>
              ${unsolvedMystery}
            </#if>
          </p>
          <a href="${articleTypeDescriptions}">See all article types &raquo;</a>
        </div>
      </div>
    </#if>
  </#if>
</div>