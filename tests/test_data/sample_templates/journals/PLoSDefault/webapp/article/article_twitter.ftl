<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/branches/se-162/journals/PLoSDe#$
  $Id: article_twitter.ftl 15204 2013-06-24 23:39:48Z jperalta $

  Copyright (c) 2007-2010 by Public Library of Science
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
<@s.url id="help" includeParams="none" namespace="/static" action="help" />

<div id="pagebdy-wrap">
  <div id="pagebdy">
    <div id="static-wrap">
      <a id="top" name="top" toc="top" title="Top"></a>

      <h1>Tweets of this article on Twitter <a href="${help}#crossrefCitation" class="ir"
        title="More information">info</a></h1>

      <div class="source">
        <div style="float:left;">
          <@s.url id="articleTabURL" namespace="/article" action="fetchArticle" includeParams="all" />
          <a href="${articleTabURL}" title="Back to original article"><@articleFormat>${articleInfoX.title}</@articleFormat></a>
          <br/>
        </div>
        <div style="float:left;">
          &nbsp;<#include "/includes/loadingcycle.ftl">
        </div>
        <div class="clear"></div>
      </div>

      <div id="twitterError" style="display:none;"></div>

      <div id="tweets"></div>
    </div>
  </div>
</div>

<script type="text/javascript">

  var twitter = null;

  window.onload = function() {
    var doi = $('meta[name=citation_doi]').attr("content");

    twitter = new $.fn.twitter();
    twitter.displayTwitterCites(doi);
  };

</script>