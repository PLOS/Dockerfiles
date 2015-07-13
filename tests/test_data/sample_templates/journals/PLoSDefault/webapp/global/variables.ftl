<#assign pgTitleOrig = freemarker_config.getTitle(templateFile, journalContext)>
<#assign pgTitle = pgTitleOrig>

<#if pgTitleOrig = "CODE_ARTICLE_TITLE" && articleInfoX??> <#--to get article title in w/o a new template for now-->
  <#assign pgTitle = freemarker_config.getArticleTitlePrefix(journalContext) + " " + articleInfoX.unformattedTitle>
</#if>

<#if pgTitleOrig = "BROWSE_PAGE_TITLE"> <#--get browse page title -->
  <#if !category??>
    <#assign pgTitle = freemarker_config.getArticleTitlePrefix(journalContext) + " " + " All Subject Areas">
  <#else>
    <#assign pgTitle = freemarker_config.getArticleTitlePrefix(journalContext) + " " +  category>
  </#if>
</#if>

<@s.url includeParams="get" includeContext="true" encode="false" id="pgURL"/>
<#assign rdfPgURL = pgURL?replace("&amp;", "&")>

<@s.url action="home" namespace="/" includeParams="none" includeContext="true" id="homeURL"/>

<@s.url action="authors" namespace="/static" includeParams="none" id="authorsURL"/>
<@s.url action="policies" namespace="/static" includeParams="none" id="policiesURL"/>
<@s.url action="competing" namespace="/static" includeParams="none" id="competingURL"/>
<@s.url action="guidelines" namespace="/static" includeParams="none" id="guidelinesURL"/>
<@s.url action="figureGuidelines" namespace="/static" includeParams="none" id="figureGuidelinesURL"/>
<@s.url action="checklist" namespace="/static" includeParams="none" id="cklistURL"/>
<@s.url action="eic" namespace="/static" includeParams="none" id="eicURL"/>
<@s.url action="about" namespace="/static" includeParams="none" id="aboutURL"/>
<@s.url action="sitemap" namespace="/static" includeParams="none" id="siteMapURL"/>
<@s.url action="information" namespace="/static" includeParams="none" id="informationURL"/>
<@s.url action="commentGuidelines" namespace="/static" includeParams="none" id="commentURL"/>
<@s.url action="ratingGuidelines" namespace="/static" includeParams="none" id="ratingURL"/>
<@s.url action="help" namespace="/static" includeParams="none" id="helpURL"/>
<@s.url action="feedback" namespace="/feedback" includeParams="none" id="feedbackURL"/>
<@s.url action="aeGuidelines" namespace="/static" includeParams="none" id="aeGuidelinesURL"/>
<@s.url action="submissionInstructions" namespace="/static" includeParams="none" id="manuscriptURL"/>
<@s.url action="publication" namespace="/static" includeParams="none" id="publicationURL"/>
<@s.url action="editorial" namespace="/static" includeParams="none" id="editorialURL"/>
<@s.url action="edboard" namespace="/static" includeParams="none" id="edboardURL"/>
<@s.url action="peerReviewers" namespace="/static" includeParams="none" id="peerReviewersURL"/>
<@s.url action="almInfo" namespace="/static" includeParams="none" id="almInfoURL"/>
<@s.url action="license" namespace="/static" includeParams="none" id="licenseURL"/>
<@s.url action="downloads" namespace="/static" includeParams="none" id="downloadsURL"/>
<@s.url action="journalClub" namespace="/static" includeParams="none" id="journalClubURL"/>
<@s.url action="browse" namespace="/article/browse" includeParams="none" id="browseURL"/>
<@s.url action="issue" namespace="/article/browse" includeParams="none" id="browseIssueURL"/>
<@s.url action="volume" namespace="/article/browse" includeParams="none" id="browseVolumeURL"/>
<@s.url action="pmedCollections" namespace="/static" includeParams="none" id="pmedCollectionsURL"/>
<@s.url action="benefits" namespace="/static" includeParams="none" id="benefitsURL"/>
<@s.url action="faq" namespace="/static" includeParams="none" id="faqURL"/>
<@s.url action="studentforum" namespace="/static" includeParams="none" id="studentforumURL"/>
<@s.url action="ghostwriting" namespace="/static" includeParams="none" id="ghostwritingURL"/>
<@s.url action="developing" namespace="/static" includeParams="none" id="developingURL"/>
<@s.url action="publish" namespace="/static" includeParams="none" id="whypublishURL"/>
<@s.url action="scope" namespace="/static" includeParams="none" id="scopeURL"/>
<@s.url action="privacy" namespace="/static" includeParams="none" id="privacyURL"/>
<@s.url action="terms" namespace="/static" includeParams="none" id="termsURL"/>
<@s.url action="releaseNotes" namespace="/static" includeParams="none" id="releaseNotesURL"/>
<@s.url action="hppcallforpapers" namespace="/static" includeParams="none" id="callForPapersURL"/>

