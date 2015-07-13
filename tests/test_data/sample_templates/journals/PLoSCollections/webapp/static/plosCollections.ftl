<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCollections/webapp/static/plosCollections.ftl $
  $Id: plosCollections.ftl 12896 2012-11-30 01:48:34Z josowski $

  Copyright (c) 2007-2012 by Public Library of Science
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

<!-- begin : content -->



  <h1><span>PLOS Cross-Journal Collections</span></h1>

  <p>In order to highlight specific topics, from time to time PLOS gathers together collections of articles from multiple <a href="http://www.plos.org/journals/index.php">PLOS journals</a>. As with all of our content, all material within collections is published under a <a href="/static/license">Creative Commons Attribution License</a>; hence users can, with attribution, download, print, or reuse in any way either individual articles or entire collections.</p>

  <!-- variables for urls to collection TOCs -->
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i01" id="plos1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i02" id="plos2"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i03" id="plos3"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i04" id="plos4"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i05" id="plos5"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i06" id="plos6"/>

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos6}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i06.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos6}">Diversity in the Nearshore: The NaGISA Collection</@s.a>
    </div>

  <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos5}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i05.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos5}">The POST Collection</@s.a>
    </div>

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos4}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i04.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos4}">RECOMB Collection</@s.a>
  </div>
  <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos3}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i03.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos3}">The TOPP Collection</@s.a>
  </div>
  <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos1}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i01.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>
  </div>
   <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos2}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i02.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos2}">Poverty Collection</@s.a>
  </div>
 
  <div class="clearer">&nbsp;</div>

<!-- end : content -->



