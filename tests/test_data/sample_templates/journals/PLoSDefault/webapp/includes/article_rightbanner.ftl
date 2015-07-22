<#import "../article/article_variables.ftl" as article>

<#assign journalURL = "${article.jDocURL}">

<#if journalURL?contains('biology')>
  <#assign skyscraper = 369>
  <@iFrameAd zone=skyscraper id="a23c0860" width="160" height="600" />
</#if>

<#if journalURL?contains('medicine')>
  <#assign skyscraper = 377>
  <@iFrameAd zone=skyscraper id="afecf984" width="160" height="600" />
</#if>

<#if journalURL?contains('compbiol')>
  <#assign skyscraper = 373>
  <@iFrameAd zone=skyscraper id="acd15d1a" width="160" height="600" />
</#if>

<#if journalURL?contains('genetics')>
  <#assign skyscraper = 367>
  <@iFrameAd zone=skyscraper id="aa056af1" width="160" height="600" />
</#if>

<#if journalURL?contains('pathogens')>
  <#assign skyscraper = 383>
  <@iFrameAd zone=skyscraper id="a9744cf1" width="160" height="600" />
</#if>

<#if journalURL?contains('one')>
  <#assign skyscraper = 381>
  <@iFrameAd zone=skyscraper id="a0852f54" width="160" height="600" />
</#if>

<#if journalURL?contains('ntds')>
  <#assign skyscraper = 379>
  <@iFrameAd zone=skyscraper id="aa657ccf" width="160" height="600" />
</#if>

<#if journalURL?contains('clinicaltrials')>
  <#assign skyscraper = 375>
  <@iFrameAd zone=skyscraper id="a9f128aa" width="160" height="600" />
</#if>

<#if journalURL?contains('collections')>
  <#assign skyscraper = 371>
  <@iFrameAd zone=skyscraper id="aee5902c" width="160" height="600" />
</#if>