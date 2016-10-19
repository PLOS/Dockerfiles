<div id="pagebdy-wrap" class="bg-dk">
  <div id="pagebdy">
    <div id="toc-block">
      <h1>Journal Archive</h1>

      <#if currentIssue??>
        <@s.url id="currentIssueURL" action="issue" namespace="/article/browse"
            issue="${currentIssue.issueURI}" includeParams="none"/>
        <div class="journal_current">
          <h2>Current Issue</h2>
          <div class="issue_container">
            <#if currentIssue.imageArticle?exists>
              <@s.url id="currentIssueImgURL" action="fetchObject" namespace="/article"
                uri="${currentIssue.imageArticle}.g001" representation="PNG_S" includeParams="none"/>
              <div class="journal_thumb">
                <a href="${currentIssueURL}">
                  <img src="${currentIssueImgURL}" alt="FPO Current Journal Thumb" />
                  <span>${currentVolume.displayName}</span>
                </a>
              </div>
            </#if>

            <div class="journal_description">
              <span class="tag">ABOUT THIS IMAGE</span>
              <br/>
              <p>${currentIssueDescription}</p>
            </div>
          </div> <!--  issue_container -->
        </div><!-- /.journal_current -->
      </#if>

      <#if volumeInfos?exists>
        <div class="journal_issues">

          <h3>All Issues</h3>

          <ul id="journal_years">
            <#list volumeInfos as volumeInfo>
              <li class="btn primary"><a href="#${volumeInfo.displayName}">${volumeInfo.displayName}</a></li>
            </#list>
          </ul>

          <ul id="journal_slides">
            <#list volumeInfos as volumeInfo>
              <li id="${volumeInfo.displayName}" class="slide">
                <ul>
                  <#list volumeInfo.issueInfos as issueInfo>
                    <@s.url id="issueURL" action="issue" namespace="/article/browse" issue="${issueInfo.issueURI}"
                    includeParams="none"/>
                    <li<#if ((issueInfo_index + 1) % 6) = 0> class="endrow"</#if>><a href="${issueURL}">
                      <#if issueInfo.imageArticle?exists>
                        <@s.url id="issueImgURL" action="fetchObject" namespace="/article"
                        uri="${issueInfo.imageArticle}.g001" representation="PNG_S" includeParams="none"/>
                        <img src="${issueImgURL}"  alt="FPO Journal Cover" />
                      </#if><span>${issueInfo.displayName}</span></a></li>
                  </#list>
                </ul>
              </li>
            </#list>
          </ul>
        </div><#-- journal_issues -->
      </#if>
    </div><#-- toc-block -->
  </div><#-- pagebdy -->
</div><#-- pagebdy-wrap -->
