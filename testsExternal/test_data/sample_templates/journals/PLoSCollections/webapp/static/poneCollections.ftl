<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCollections/webapp/static/poneCollections.ftl $
  $Id: poneCollections.ftl 14623 2013-05-07 00:07:16Z nmeechoonuk $

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



<h1 class="replaced" id="pone"><a href="http://www.plosone.org/"><span><em>PLOS ONE</em> Collections</span></a></h1>

<p>In order to highlight specific topics, from time to time <em>PLOS ONE</em> gathers together collections of articles.
  As with all of our content, all material within collections is published under a <a href="/static/license.action">Creative
    Commons Attribution License</a>; hence users can, with attribution, download, print, or reuse in any way either
  individual articles or entire collections.</p>

<#-- variables for urls to collection TOCs -->
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i03" id="plos3"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i04" id="plos4"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i05" id="plos5"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i01" id="pone1"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i02" id="pone2"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i03" id="pone3"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i04" id="pone4"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i05" id="pone5"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i06" id="pone6"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i07" id="pone7"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i08" id="pone8"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i09" id="pone9"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i10" id="pone10"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i11" id="pone11"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i06" id="plos6"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i07" id="plos7"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i09" id="plos9"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i14" id="pone14"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i12" id="pone12"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i13" id="pone13"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i10" id="plos10"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i11" id="plos11"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i15" id="pone15"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i12" id="plos12"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i15" id="pone15"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i16" id="pone16"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i13" id="plos13"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i17" id="pone17"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i18" id="pone18"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i19" id="pone19"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i20" id="pone20"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i14" id="plos14"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i16" id="plos16"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i17" id="plos17"/>
 <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i18" id="plos18"/>
 <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i21" id="pone21"/>
 <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i20" id="pmed20"/>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos10}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i10.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos10}">Open Access Collection</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos9}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i09.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos9}">World Health Report 2012: No Health Without Research</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos7}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i07.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos7}">Epigenetics 2010</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos6}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i06.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos6}">Diversity in the Nearshore: The NaGISA Collection</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone11}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i11.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone11}">The FMAP Collection</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone10}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i10.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone10}">The HMAP Collection</@s.a>
</div>

<div class="clearer">&nbsp;</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone6}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i06.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone6}">Biogeography of Deep-Water Chemosynthetic Ecosystems - The ChEss Collection</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos5}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i05.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos5}">The POST Collection</@s.a>
</div>


<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone9}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i09.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone9}">Marine Biodiversity and Biogeography - Regional Comparisons of Global Issues</@s.a>
</div>


<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone7}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i07.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone7}">The MarBOL Collection</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone8}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i08.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone8}">Biodiversity of Saba Bank</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone15}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i15.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone15}">Marine Life on Seamounts &ndash; The CenSeam Collection</@s.a>
</div>

<div class="clearer">&nbsp;</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos4}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i04.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos4}">RECOMB Regulatory Genomics and Systems Biology 2009</@s.a>
</div>


<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone5}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i05.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone5}">The DREAM systems biology challenges: a Dialogue for Reverse Engineering Assessment and
  Methods</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos3}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i03.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos3}">The TOPP Collection</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone1}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i01.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone1}">Stress-Induced Depression and Comorbidities: From Bench to Bedside</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone2}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i02.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone2}">The Paleontology Collection</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone3}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i03.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone3}">Prokaryotic Genome Collection</@s.a>
</div>

<div class="clearer">&nbsp;</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone4}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i04.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone4}">Structural Biology and Human Health: Medically Relevant Proteins from the SGC</@s.a>
</div>


<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone14}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i14.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone14}">Proceedings of the Third International Barcode of Life Conference, Mexico City</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone12}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i12.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone12}">RosettaCon 2010</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone13}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i13.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone13}">Animals, Research, and Alternatives: Measuring Progress 50 Years Later</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos11}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i11.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos11}">Voluntary Medical Male Circumcision for HIV Prevention: The Cost, Impact, and Challenges of
  Accelerated Scale-Up in Southern and Eastern Africa</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos12}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i12.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos12}">Genetically Modified Insect Collection</@s.a>
</div>

<div class="clearer">&nbsp;</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone16}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i16.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone16}">The Mice Drawer System Experiment and the Space Endurance Record-Breaking Mice</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos13}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i13.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos13}">The Human Microbiome Project Collection</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone17}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i17.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone17}">NeuroMapping and Therapeutics</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone18}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i18.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone18}">Synthetic Biology</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone19}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i19.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone19}">Altmetrics Collection </@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone20}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i20.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone20}">The World Register of Marine Species  </@s.a></div>

<div class="clearer">&nbsp;</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos14}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i14.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos14}">Text Mining</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${plos16}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i16.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos16}">Measuring Coverage in Maternal, Newborn, and Child Health</@s.a>
</div>

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

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pone21}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v02.i21.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pone21}">RosettaCon 2012  </@s.a></div>

<div class="thumbnail">
      <!-- collection image -->
    <@s.a href="${pmed20}"><img src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v07.i20.g001&representation=PNG_S" alt="collection image" /></@s.a>
    <!-- collection title -->
    <@s.a href="${pmed20}">Maternal Health Task Force (MHTF)-PLOS Collection on Maternal Health Year 2 (2012-13)</@s.a>
    </div>

</div>

<#-- end : content -->



