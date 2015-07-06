<#if Request[freemarker_config.journalContextAttributeKey]?exists>
  <#assign journalContext = Request[freemarker_config.journalContextAttributeKey].journal>
<#else>
  <#assign journalContext = "">
</#if>

<#if articleInfoX??>
  <#assign shortDOI = "${articleInfoX.doi?replace('info:doi/','')}" />
  <#assign docURL = freemarker_config.doiResolverURL + shortDOI />
  <#assign jDocURL = freemarker_config.getJournalUrl(journalContext) + "/article/" + articleInfoX.doi?url />
  <#assign docTitle><@compress single_line=true>${articleInfoX.title}</@compress></#assign>
  <#assign date = articleInfoX.date?string("yyyy-MM-dd") />
  <#assign articlePublisher = articleInfoX.publisher!"PLOS" />

  <#-- This is article description content without any markup -->
  <#if articleDescription?? && (articleDescription?length > 0) >
    <#assign description = articleDescription />
  </#if>
<#else>
  <#assign shortDOI = "" />
  <#assign docURL = "" />
  <#assign jDocURL = "" />
  <#assign docTitle = "" />
  <#assign date = "" />
  <#assign articlePublisher = "" />
</#if>

<#assign plainDocTitle><@articleFormat><@simpleText>${docTitle}</@simpleText></@articleFormat></#assign>
<#-- Remove ALL remaining HTML codes -->
<#assign plainDocTitle = plainDocTitle?replace('<.+?>','','r') />
<#assign noHTMLDocTitle = docTitle?replace('<.+?>','','r') />

<#--EZ Reprint Data -->

<#assign ezReprintJournalID = "0" />

<#-- PLOSBiology -->
<#if articleInfoX.eIssn == "1545-7885">
  <#assign ezReprintJournalID = "1" />
</#if>

<#-- PLOSMedicine -->
<#if articleInfoX.eIssn == "1549-1676">
  <#assign ezReprintJournalID = "2" />
</#if>

<#-- PLOSCompBiol -->
<#if articleInfoX.eIssn == "1553-7358">
  <#assign ezReprintJournalID = "3" />
</#if>

<#-- PLOSGenetics -->
<#if articleInfoX.eIssn == "1553-7404">
  <#assign ezReprintJournalID = "4" />
</#if>

<#-- PLOSPathogens -->
<#if articleInfoX.eIssn == "1553-7374">
  <#assign ezReprintJournalID = "5" />
</#if>

<#-- PLOSONE -->
<#if articleInfoX.eIssn == "1932-6203">
  <#assign ezReprintJournalID = "7" />
</#if>

<#-- PLOSClinicalTrials -->
<#if articleInfoX.eIssn == "1555-5887">
  <#assign ezReprintJournalID = "6" />
</#if>

<#-- PLOSNTD -->
<#if articleInfoX.eIssn == "1935-2735">
  <#assign ezReprintJournalID = "316" />
</#if>

<#if (pageCount?? && pageCount > 0)>
  <#assign ezReprintLink>https://www.odysseypress.com/onlinehost/reprint_order.php?type=A&page=0&journal=${ezReprintJournalID}&doi=${shortDOI}&volume=&issue=&title=${noHTMLDocTitle}&author_name=${authorNames?url}&start_page=1&end_page=${pageCount}</#assign>
</#if>

<#if articleIssues?? && articleIssues?size gt 0>
  <#list articleIssues as oneIssue>
    <#if (freemarker_config.getDisplayName(oneIssue[1])?lower_case?index_of("collections") gt -1)>
      <#if !collections??>
        <#assign collections = "">
      </#if>

      <#assign collections = collections + "<dd><a href=\"" + freemarker_config.getJournalUrl(oneIssue[1]) +
      freemarker_config.context + "/article/browse/issue/" + oneIssue[4]?url +
      "\" title=\"Browse the Open-Access Collection\">" + oneIssue[5] + "</a></dd>" />

    <#else>
      <#if !issues??>
        <#assign issues = "">
      </#if>
      <#assign issues = issues + "<a href=\"" + freemarker_config.getJournalUrl(oneIssue[1]) + freemarker_config
      .context + "/article/browse/issue/" + oneIssue[4]?url +
      "\" title=\"Browse the Open-Access Issue\">" + oneIssue[5] + " " + oneIssue[3] + " Issue of <em>" +
      freemarker_config.getDisplayName(oneIssue[1]) + "</em></a>" />
    </#if>
  </#list>
</#if>

<#assign publisher = "">

<#if journalList??>
  <#list journalList as jour>
    <#-- Special Case -->
    <#if (journalList?size == 1) && (jour.journalKey == journalContext)>
      <#if jour.journalKey == "PLOSClinicalTrials">
        <#assign jourAnchor = "<a href=\"" + freemarker_config.getJournalUrl(jour.journalKey) + "/static/faq\">"/>
        <#assign publisher="Published in <em>" + jourAnchor + "PLOS Clinical Trials</a></em>" />
      </#if>
    <#-- Normal Case -->
    <#-- Don't worry about displaying articles cross published to collections -->
    <#elseif jour.journalKey != journalContext && jour.journalKey != "PLOSCollections">
      <#-- Article is originally published elsewhere -->
      <#if articleInfoX.eIssn = jour.eIssn>
        <#assign publisher = "Published in <em><a href=\"" + freemarker_config.getJournalUrl(jour.journalKey)
        + "\">"+ jour.title + "</a></em>" />
        <#break/>
      <#-- Article is additionally published elsewhere -->
      <#else>
        <#assign jourAnchor = "<a href=\"" + freemarker_config.getJournalUrl(jour.journalKey) + "\">"/>

        <#if jour.journalKey == "PLOSClinicalTrials">
          <#assign title = "PLOS Hub for Clinical Trials">
        <#else>
          <#assign title = jour.title>
        </#if>

        <#if publisher?length gt 0>
          <#assign publisher = publisher + ", " + jourAnchor + title + "</a>" />
        <#else>
          <#assign publisher = "Featured in " + jourAnchor + title + "</a>" />
        </#if>
      </#if>
    </#if>
  </#list>
</#if>

<@s.url id="articleCitationURL" namespace="/article" action="citationList" includeParams="none" articleURI="${articleURI}"/>
<@s.url id="articleXMLURL" namespace="/article" action="fetchObjectAttachment" includeParams="none" uri="${articleURI}">
  <@s.param name="representation" value="%{'XML'}"/>
</@s.url>
<@s.url id="articlePDFURL" namespace="/article" action="fetchObject" includeParams="none" uri="${articleURI}">
  <@s.param name="representation" value="%{'PDF'}"/>
</@s.url>