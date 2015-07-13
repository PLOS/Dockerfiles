<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSNTD/webapp/st#$
  $Id: about.ftl 15116 2013-06-14 05:35:45Z mbaehr $
  
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


<h1>About <em>PLOS Neglected Tropical Diseases</em></h1>

<p class="intro">Find information about <em>PLOS Neglected Tropical Diseases</em> on the following pages:</p>

  <@s.url action="information" namespace="/static" includeParams="none" id="infoURL"/>
  <@s.url action="scope" namespace="/static" includeParams="none" id="scopeURL"/>
  <@s.url action="edboard" namespace="/static" includeParams="none" id="edboardURL"/>
  <@s.url action="eic" namespace="/static" includeParams="none" id="eicURL"/>
  <@s.url action="license" namespace="/static" includeParams="none" id="licenseURL"/>
  <@s.url action="contact" namespace="/static" includeParams="none" id="contactURL"/>
  
<ul>
  <li><@s.a href="${infoURL}" title="PLOS NTDs | Journal Information">Journal Information</@s.a> - General information about <em>PLOS Neglected Tropical Diseases</em></li>
  <li><@s.a href="${scopeURL}" title="PLOS NTDs | Journal Scope">Journal Scope</@s.a> - Description of content within the scope of <em>PLOS Neglected Tropical Diseases</em></li>
  <li><@s.a href="${edboardURL}" title="PLOS NTDs | Editorial Board">Editorial Board</@s.a> - Editorial Board members of <em>PLOS Neglected Tropical Diseases</em></li>
  <li><@s.a href="${eicURL}" title="PLOS NTDs | Editor-in-Chief">A Message from the Editor-in-Chief</@s.a> - A message from Peter Hotez, Editor-in-Chief</li>
  <li><@s.a href="${licenseURL}" title="PLOS NTDs | Open-Access License">Open-Access License</@s.a> - Read more about the open-access license terms</li>
  <li><@s.a href="${contactURL}" title="PLOS NTDs | Contact Us">Contact Us</@s.a> - How to reach <em>PLOS Neglected Tropical Diseases</em></li>
</ul>

<!-- end : main contents -->