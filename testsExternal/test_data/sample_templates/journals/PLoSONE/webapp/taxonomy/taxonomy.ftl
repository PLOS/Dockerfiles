<div id="pagebdy-wrap">
  <div id="pagebdy">
    <div id="static-content-wrap">
      <div id="tax" class="taxonomy explore">
        <h1><em>PLOS</em> Subject Areas</h1>
        <p>Click on the links below to browse papers or subscribe to an RSS feed for the selected subject area.</p>
        <#list topAndSecondLevelCategories.entrySet() as category>
          <a name="${category.key.toLowerCase().replaceAll(" ", "_")}" />
          <h2>
            <@s.url id="browseURL" category="${category.key?replace(' ','_')?lower_case?url}" namespace="/taxonomy" action="browse" />
            <@s.url id="advancedSearchFeedURL" unformattedQuery="subject:\"${category.key}\"" sort="Date, newest first" namespace="/article/feed" action="executeFeedSearch" />
            <a href="${browseURL}">${category.key}</a>
            <a href="${advancedSearchFeedURL}"><img src="images/icon.rss.16.png" alt="RSS"></a>
          </h2>
          <ul class="tax-two-column-ul">
            <#list category.value as secondLevelCat>
              <li class="tax-two-column-li">
                <@s.url id="browseURL" category="${secondLevelCat?replace(' ','_')?lower_case?url}" namespace="/taxonomy" action="browse" />
                <@s.url id="advancedSearchFeedURL" unformattedQuery="subject:\"${secondLevelCat}\"" sort="Date, newest first" namespace="/article/feed" action="executeFeedSearch" />
                <a href="${browseURL}">${secondLevelCat}</a>
                <a href="${advancedSearchFeedURL}"><img src="images/icon.rss.16.png" alt="RSS"></a>
              </li>
            </#list>
          </ul>
        </#list>
      </div>
    </div>
  </div>
</div>