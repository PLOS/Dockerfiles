<#if Request[freemarker_config.journalContextAttributeKey]?exists>
  <#assign journalContext = Request[freemarker_config.journalContextAttributeKey].journal>
<#else>
  <#assign journalContext = "">
</#if>

<#--include global variables -->
<#include "/global/variables.ftl">
<#--include the headers-->
<#include "/global/header.ftl">
<#--include the template-->
<#include "${templateFile}">
<#--include the footer-->
<#include "/global/footer.ftl">