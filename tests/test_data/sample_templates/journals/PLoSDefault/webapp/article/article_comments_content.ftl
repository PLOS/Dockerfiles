<@s.url namespace="/annotation/secure" includeParams="none" id="startDiscussionUrl" action="startDiscussion" articleURI="${articleInfoX.doi}"/>

<div class="main cf" id="pjax-container">
  <#assign tab="comments" />
  <#include "../includes/article_tabs.ftl"/>

  <div id="thread">
    <h2>Reader Comments (${commentary?size})</h2>

    <p class="post_comment"><a href="${startDiscussionUrl}">Post a new comment</a> on this article</p>

    <ul id="threads">
      <#list commentary as comment>
        <@s.url namespace="/annotation" includeParams="none" id="listThreadURL" action="listThread" root="${comment.ID?c}"/>
        <@s.url namespace="/user" includeParams="none" id="showUserURL" action="showUser" userId="${comment.creatorID?c}"/>

        <li class="cf">
          <div class="responses">
              <span>${comment.totalNumReplies}</span> <#if comment.totalNumReplies == 1>Response<#else>Responses</#if>
          </div>
          <div class="recent">
            ${comment.lastReplyDate?string("dd MMM yyyy '<br/>' HH:mm zzz")}<br/>
            <span>Most Recent</span>
          </div>
          <div class="title">
            <a href="${listThreadURL}">${comment.title}</a>
            <span>Posted by <a href="${showUserURL}">${comment.creatorDisplayName}</a> on
              ${comment.created?string("dd MMM yyyy 'at' HH:mm zzz")}
            </span>
          </div>
        </li>
      </#list>
    </ul>
  </div><!--end thread -->

</div><!--end main -->