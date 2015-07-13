<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSBiology/webap#$
  $Id: about.ftl 12863 2012-11-28 23:03:21Z msingh $
  
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
<!-- begin : main content -->

<h1>About <em>PLOS Biology</em></h1>

<p class="intro">Find information about <em>PLOS Biology</em> on the following pages:</p>

<@s.url action="information" namespace="/static" includeParams="none" id="infoURL"/>
<@s.url action="edboard" namespace="/static" includeParams="none" id="edboardURL"/>
<@s.url action="license" namespace="/static" includeParams="none" id="licenseURL"/>
<@s.url action="eic" namespace="/static" includeParams="none" id="eicURL"/>
<@s.url action="contact" namespace="/static" includeParams="none" id="contactURL"/>
  
<ul>
  <li><@s.a href="${infoURL}" title="PLOS Biology | Journal Information">Journal Information</@s.a> - General information about <em>PLOS Biology</em></li>
  <li><a href="http://www.plos.org/about/people/biology.html">Editors</a>- Editorial Staff members of PLOS <em>Biology</em></li>
  <li><@s.a href="${edboardURL}" title="PLOS Biology | Editorial Board">Editorial Board</@s.a> - Editorial Board members of <em>PLOS Biology</em></li>
  <li><@s.a href="${eicURL}" title="PLOS Biology | Academic Editor-in-Chief">Academic Editor-in-Chief</@s.a> - Brief biography of the Academic Editor-in-Chief</li>
  <li><@s.a href="${licenseURL}" title="PLOS Biology | Open-Access License">Open-Access License</@s.a> - Read more about the open-access license terms</li>
  <li><a href="http://www.plos.org/journals/embargopolicy.html">Media Inquiries</a> - Press contact information and our embargo policy</li>
  <li><a href="http://www.plos.org/journals/print.html">PLOS in Print</a> - How to order high-quality reprints of articles</li>
  <li><@s.a href="${contactURL}" title="PLOS Biology | Contact Us">Contact Us</@s.a> - How to reach <em>PLOS Biology</em> and PLOS</li>
</ul>

<!-- end : main contents -->
