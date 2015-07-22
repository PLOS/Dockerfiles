<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCollections/webapp/static/pbioCollections.ftl $
  $Id: pbioCollections.ftl 14391 2013-04-17 20:17:42Z nmeechoonuk $

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


  <h3 class="replaced" id="pbio"><a href="http://www.plosbiology.org/"><span><em>PLOS Biology</em> Collections</span></a></h3>
 
  <p>In order to highlight specific topics, from time to time <em>PLOS Biology</em> gathers together collections of articles. As with all of our content, all material within collections is published under a <a href="/static/license">Creative Commons Attribution License</a>; hence users can, with attribution, download, print, or reuse in any way either individual articles or entire collections.</p>

  <!-- variables for urls to collection TOCs -->
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i01" id="plos1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i02" id="plos2"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i03" id="plos3"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i05" id="plos5"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i06" id="plos6"/>  
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v06.i01" id="pbio1"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v06.i02" id="pbio2"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i04" id="pone4"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i07" id="plos7"/> 
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i10" id="plos10"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i06" id="pone6"/> 
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i14" id="plos14"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i17" id="plos17"/>
  <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i18" id="plos18"/>

  <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos10}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i10.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos10}">Open Access Collection</@s.a>
    </div>

      <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${plos7}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i07.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${plos7}">Epigenetics 2010</@s.a>
    </div>
    
     <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pone6}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i06.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pone6}">Biogeography of Deep-Water Chemosynthetic Ecosystems - The ChEss Collection</@s.a>
    </div>
  
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
    <@s.a href="${pone4}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i04.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pone4}">Structural Biology and Human Health: Medically Relevant Proteins from the SGC</@s.a>
    </div>

    <div class="clearer">&nbsp;</div>


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
    
 
    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pbio1}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v06.i01.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pbio1}">Challenges Collection</@s.a>
    </div>

    <div class="thumbnail">
    <!-- collection image -->
    <@s.a href="${pbio2}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v06.i02.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pbio2}">Ocean Metagenomics Collection</@s.a>
    </div>
    
    <div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos14}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i14.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos14}">Text Mining</@s.a>
</div>

    <div class="clearer">&nbsp;</div>
    
      <div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos17}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i17.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos17}">Ecological Impacts of Climate Change</@s.a>
</div>

 <div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos18}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i18.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos18}">Reporting Guidelines Collection</@s.a>
</div>

<!-- end : content -->



