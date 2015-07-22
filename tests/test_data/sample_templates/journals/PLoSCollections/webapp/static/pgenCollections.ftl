<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCollections/webapp/static/pgenCollections.ftl $
  $Id: pgenCollections.ftl 12896 2012-11-30 01:48:34Z josowski $

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


  <h3 class="replaced" id="pgen"><a href="http://www.plosgenetics.org/"><span><em>PLOS Genetics</em> Collections</span></a></h3>
 
  <p>In order to highlight specific topics, from time to time <em>PLOS Genetics</em> gathers together collections of articles. As with all of our content, all material within collections is published under a <a href="/static/license">Creative Commons Attribution License</a>; hence users can, with attribution, download, print, or reuse in any way either individual articles or entire collections.</p>

  <!-- variables for urls to collection TOCs -->
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i01" id="plos1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v04.i01" id="pgen1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v04.i02" id="pgen2"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v04.i03" id="pgen3"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v04.i04" id="pgen4"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i07" id="plos7"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i12" id="plos12"/> 
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i13" id="plos13"/> 

  
  <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos12}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i12.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos12}">Genetically Modified Insect Collection</@s.a>
    </div>
    
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos7}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i07.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos7}">Epigenetics 2010</@s.a>
    </div>
  
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pgen1}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v04.i01.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pgen1}">A Collection of Interviews by Jane Gitschier</@s.a>
    </div>
    
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pgen2}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v04.i02.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pgen2}">Aging: Bench to Bedside</@s.a>
    </div>
    
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pgen3}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v04.i03.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pgen3}">2009 Maize Genome Collection</@s.a>
    </div>
    
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pgen4}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v04.i04.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pgen4}">The Genome Network Project/FANTOM3 Collection</@s.a>
    </div>
    
<div class="clearer">&nbsp;</div>

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos1}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i01.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>
    </div>
    
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos13}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i13.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos13}">The Human Microbiome Project Collection</@s.a>
    </div>

    <div class="clearer">&nbsp;</div>

<!-- end : content -->



