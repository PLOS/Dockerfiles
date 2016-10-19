<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSPathogens/webapp/includes/article_header_kicker.ftl $
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

<#assign opinion>
Opinion articles provide a forum for expression of views, and responses to previous statements, on a range of topical, emerging and controversial issues.
</#assign>

<#assign pearls>
Pearls provide concise, practical and educational insights into topics that span the pathogens field.
</#assign>

<#assign review>
Review articles synthesize the best available evidence on a topic relevant to the pathogens community.
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

            <#if (articleType.heading == "Opinion")>
              ${opinion}
            <#elseif (articleType.heading == "Pearls")>
              ${pearls}
            <#elseif (articleType.heading == "Review")>
              ${review}
            </#if>
          </p>
          <a href="${articleTypeDescriptions}">See all article types &raquo;</a>
        </div>
      </div>
    </#if>
  </#if>
</div>