<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/branches/se-162/journals/PLoSDe#$
  $Id: article_crossref.ftl 15204 2013-06-24 23:39:48Z jperalta $

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
<@s.url action="help" namespace="/static" includeParams="none" id="helpURL"/>

<div id="pagebdy-wrap">
  <div id="pagebdy">
    <div id="static-wrap">

      <a id="top" name="top" toc="top" title="Top"></a>

      <h1>Citations to this article as recorded by CrossRef <a href="${helpURL}#crossrefCitation" class="ir"
        id="info" title="More information"><span>info</span></a>
      </h1>

      <div class="source" style="clear:left;">
        <@s.url id="articleTabURL" namespace="/article" action="fetchArticle" includeParams="all" />
        <a href="${articleTabURL}" title="Back to original article" class="article icon"  style="float:left;"><@articleFormat>${articleInfoX.title}</@articleFormat></a>
        <span id="loading" style="float:left;">&nbsp;<#include "/includes/loadingcycle.ftl"></span>
      </div>
      <div class="clear"></div>
      <div id="almError" style="display:none;"></div>
      <div id="crossRefLinks" style="display:none;"></div>

    </div><!-- static wrap -->
  </div><!-- pagebdy -->
</div><!-- pagebdy-wrap -->

<script type="text/javascript">
  window.onload = function () {
    var almService = new $.fn.alm();
    var doi = $('meta[name=citation_doi]').attr("content");
    almService.setCrossRefText(doi, "crossRefLinks", "almError", "loading");
  };
</script>
