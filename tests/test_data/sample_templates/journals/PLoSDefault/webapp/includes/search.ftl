<@s.url action="advancedSearch" namespace="/search" includeParams="all"
  noSearchFlag="true" query="" id="searchAdvancedURL"/>
<@s.url action="simpleSearch" namespace="/search" includeParams="all"
  noSearchFlag="true" query="" id="simpleSearchURL"/>
<div id="db">
  <form name="searchForm" action="${simpleSearchURL}" method="get" >
    <@s.hidden name="from" value="globalSimpleSearch"/>
    <@s.hidden name="filterJournals" value="${currentJournal}"/>
    <fieldset>
      <legend>Search</legend>
      <label for="search">Search</label>
      <div class="wrap">
        <input id="search" type="text" name="query" placeholder="Search">
        <input type="image" alt="SEARCH" src="/images/icon.search.gif">
      </div>
    </fieldset>
  </form>
  <#if searchAdvancedURL?contains("filterJournals=")>
    <a id="advSearch" href="${searchAdvancedURL}">advanced search</a>
  <#else>
    <a id="advSearch" href="${searchAdvancedURL}&filterJournals=${currentJournal}">advanced search</a>
  </#if>
</div>