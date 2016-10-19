<#assign numArticles = newsArticleInfo?size>
<#if (numArticles > 0)>
  <#list newsArticleInfo as article>
    <div class="article-block">
      <@s.url id="articleURL" namespace="/article" action="fetchArticle" includeParams="none" articleURI="${article.doi}"/>
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
        <li><a data-doi="${article.doi}" class="abstract">Abstract</a></li>
        <li><a data-doi="${article.doi}" class="figures">Figures</a></li>
        <li class="last"><a href="${articleURL}">Full Text</a></li>
      </ul>
    </div>
  </#list>
<#else>
  <p class="message">News article information is currently not available. Please check back later.</p>
</#if>