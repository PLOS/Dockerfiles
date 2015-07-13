<#--
 We only support US English.  This forces freemarker to stay in the correct mode
 regardless of what the user's browser sends us.
-->
<#setting locale="en_US">

<@s.url id="thisPageURL" includeParams="get" includeContext="true" encode="false"/>

<#-- make sure the 'thisPageURL' variable is in the imported namespace as well as the root-->
<#assign thisPageURL = "${thisPageURL}">

<#-- remove duplicate articleURI specification, e.g. /article/doi?articleURL=doi -->
<#if thisPageURL?matches(r"^(/.+)?/article.*/info(:|%3A)doi(/|%2F).+")>
  <#assign thisPage = thisPageURL?replace(r"\??articleURI=info%3Adoi%2F.{30}", "", "r")?replace("&amp;", "&")?url>
<#-- dont to anything if we're already on the feedbackCreate.action page -->
<#else>
  <#assign thisPage = thisPageURL?replace("&amp;", "&")?url>
</#if>