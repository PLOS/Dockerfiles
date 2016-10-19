<div class="main cf" id="pjax-container">
  <#assign tab="article" />
  <#include "../includes/article_tabs.ftl"/>

  <div id="figure-thmbs" class="carousel cf">
    <div class="wrapper">
      <div class="slider">
        <#if articleAssetWrapper?size gt 0>
          <#list articleAssetWrapper as assets>
            <#assign name = "${assets.doi?replace('info:doi/10.1371/journal.','')}"/>
            <#assign formattedName = "${name?replace('.','-')}"/>
              <div class="item">
                <a href="#${formattedName}" data-doi="${articleInfoX.doi}" data-uri="${assets.doi}" title="${assets.title}">
                  <span class="thmb-wrap">
                    <img src="/article/fetchObject.action?uri=${assets.doi}&representation=PNG_I" alt="">
                  </span>
                </a>
              </div>
          </#list>
        </#if>
      </div>
    </div>
  </div>

  <div class="nav-col">
    <div class="nav" id="nav-article-page">
      <ul>
        <li class="nav-col-comments"><a href="${commentsTabURL}">Reader Comments (${commentary?size})</a></li>
        <#if (articleAssetWrapper?size > 0)>
          <li id="nav-figures"><a data-doi="${articleInfoX.doi}" >Figures</a></li>
        </#if>
      </ul>
    </div>
  </div>

  <div class="article">
    <#if (retraction?has_content)>
      <div id="fch" class="fch">
        <a id="retraction" name="retraction" toc="retraction" title= "Retraction Notice"></a>
        <div class="eoc-ret-title">
            <span></span>
            <strong>Retraction</strong>
        </div>
        <div>${retraction} </div>
        <div class="citation">
          <#assign isCorrection=false/>
          <#assign citation=retractionCitation/>
          <span class="date"> ${citation.publishedDate?string("d MMM yyyy") + ": "} </span>
          <#include "citation.ftl"/>
          <#if citation.doi??>
            <span>|</span>
            <a href= ${"\"/article/info:doi/" + citation.doi?url + "\""}>View retraction</a>
          </#if>
        </div>
      </div>
    </#if>

    <#if expressionOfConcern?has_content>
      <div id="fch" class="fch">
        <a id="eoc" name="eoc" toc="eoc" title= "Expression of Concern"></a>
        <div class="eoc-ret-title">
            <span></span>
            <strong>Expression of Concern</strong>
        </div>
        <div>${expressionOfConcern} </div>
        <div class="citation">
          <#assign isCorrection=false/>
          <#assign citation=eocCitation/>
          <span class="date"> ${citation.publishedDate?string("d MMM yyyy") + ": "} </span>
          <#include "citation.ftl"/>
          <#if citation.doi??>
              <span>|</span>
              <a href= ${"\"/article/info:doi/" + citation.doi?url + "\""}>View expression of concern</a>
          </#if>
        </div>
      </div>
    </#if>

  <#if articleCorrection?size gt 0 && !retractions?has_content && !expressionOfConcern?has_content>
    <div id="fch_corr" class="fch_corr">
      <a id="corrections" name="corrections" toc="corrections" title= "Corrections (${articleCorrection?size})"></a>
      <div class="corr_title">
        <span></span>
        <strong>Corrections</strong>
      </div>
      <div class="citation">
        <#list articleCorrection as citation>
          <p>
            <span class="date"> ${citation.publishedDate?string("d MMM yyyy") + ": "} </span>
            <#assign isCorrection=false/>
            <#include "citation.ftl"/>
            <#if citation.doi??>
              <span>|</span>
              <a href= ${"\"/article/info:doi/" + citation.doi?url + "\""}>View correction</a> </span>
            </#if>
          </p>
        </#list>
      </div>
    </div>
  </#if>

    <@s.property value="transformedArticle" escape="false"/>
  </div>

  <#list articleInfoX.articleAssets as asset>
      <input type="hidden" class="assetSize" name="${asset.doi}.${asset.extension}" value="${asset.size?c}"/>
  </#list>

</div><#-- main -->
