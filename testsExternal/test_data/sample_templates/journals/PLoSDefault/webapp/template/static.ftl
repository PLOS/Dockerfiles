<#if Request[freemarker_config.journalContextAttributeKey]?exists>
  <#assign journalContext = Request[freemarker_config.journalContextAttributeKey].journal>
<#else>
  <#assign journalContext = "">
</#if>

<#--include global variables -->
<#include "/global/variables.ftl">

<#--include the headers-->
<#include "/global/header.ftl">
<!--include the template-->

<#--
  This template is called only for static content.  If something fails, assume it's a 404
  and handle it gracefully

  TODO: There should be away to check for the files existence in the virturalJournalContext.
  Handling the error here results in a 400 response code instead of a 404
-->
<div id="pagebdy-wrap">
  <div id="pagebdy">
    <div id="static-content-wrap">

      <#attempt>
        <#include "${templateFile}">
        <#recover>
        ${response.setStatus(404)}
        <#include "/pageNotFoundContent.ftl">
      </#attempt>

    </div><!-- static-wrap -->
  </div><!-- pagebdy -->
</div><!-- pagebdy-wrap -->

<#--include the footer-->
<#include "/global/footer.ftl">