<#-- wombat urls --> 
 <@s.url value="/siteContent/getting-started" includeParams="none" id="gettingstartedURL"/>
 <@s.url value="/siteContent/presubmission-inquiries" includeParams="none" id="presubmissioninquiriesURL"/>
 <@s.url value="/siteContent/submission-guidelines" includeParams="none" id="submissionguidelinesURL"/>
 <@s.url value="/siteContent/figures" includeParams="none" id="figuresURL"/>
 <@s.url value="/siteContent/tables" includeParams="none" id="tablesURL"/>
 <@s.url value="/siteContent/supporting-information" includeParams="none" id="supportingInformationURL"/>
 <@s.url value="/siteContent/latex" includeParams="none" id="latexURL"/>
 <@s.url value="/siteContent/revising-your-manuscript" includeParams="none" id="revisingyourmanuscriptURL"/>
 <@s.url value="/siteContent/other-article-types" includeParams="none" id="otherarticletypesURL"/>
 <@s.url value="/siteContent/submit-now" includeParams="none" id="submitnowURL"/>
 <@s.url value="/siteContent/best-practices-in-research-reporting" includeParams="none" id="bestpracticesinresearchreportingURL"/>
 <@s.url value="/siteContent/human-subjects-research" includeParams="none" id="humansubjectsresearchURL"/>
 <@s.url value="/siteContent/animal-research" includeParams="none" id="animalresearchURL"/>
 <@s.url value="/siteContent/competing-interests" includeParams="none" id="competinginterestsURL"/>
 <@s.url value="/siteContent/disclosure-of-funding-sources" includeParams="none" id="disclosureoffundingsourcesURL"/>
 <@s.url value="/siteContent/content-license" includeParams="none" id="contentlicenseURL"/>
 <@s.url value="/siteContent/data-availability" includeParams="none" id="dataavailabilityURL"/>
 <@s.url value="/siteContent/materials-and-software-sharing" includeParams="none" id="materialsandsoftwaresharingURL"/>
 <@s.url value="/siteContent/ethical-publishing-practice" includeParams="none" id="ethicalpublishingpracticeURL"/>
 <@s.url value="/siteContent/criteria-for-publication" includeParams="none" id="criteriaforpublicationURL"/>
 <@s.url value="/siteContent/editorial-and-peer-review-process" includeParams="none" id="editorialandpeerreviewprocessURL"/>
 <@s.url value="/siteContent/reviewer-guidelines" includeParams="none" id="reviewerGuidelinesURL"/>
 <@s.url value="/siteContent/accepted-manuscripts" includeParams="none" id="acceptedmanuscriptsURL"/>
 <@s.url value="/siteContent/corrections-and-retractions" includeParams="none" id="correctionsandretractionsURL"/>
 <@s.url value="/siteContent/comments" includeParams="none" id="commentsURL"/>
 <@s.url value="/siteContent/article-level-metrics" includeParams="none" id="articlelevelmetricsURL"/>
 <@s.url value="/siteContent/publish" includeParams="none" id="publishURL"/>
 <@s.url value="/siteContent/journal-information" includeParams="none" id="journalinformationURL"/>
 <@s.url value="/siteContent/section-editors" includeParams="none" id="sectionEditorsURL"/>
 <@s.url value="/siteContent/editors-in-chief" includeParams="none" id="editorsinchiefURL"/>
 <@s.url value="/siteContent/advisory-groups" includeParams="none" id="advisorygroupsURL"/>
 <@s.url value="/siteContent/publishing-information" includeParams="none" id="publishinginformationURL"/>
 <@s.url value="/siteContent/publication-fees" includeParams="none" id="publicationfeesURL"/>
 <@s.url value="/siteContent/press-and-media" includeParams="none" id="pressandmediaURL"/>
 <@s.url value="/siteContent/contact" includeParams="none" id="contactURL"/>
 <@s.url value="/siteContent/resources" includeParams="none" id="resourcesURL"/>
 <@s.url value="/siteContent/help-using-this-site" includeParams="none" id="helpURL"/>

<#assign nowString>${.now?string("yyyy-MM-dd")}T23:59:59Z</#assign>
<#-- 30 days ago -->
<#assign then = "${(.now?long - 2628000000)?number_to_datetime}" />
<#assign thenString>${then?datetime?string("yyyy-MM-dd")}T00:00:00Z</#assign>
<@s.url action="advancedSearch" namespace="/search" startPage="0" sort="Date, newest first"
  filterJournals="${currentJournal}"
  filterStartDate="${thenString}"
  filterEndDate="${nowString}"
  unformattedQuery="*:*"
  includeParams="none" id="recentArticlesURL"/>
<#include "../includes/journal_variables.ftl"/>
<@s.set var="actionName" value="com.opensymphony.xwork2.ActionContext.name" />