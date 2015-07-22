<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSDefault/webap#$
  $Id: article_comments.ftl 15116 2013-06-14 05:35:45Z mbaehr $

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
<#import "article_variables.ftl" as article>

<div id="pagebdy-wrap">
  <div id="pagebdy">

    <div id="article-block" class="cf">
      <#include "../includes/article_header.ftl">
      <#include "article_comments_content.ftl">
      <#include "article_sidebar.ftl">
    </div><!-- /article-block -->

  </div><!-- /pagebdy -->
</div><!-- /pagebdy-wrap -->
