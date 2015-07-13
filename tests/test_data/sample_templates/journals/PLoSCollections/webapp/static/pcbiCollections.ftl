<#--
  $HeadURL: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCollections/webapp/static/pcbiCollections.ftl $
  $Id: pcbiCollections.ftl 14392 2013-04-17 20:17:49Z nmeechoonuk $

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

<#-- begin : content -->


<h3 class="replaced" id="pcbi"><a href="http://www.ploscompbiol.org/"><span><em>PLOS Computational Biology</em> Collections</span></a>
</h3>

<p>In order to highlight specific topics, from time to time <em>PLOS Computational Biology</em> gathers together
  collections of articles. As with all of our content, all material within collections is published under a <a
    href="/static/license">Creative Commons Attribution License</a>; hence users can, with attribution, download, print,
  or reuse in any way either individual articles or entire collections.</p>

<#-- variables for urls to collection TOCs -->
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i07" id="pcbi7"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i06" id="pcbi6"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i01" id="plos1"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i04" id="plos4"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i01" id="pcbi1"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i02" id="pcbi2"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i03" id="pcbi3"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i04" id="pcbi4"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i05" id="pcbi5"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i07" id="plos7"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i08" id="pcbi8"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i09" id="pcbi9"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i10" id="plos10"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i13" id="plos13"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i10" id="pcbi10"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i11" id="pcbi11"/>
<@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i14" id="plos14"/>
 <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i18" id="plos18"/>

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
<@s.a href="${plos1}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i01.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>
</div>

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
<@s.a href="${plos7}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i07.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos7}">Epigenetics 2010</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi1}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i01.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi1}">Ten Simple Rules</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi2}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i02.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi2}">Education</@s.a>
  <div class="clearer">&nbsp;</div>
</div>


<div class="clearer">&nbsp;</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi3}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i03.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi3}">Developing Computational Biology</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi4}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i04.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi4}">Core Facilities</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi5}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i05.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi5}">Biocurators</@s.a>
</div>

<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi6}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i06.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi6}">Conference Postcards</@s.a>
</div>


<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi7}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i07.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi7}">The Roots of Bioinformatics</@s.a>
</div>


<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi8}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i08.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi8}">Editors' Outlook</@s.a>
</div>

<div class="clearer">&nbsp;</div>


<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi9}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i09.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi9}">Bioinformatics: Starting Early</@s.a>
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
<@s.a href="${pcbi10}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i10.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi10}">Software</@s.a>
</div>


<div class="thumbnail">
  <!-- collection image -->
<@s.a href="${pcbi11}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v03.i11.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${pcbi11}">Translational Bioinformatics</@s.a>
</div>

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
<@s.a href="${plos18}"><img
  src="/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fimage.pcol.v01.i18.g001&representation=PNG_S"
  alt="collection image"/></@s.a>
  <!-- collection title -->
<@s.a href="${plos18}">Reporting Guidelines Collection</@s.a>

</div>

<div class="clearer">&nbsp;</div>

<#-- end : content -->



