<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSNTD/webapp/includes/article_header_kicker.ftl $
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

<#assign debate>
Debate articles highlight controversial issues in the field of NTDs.
</#assign>

<#assign expertCommentary>
In an Expert Commentary, authors discuss the clinical, policy, public-health, or research implications of a freely available research article.
</#assign>

<#assign innovationApplication>
From Innovation to Application articles allow authors to discuss new technologies, including drugs, vaccines, and diagnostics.
</#assign>

<#assign historicalProfilesPerspectives>
Historical Profiles and Perspectives look back in history to discuss a notable figure or a control program.
</#assign>

<#assign interview>
Interviews highlight the work of someone who has made a notable contribution to controlling NTDs.
</#assign>

<#assign photoQuiz>
The Photo Quiz presents a clinical image and brief case discussion followed by questions, learning points, and key references.
</#assign>

<#assign policyPlatform>
The Policy Platform is for authors to discuss policies that could improve the lives of those at risk of, or affected by, the NTDs.
</#assign>

<#assign review>
Review articles summarize the best available evidence on a topic relevant to the NTD community.
</#assign>

<#assign symposium>
In Symposium articles, authors discuss a real-world problem, from the clinic, laboratory, or community, and how best it can be tackled.
</#assign>

<#assign viewpoints>
Viewpoints are opinion pieces grounded in evidence on topics of broad interest to the journal's readership.
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

            <#if (articleType.heading == "Debate")>
              ${debate}
            <#elseif (articleType.heading == "Expert Commentary")>
              ${expertCommentary}
            <#elseif (articleType.heading == "From Innovation to Application")>
              ${innovationApplication}
            <#elseif (articleType.heading == "Historical Profiles and Perspectives")>
              ${historicalProfilesPerspectives}
            <#elseif (articleType.heading == "Interview")>
              ${interview}
            <#elseif (articleType.heading == "Photo Quiz")>
              ${photoQuiz}
            <#elseif (articleType.heading == "Policy Platform")>
              ${policyPlatform}
            <#elseif (articleType.heading == "Review")>
              ${review}
            <#elseif (articleType.heading == "Symposium")>
              ${symposium}
            <#elseif (articleType.heading == "Viewpoints")>
              ${viewpoints}
            </#if>
          </p>
          <a href="${articleTypeDescriptions}">See all article types &raquo;</a>
        </div>
      </div>
    </#if>
  </#if>
</div>