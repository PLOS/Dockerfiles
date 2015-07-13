<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSMedicine/webapp/includes/article_header_kicker.ftl $
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

<#assign bestPractice>
The Best Practice section, which was published until May 2006, summarized the current evidence on an important health intervention. PLOS Medicine no longer publishes this article type in the journal.
</#assign>

<#assign essay>
Essays are opinion pieces on a topic of broad interest to a general medical audience.
</#assign>

<#assign guidelinesGuidance>
The Guidelines and Guidance section contains advice on conducting and reporting medical research.
</#assign>

<#assign healthAction>
The Health in Action section provides a place where groups or individuals who are not represented regularly in a medical journal have a forum to describe the important issues from their perspective. Authors might include patient advocacy groups, healthcare workers, or non-governmental organizations.
</#assign>

<#assign learningForum>
Learning Forum articles are commissioned by our educational advisors. The section provides a forum for learning about an important clinical problem that is relevant to a general medical audience.
</#assign>

<#assign neglectedDiseases>
PLOS Medicine's Neglected Diseases section began with the launch of the journal in October 2004. Up until February 2008, the section focused on tropical infectious diseases, such as Buruli ulcer, trachoma, and hookworm. A list of the 21 articles published from October 2004 to February 2008 can be found in the Supporting Information section of our February 2008 Editorial. With the launch of PLOS Neglected Tropical Diseases in October 2007, the focus of the Neglected Diseases section of PLOS Medicine shifted from tropical diseases to other health problems that could be considered neglected and that have a significant global burden (such as reproductive and maternal health problems, mental illness in low- and middle-income countries, road traffic injuries, and health problems related to migration and conflict.). Read the February 2008 Editorial for information about the section.
</#assign>

<#assign perspective>
Perspectives are commissioned from an expert and discuss the clinical practice or public health implications of a published study. The original publication must be freely available online.
</#assign>

<#assign policyForum>
Policy Forum articles provide a platform for health policy makers from around the world to discuss the challenges and opportunities in improving health care to their constituencies.
</#assign>

<#assign researchTranslation>
Research in Translation articles discuss a particular drug, treatment, or public health intervention in the context of translation from early research to clinical research, or clinical evidence to practice.
</#assign>

<#assign review>
"Review articles synthesize in narrative form the best available evidence on a topic. Review articles are only published as part of Supplements to PLOS Medicine and are not featured in the PLOS Medicine Magazine.",
</#assign>

<#assign studentForum>
Student Forum essays were published until August 2009. They gave a medical student perspective on any topic related to medicine, health, or medical education. Student contributions are now hosted on Speaking of Medicine, the PLOS Medicine community blog.
</#assign>

<#assign synopsis>
PLOS Medicine published a Synopsis with every Research Article until May 2006. An Editors' Summary aimed at all medical professionals, whatever their specialty, and the general public, is now published at the end of each Research Article.
</#assign>

<#assign debate>
The PLOS Medicine Debate discusses important but controversial issues in clinical practice, public health policy, or health in general. Debates will be commissioned from two or more authors with differing points of view.
</#assign>

<#assign collectionReview>
Collection Review articles synthesize in narrative form the best available evidence on a topic. Submission of Collection Review articles is by invitation only, and they are only published as part of a PLOS Collection as agreed in advance by the PLOS Medicine Editors.
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

            <#if (articleType.heading == "Best Practice")>
              ${bestPractice}
            <#elseif (articleType.heading == "Essay")>
              ${essay}
            <#elseif (articleType.heading == "Guidelines and Guidance")>
              ${guidelinesGuidance}
            <#elseif (articleType.heading == "Health in Action")>
              ${healthAction}
            <#elseif (articleType.heading == "Learning Forum")>
              ${learningForum}
            <#elseif (articleType.heading == "Neglected Diseases")>
              ${neglectedDiseases}
            <#elseif (articleType.heading == "Perspective")>
              ${perspective}
            <#elseif (articleType.heading == "Policy Forum")>
              ${policyForum}
            <#elseif (articleType.heading == "Research in Translation")>
              ${researchTranslation}
            <#elseif (articleType.heading == "Review")>
              ${review}
            <#elseif (articleType.heading == "Student Forum")>
              ${studentForum}
            <#elseif (articleType.heading == "Synopsis")>
              ${synopsis}
            <#elseif (articleType.heading == "The PLoS Medicine Debate")>
              ${debate}
            <#elseif (articleType.heading == "Collection Review")>
              ${collectionReview}
            </#if>
          </p>
          <a href="${articleTypeDescriptions}">See all article types &raquo;</a>
        </div>
      </div>
    </#if>
  </#if>
</div>