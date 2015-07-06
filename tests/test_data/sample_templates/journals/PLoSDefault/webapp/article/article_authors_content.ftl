<div class="main cf" id="pjax-container">
  <#assign tab="authors" />
  <#include "../includes/article_tabs.ftl"/>

  <div id="about-authors">
    <#if authors?size == 1>
      <h2>About the Author</h2>
    <#else>
      <h2>About the Authors</h2>
    </#if>

    <dl class="authors">
      <#list authorsByAffiliation as affiliation>
        <dt>
          <#list affiliation.value as author>
          ${author.fullName}<#if author_has_next>, </#if>
          </#list>
        </dt>
        <dd>${affiliation.key}</dd>
      </#list>
    </dl>

    <#if correspondingAuthor?? && correspondingAuthor?size gt 0>
      <#if correspondingAuthor?size == 1>
        <h3>Corresponding Author</h3>
        <p>Email: ${correspondingAuthor[0]}</p>
      <#else>
        <h3>Corresponding Authors</h3>
        <ul>
          <#list correspondingAuthor as author>
            <li>Email: ${author}</li>
          </#list>
        </ul>
      </#if>
    </#if>

    <#if competingInterest?? && competingInterest?size gt 0>
      <h3>Competing Interests</h3>
      <#if competingInterest?size == 1>
        <p>${competingInterest[0]}</p>
      <#else>
        <ul>
          <#list competingInterest as interest>
            <li>${interest}</li>
          </#list>
        </ul>
      </#if>
    </#if>

    <#if authorContributions?? && authorContributions?size gt 0>
      <h3>Author Contributions</h3>
      <#if authorContributions?size == 1>
        <p>${authorContributions[0]}</p>
      <#else>
        <ul>
          <#list authorContributions as contribution>
            <li>${contribution}</li>
          </#list>
        </ul>
      </#if>
    </#if>

  </div><!--end about-authors-->
</div><!-- end main -->