<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSDefault/webapp/includes/article_header.ftl $
  $Id: article_header.ftl 14322 2013-04-12 01:07:28Z mbaehr $

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
    Inclusions of this template should be preceded by
        <#import "../article/article_variables.ftl" as article>

    Every value referenced in this page must be supplied either from article_variables.ftl or the Struts interface:
        org.ambraproject.action.article.ArticleHeaderAction
    If you add a new reference here that depends on a Struts action, you must modify ArticleHeaderAction (and its
    implementations) to reflect the dependency. Conversely, this template may be included only in pages whose Struts
    actions implement the ArticleHeaderAction interface.
  -->

<div class="article-meta cf">
  <ul id="almSignPost" style="display: none;"></ul>
  <div class="article-type">
    <span class="type oa">Open Access</span>
    <#if isResearchArticle>
      <span class="type pr">Peer-Reviewed</span>
    </#if>
  </div>
</div>

<div class="header" id="hdr-article">
  <#include "article_header_kicker.ftl" />
  <h1 property="dc:title" datatype="" rel="dc:type" href="http://purl.org/dc/dcmitype/Text">
    <@articleFormat>${article.docTitle}</@articleFormat>
  </h1>

  <ul class="authors">
    <#list authors as author>
      <li>

        <#-- Check whether <div class="author_meta"> below would contain anything. -->
        <#assign hasMeta = author.equalContrib || author.deceased || author.corresponding??
        || (author.affiliations?? && author.affiliations?size gt 0) || author.currentAddress??
        || (author.customFootnotes?? && author.customFootnotes?size gt 0) />

        <span rel="dc:creator" class="author<#if !hasMeta> no_author_meta</#if>">
          <span class="person" property="foaf:name" typeof="foaf:Person">
            <#-- Whitespace between #if tags is significant here. Correctness trumps readability.
              -  Elements following the author name must have a space before them.
              -  There must not be a space between the comma and whatever comes before it.
              -->
            ${author.fullName}<#if author.onBehalfOf??>, ${author.onBehalfOf}</#if><#if author.relatedFootnote>
              <span class="rel-footnote" title="Related Footnote">¶</span></#if><#if author.equalContrib>
              <span class="equal-contrib"
                    title="These authors contributed equally to this work">equal contributor</span></#if><#if author.corresponding??>
              <span class="corresponding">mail</span></#if><#if author.deceased>
              †</#if><#if author_has_next>, </#if>
          </span>
        </span>

        <#if hasMeta>
          <div class="author_meta">
            <div class="author_inner">

              <#if author.equalContrib>
                <p><span class="equal-contrib" title="These authors contributed equally to this work">equal contributor</span>
                Contributed equally to this work with: ${contributingAuthors}</p>
              </#if>

              <#if author.deceased><p>† Deceased.</p></#if>
              <#if author.corresponding??><p>${author.corresponding}</p></#if>

              <#if author.affiliations?? && author.affiliations?size gt 0>
                <p><#if author.affiliations?size gt 1>Affiliations:<#else>Affiliation:</#if>
                  <#list author.affiliations as affil>
                  ${affil}<#if affil_has_next>, </#if>
                  </#list>
                </p>
              </#if>

              <#if author.currentAddresses?? && author.currentAddresses?size gt 0>
                <p>
                  <#list author.currentAddresses as address>
                    ${address}<#if address_has_next>; </#if>
                  </#list>
                </p>
              </#if>

              <#if author.customFootnotes?? && author.customFootnotes?size gt 0>
                <#list author.customFootnotes as note>
                  ${note}
                </#list>
              </#if>
              <span class="close">X</span>

            </div>
          </div>
        </#if>
      </li>
    </#list>
  </ul>
  <ul class="date-doi-line">
    <li>Published: ${article.date?date("yyyy-MM-dd")?string("MMMM dd, yyyy")}</li>
    <li>DOI: ${article.shortDOI}</li>
    <#if (article.publisher?length > 0)>
      <li>${article.publisher}</li>
    </#if>
  </ul>


</div><!--end header-->
