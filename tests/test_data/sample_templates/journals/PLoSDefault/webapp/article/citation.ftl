<#list citation.authorList as author>
  <#if (author_index > 4) >
  <span class="citation_author">et al. </span>
    <#break>
  </#if>
  <#if (author_has_next) || (citation.authorList?size < 4 && citation.collaborativeAuthors?size > 0) > <#--Show a comma after last author if we're going to show collabs -->
  <span class="citation_author">${author.surnames!}<#if author.givenNames??>
    <@abbreviation>${author.givenNames!}</@abbreviation></#if><#if author.suffix?has_content>
  ${author.suffix?replace(".","")}</#if>,
    </span>
  <#else>
  <span class="citation_author">${author.surnames!}<#if author.givenNames??>
    <@abbreviation>${author.givenNames!}</@abbreviation></#if><#if author.suffix?has_content>
  ${author.suffix?replace(".","")}</#if>
      </span>
  </#if>
</#list>
<#if (citation.authorList?size < 4) >
  <#assign max_index = 4-citation.authorList?size>
  <#list citation.collaborativeAuthors as collab>
    <#if (collab_index > max_index) >
    <span class="citation_author">et al. </span>
      <#break>
    </#if><#-- The following line is so long
   because the browser was picking up tabs and inserting
   spaces in weird spots --><#if (collab_index > 0)><span
      class="citation_author">, ${collab}</span><#else><span class="citation_author">${collab}</span></#if></#list>
</#if>
<#if citation.year??><span class="citation_date">(${citation.year})</span></#if>
<#if citation.title??><#if !(citation.title?ends_with("?"))><#assign addPunctuation = "."></#if><span
    class="citation_article_title"><@articleFormat>${citation.title}</@articleFormat><#if addPunctuation??>${addPunctuation}</#if></span></#if>
<#if citation.journal??><span class="citation_journal_title">${citation.journal}</span></#if><span
    class="citation_issue"><#if citation.volume??> ${citation.volume}</#if><#if citation.issue??>(${citation.issue})</#if>:</span>
<#if citation.eLocationId??><span class="citation_start_page">${citation.eLocationId}.</span></#if>
<#if citation.doi??><span class="citation_doi">
<#if isCorrection>http://dx.doi.org/<#else> doi:</#if> ${citation.doi}</span></#if>
