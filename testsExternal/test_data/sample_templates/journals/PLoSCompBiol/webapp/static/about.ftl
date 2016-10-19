<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCompBiol/weba#$
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



<h1>About <em>PLOS Computational Biology</em></h1>

<p class="intro">Find information about <em>PLOS Computational Biology</em> on the following pages:</p>

  <@s.url action="information" namespace="/static" includeParams="none" id="infoURL"/>
  <@s.url action="scope" namespace="/static" includeParams="none" id="scopeURL"/>
  <@s.url action="edboard" namespace="/static" includeParams="none" id="edboardURL"/>
  <@s.url action="eic" namespace="/static" includeParams="none" id="eicURL"/>
  <@s.url action="license" namespace="/static" includeParams="none" id="licenseURL"/>
  <@s.url action="contact" namespace="/static" includeParams="none" id="contactURL"/>
  
<ul>
  <li><@s.a href="${infoURL}" title="PLOS Computational Biology | Journal Information">Journal Information</@s.a> - General information about <em>PLOS Computational Biology</em></li>
  <li><@s.a href="${edboardURL}" title="PLOS Computational Biology | Editorial Board">Editorial Board</@s.a> - Editorial Board members of <em>PLOS Computational Biology</em></li>
  <li><@s.a href="${eicURL}" title="PLOS Computational Biology | Editor-in-Chief">Editor-in-Chief</@s.a> - About the Editor-in-Chief of <em>PLOS Computational Biology</em></li>
  <li><@s.a href="${licenseURL}" title="PLOS Computational Biology | Open-Access License">Open-Access License</@s.a> - Read more about the open-access license terms</li>

  <li><@s.a href="${contactURL}" title="PLOS Computational Biology | Contact Us">Contact Us</@s.a> - How to reach <em>PLOS Computational Biology</em></li>
</ul>


<!-- end : main contents -->