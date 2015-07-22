<!--
 ~ $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSONE/webapp/static/section_editors.ftl $
 ~ $Id: section_editors.ftl 15116 2013-06-14 05:35:45Z mbaehr $
 ~
 ~ Copyright (c) 2006-2010 by Public Library of Science
 ~ http://plos.org
 ~ http://ambraproject.org
 ~
 ~ Licensed under the Apache License, Version 2.0 (the "License");
 ~ you may not use this file except in compliance with the License.
 ~ You may obtain a copy of the License at
 ~
 ~     http://www.apache.org/licenses/LICENSE-2.0
 ~
 ~ Unless required by applicable law or agreed to in writing, software
 ~ distributed under the License is distributed on an "AS IS" BASIS,
 ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 ~ See the License for the specific language governing permissions and
 ~ limitations under the License.
 --> 



<a name="top"></a><h1><em>PLOS ONE</em> Section Editors</h1>

<div style="float:left;">
  <span id="loading" style="float:left;"><#include "/includes/loadingcycle.ftl"></span>
</div>

<div id="all_editors" style="display:none; clear:both;">
</div>

<script language="javascript">

  window.onload = function() {
    //load up all the editors

    var edBoard = new $.fn.edBoard();

    edBoard.getEditors({
      query: "doc_type:section_editor",
      formatSectionEds: false,
      highlight: false
    });
  };

</script>

<!-- end : main contents -->


