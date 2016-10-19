<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCollections/webapp/static/ppatCollections.ftl $
  $Id: ppatCollections.ftl 14490 2013-04-25 19:33:02Z vknox $

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


  <h3 class="replaced" id="ppat"><a href="http://www.plospathogens.org/"><span><em>PLOS Pathogens</em> Collections</span></a></h3>
 
  <p>In order to highlight specific topics, from time to time <em>PLOS Pathogens</em> gathers together collections of articles. As with all of our content, all material within collections is published under a <a href="/static/license">Creative Commons Attribution License</a>; hence users can, with attribution, download, print, or reuse in any way either individual articles or entire collections.</p>

  <!-- variables for urls to collection TOCs -->
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i01" id="plos1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i08" id="plos2"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v05.i01" id="ppat1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i07" id="plos7"/> 
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i10" id="plos10"/> 
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i12" id="plos12"/> 
   <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i15" id="plos15"/>

   <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos15}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i15.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos15}">Malaria: targets and drugs for all stages</@s.a>
    </div>
   
  <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos12}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i12.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos12}">Genetically Modified Insect Collection</@s.a>
    </div>
    
  <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos10}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i10.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos10}">Open Access Collection</@s.a>
    </div>

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos2}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i08.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos2}"><em>PLOS Pathogens</em> and <em>PLOS Neglected Tropical Diseases</em> Twinning Collection</@s.a>
    </div>


      <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos7}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i07.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos7}">Epigenetics 2010</@s.a>
    </div>
  
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${ppat1}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v05.i01.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${ppat1}"><em>PLOS Pathogens'</em> Pearls</@s.a>
    </div>
<div class="clearer">&nbsp;</div>
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos1}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i01.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>
    </div>

    

<!-- end : content -->



