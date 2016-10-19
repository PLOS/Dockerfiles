<#assign numArticles = mostViewedArticleInfo?size>
<#if (numArticles > 0)>
  <#list mostViewedArticleInfo as article>
    <div class="article-block">
      <@s.url id="articleURL" namespace="/article" action="fetchArticle" includeParams="none" articleURI="info:doi/${article.doi}"/>
      <#if (article.strkImgURI?? && article.strkImgURI?length > 0) >
        <@s.url id="fetchStrikingImgURL" action="fetchObject" namespace="/article" uri="${article.strkImgURI}" representation="PNG_M"/>
        <a href="${articleURL}"><img src="${fetchStrikingImgURL}" alt="" /></a>
      <#else>
        <img src="/images/generic-article-image.png" alt="">
      </#if>
      <div class="details">
        <h2><a href="${articleURL}" title="${article.title}"><@articleFormat>${article.truncatedTitle}</@articleFormat></a>
        </h2>
        <p title="${article.authors}">${article.truncatedAuthors}</p>
      </div><!-- /.details -->
      <ul class="actions">
        <li><a data-doi="info:doi/${article.doi}" class="abstract">Abstract</a></li>
        <li><a data-doi="info:doi/${article.doi}" class="figures">Figures</a></li>
        <li class="last"><a href="${articleURL}">Full Text</a></li>
      </ul>
    </div>
  </#list>
  <div class="pagination">
    <@s.url id="nextPageURL" action="mostViewedAlt" mostViewedStartIndex="${mostViewedNextIndex}"/>
    <p><a href="${nextPageURL}" class="more">more</a></p>
  </div><!-- /.pagination -->
<#else>
  <p class="message">Most viewed article information is currently not available. Please check back later.</p>
</#if>
