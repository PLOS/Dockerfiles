<#--
  Copyright (c) 2007-2013 by Public Library of Science

  http://plos.org
  http://ambraproject.org

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<div class="main cf" id="pjax-container">

<#assign tab="related" />
<#include "../includes/article_tabs.ftl"/>

  <input type="hidden" name="reCaptcha-info" id="reCaptcha-info" value='${reCaptchaPublicKey}'/>

  <div id="media_coverage">
    <h2>Media Coverage of this Article <#--a href="" class="ir" title="More information">info</a--></h2>
    <div id="media_coverage_addition">Found additional news media or blog coverage for the article? <a id="media-coverage-form-link">Please let us know.</a></div>

    <div id="media-coverage-data"></div>

    <div id="media-coverage-modal" style="display: none;">

      <div id="media-coverage-form" class="cf">
        <form onsubmit="return false;" class="form standard">
          <ul>
            <li class="small cf">
              <div>
                <label for="mcform-name">Your name:</label>
                <input type="text" name="name" id="mcform-name" <#if user??>value="${user.displayName}"</#if>>
                <span class="form-error"></span>
              </div>
              <div class="last">
                <label for="mcform-email">Your email address:</label>
                <input type="text" name="email" id="mcform-email" <#if user??>value="${user.email}"</#if>>
                <span class="form-error"></span>
              </div>
            </li>
            <li class="cf">
              <label for="mcform-link">Media link URL (website)</label>
              <input type="text" name="link" id="mcform-link" placeholder="e.g. http://www...." maxlength="1000">
              <span class="form-error"></span>
            </li>
            <li><label for="mcform-comment">Comments:</label>
              <textarea rows="4" cols="50" name="comment" id="mcform-comment" maxlength="1000"></textarea>
            </li>
            <li><label>Security Check:</label>

              <p class="note">This question is to determine if you're a human visitor in order to prevent automated spam
                submissions. </p>

              <div id="mcform-captcha"></div>
              <span class="form-error"></span>
            </li>
            <li>

              <span class="button primary">submit</span>
              <span class="button cancel">cancel</span>

            </li>
          </ul>
        </form>
      </div>

      <div id="media-coverage-success">
        <h3>Thank you!</h3>

        <p>Your submission will be reviewed by our staff.</p>
      </div>

      <div id="media-coverage-failure">
        <p>There was a problem with your submission. Please try again later.</p>
      </div>
    </div>
  </div>

<#if articleInfoX?? && articleInfoX.relatedArticles?size gt 0>
  <div id="suggestions" class="cf">
    <h2>Linked Articles</h2>

    <#list articleInfoX.relatedArticles as ra>
      <div class="module">
        <#assign relatedArticleURL = "${freemarker_config.doiResolverURL}${ra.uri?replace('info:doi/','')}" />
        <h3><a href="${relatedArticleURL}"><@articleFormat>${ra.title}</@articleFormat></a></h3>
        <#list ra.authors as author>
          <#if (author_index > 10) >...<#break></#if>
        ${author}<#if author_has_next>, </#if>
        </#list>
        <div class="meta">
        ${ra.articleTypeForDisplay} | published ${ra.date?string("d MMM yyyy")} | ${ra.publishedJournal} <br/>
          doi:${ra.uri?replace('info:doi/','')}
        </div>
      </div>
    </#list>

  </div>
</#if>

<#if articleInfoX??>
  <div id="figshare-related-container">
    <div id="figshare-related" data-doi="${articleInfoX.doi?replace('info:doi/','')}" class="cf"></div>
  </div>
</#if>

  <input type="hidden" name="related_author_query" id="related_author_query" value='${relatedAuthorSearchQuery}'/>

  <div id="more_by_authors" style="display: none;">
    <h2>More by these Authors</h2>
    <ul></ul>
  </div>

  <div id="related_collections" class="cf">
    <div>
      <h3>Related Authors</h3>
      <ul>
      <#list articleInfoX.authorsForRelatedSearch as author >
        <@s.url id="advancedSearchURL" unformattedQuery="author:\"${author}\"" namespace="/search" action="advancedSearch" />
        <li><a href="${advancedSearchURL}">${author}</a></li>
      </#list>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript" src="http://static.figshare.com/publishers/loaders/plos_related.js"></script>
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
