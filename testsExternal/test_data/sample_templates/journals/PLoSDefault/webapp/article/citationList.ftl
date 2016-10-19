
<div id="pagebdy-wrap">
  <div id="pagebdy">
    <div id="static-wrap">

      <@s.url id="jDocURL" namespace="/article" action="fetchArticle" includeParams="none" articleURI="${articleURI}" />

      <h1>Download Citation</h1>
      <@s.url id="fetchArticleURL" action="fetchArticle" articleURI="${articleURI}"/>
      <div class="source">
        <span>Article Source:</span>
        <@s.url id="articlePageURL" action="fetchArticle" namespace="/article" articleURI="${articleURI}" includeParams="none"/>
        <@s.a href="%{articlePageURL}" title="Back to original article" cssClass="article icon"><@articleFormat>${citation.title}</@articleFormat></@s.a>
      </div>
      <p class="intro">
        <#assign isCorrection=false/>
        <#include "citation.ftl"/>
      </p>
      <h2>Download the article citation in the following formats:</h2>
      <ul>
        <@s.url id="risURL" namespace="/article" action="getRisCitation" includeParams="none" articleURI="${articleURI}" />
        <li><a href="${risURL}" title="RIS Citation">RIS</a> (compatible with EndNote, Reference Manager, ProCite, RefWorks)</li>
        <@s.url id="bibtexURL" namespace="/article" action="getBibTexCitation" includeParams="none" articleURI="${articleURI}" />
        <li><a href="${bibtexURL}" title="BibTex Citation">BibTex</a> (compatible with BibDesk, LaTeX)</li>
      </ul>
    </div>
  </div><!-- pagebdy -->
</div><!-- pagebdy-wrap -->