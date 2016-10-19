<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:foaf="http://xmlns.com/foaf/0.1/"
      xmlns:dc="http://purl.org/dc/terms/"
      xmlns:doi="http://dx.doi.org/"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema-datatypes#"
      lang="en" xml:lang="en"
      itemscope itemtype="http://schema.org/Article"
      class="no-js">
<head prefix="og: http://ogp.me/ns#">
  <title>${pgTitle}</title>

  <#include "/includes/css.ftl">

  <#-- FontDeck font loader http://fontdeck.com/support/fontloader -->
  <link rel="stylesheet" href="http://f.fontdeck.com/s/css/js/${request.getServerName()}/24557.css" type="text/css"/>

  <!--chartbeat -->
  <script type="text/javascript">var _sf_startpt = (new Date()).getTime()</script>
  <script>document.documentElement.className += ' js';</script>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9"/>
  <meta name="description" content="${freemarker_config.getMetaDescription(journalContext)}"/>
  <meta name="keywords" content="${freemarker_config.getMetaKeywords(journalContext)}"/>
  <meta name="almHost" content="${freemarker_config.get("almHost")}"/>
  <meta name="searchHost" content="${freemarker_config.get("searchHost")}" />
  <meta name="termsHost" content="${freemarker_config.get("termsHost")}" />
  <meta name="solrApiKey" content="${freemarker_config.get("solrApiKey")}"/>
  <meta name="almAPIKey" content="${freemarker_config.get("almAPIKey")}" />
  <meta name="currentJournal" content="${currentJournal}" />
  <meta name="almRequestBatchSize" content="${freemarker_config.get("almRequestBatchSize")}" />

  <#include "../includes/article_meta_tags.ftl">
  <#include "banner_macro.ftl"/>

  <#if actionName == "browse">
    <#if category??>
      <@s.url id="browseURL" namespace="/" action="browse" category="${category?replace(' ','_')?lower_case?url}" />
    <#else>
      <@s.url id="browseURL" namespace="/" action="browse"/>
    </#if>
    <link rel="canonical" href="${Request[freemarker_config.journalContextAttributeKey].baseUrl}${browseURL}" />
  </#if>

  <link rel="shortcut icon" href="${freemarker_config.context}/images/favicon.ico" type="image/x-icon"/>
  <link rel="home" title="home" href="${homeURL}"/>
  <link rel="alternate" type="application/rss+xml"
        title="${freemarker_config.getArticleTitlePrefix(journalContext)} New Articles"
        href="${Request[freemarker_config.journalContextAttributeKey].baseUrl}/article/feed"/>
</head>
<body>
  <#import "../includes/global_body.ftl" as global>

  <div id="page-wrap">
    <div id="topbanner" class="cf">
      <#include "../includes/home_topbanner.ftl">
    </div>

    <div id="pagehdr-wrap">
      <div id="pagehdr">
        <div id="user" class="nav">
          <ul>
            <li><a href="http://www.plos.org">plos.org</a></li>
          <#if Session["AMBRA_USER"]?exists>
            <@s.url id="editProfileURL" includeParams="none" namespace="/user/secure" action="editProfile"/>
            <li><a href="${editProfileURL}" title="Edit your account profile and alert settings">profile</a></li>
            <@s.url id="logoutURL" includeParams="none" namespace="/user/secure" action="secureRedirect" goTo="${freemarker_config.casLogoutURL}?service=${Request[freemarker_config.journalContextAttributeKey].baseUrl}/logout.action"/>
            <li class="btn-style"><a href="${logoutURL}">sign out</a></li>
          <#else>
            <li><a href="${freemarker_config.registrationURL}">create account</a></li>
            <@s.url id="loginURL" includeParams="none" namespace="/user/secure" action="secureRedirect" goTo="${global.thisPage}"/>
            <li class="btn-style"><a
              href="${freemarker_config.context}/user/secure/secureRedirect.action?goTo=${global.thisPage}">sign in</a>
            </li>
          </#if>
          </ul>
        </div>
        <div class="logo">
          <a href="${homeURL}"><img src="/images/logo.png" alt="${freemarker_config.getDisplayName(journalContext)}"></a>
        </div>

        <#include "/includes/common_navbar.ftl">

      </div>
      <!-- pagehdr-->
    </div>
    <!-- pagehdr-wrap -->

  <!--body and html tags gets closed in global_footer.ftl-->
