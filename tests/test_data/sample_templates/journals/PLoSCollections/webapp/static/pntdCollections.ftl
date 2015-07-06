<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCollections/webapp/static/pntdCollections.ftl $
  $Id: pntdCollections.ftl 14586 2013-05-02 21:45:33Z vknox $

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


  <h3 class="replaced" id="pntd"><a href="http://www.plosntds.org/"><span><em>PLOS Neglected Tropical Diseases</em> Collections</span></a></h3>
 
  <p>In order to highlight specific topics, from time to time <em>PLOS Neglected Tropical Diseases</em> gathers together collections of articles. As with all of our content, all material within collections is published under a <a href="/static/license">Creative Commons Attribution License</a>; hence users can, with attribution, download, print, or reuse in any way either individual articles or entire collections.</p>

  <!-- variables for urls to collection TOCs -->
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i01" id="plos1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i02" id="plos2"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i08" id="plos3"/>

  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i01" id="pntd1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i02" id="pntd2"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i03" id="pntd3"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i04" id="pntd4"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i05" id="pntd5"/>

  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i09" id="plos9"/> 
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i12" id="plos12"/> 
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i06" id="pntd6"/> 
   <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i18" id="plos18"/>
  
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pntd5}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v08.i05.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pntd5}">Top Ten Research Article Collection</@s.a>
    </div>

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pntd4}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v08.i04.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pntd4}">The Geopolitics of Neglected Tropical Diseases</@s.a>
    </div>

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pntd3}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v08.i03.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pntd3}">A Research Agenda for the Control and Elimination of Human Helminthiases</@s.a>
    </div>

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos12}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i12.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos12}">Genetically Modified Insect Collection</@s.a>
    </div>
  
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pntd2}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v08.i02.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pntd2}">Sleeping Sickness</@s.a>
    </div>
    
    <div class="thumbnail">
     <!-- collection image -->
    <@s.a href="${plos9}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i09.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos9}">World Health Report 2012: No Health Without Research</@s.a>
    </div>
  
    <div class="clearer">&nbsp;</div>
    

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos3}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i08.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos3}"><em>PLOS Pathogens</em> and <em>PLOS Neglected Tropical Diseases</em> Twinning Collection</@s.a>
    </div>


    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pntd1}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v08.i01.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pntd1}">Rabies Collection</@s.a>
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

   
      <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pntd6}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v08.i06.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pntd6}">Strongyloides Collection</@s.a>
    </div>
    
     <div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos18}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i18.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos18}">Reporting Guidelines Collection</@s.a>
</div>

 <div class="clearer">&nbsp;</div>

<!-- end : content -->



