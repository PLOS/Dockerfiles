<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSGenetics/weba#$
  $Id: checklist.ftl 15116 2013-06-14 05:35:45Z mbaehr $
  
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
<#include "/static/journal_include.ftl">
<#include "/static/cj_shared_blocks.ftl">

<@s.url action="license" namespace="/static" includeParams="none" id="licenseURL"/>
<@s.url action="guidelines" namespace="/static" includeParams="none" id="guidelinesURL"/>
<@s.url action="policies" namespace="/static" includeParams="none" id="policiesURL"/>
<@s.url action="figureGuidelines" namespace="/static" includeParams="none" id="figureGuidelinesURL"/>

<!-- begin : main content -->


<h1>Submitting Your Manuscript to <em>${journal_name}</em></h1>

<p class="intro">Are you ready to submit your manuscript? Please refer to our checklists below and then use our <a href="${jms_link}" title="Submit your manuscript">manuscript submission system</a>.<br />
<br />
When you submit your article to <em>${journal_name}</em> you will be asked to provide information in addition to the manuscript and related files. Please review the <a href="${guidelinesURL}">Author Guidelines</a>, <a href="${policiesURL}">Editorial and Publishing Policies</a>, and <a href="${figureGuidelinesURL}">Figure and Table Guidelines</a>; and then refer to this checklist to ensure that you have gathered all the relevant information, and that the manuscript is formatted appropriately. </a></p>

<a id="new" name="new"></a>
<h2>Information needed prior to submission</h2>

<ul>
        <li>Have you read the <a href="${licenseURL}">license agreement</a> and are you able to sign it on behalf of all of the authors?</li>
        <li>Have you discussed the publication fees with your co-authors? Publication fees are ${publication_fee} per manuscript and will be billed upon acceptance (read more about <a href="http://www.plos.org/publish/pricing-policy/publication-fees/">publication fees</a>). Editors and reviewers have no access to payment information, and hence inability to pay will not influence the decision to publish a paper.</li>
  <li>Have you prepared a statement indicating who funded the study, and the role of the funding agency in conducting the study and in preparing the manuscript? You will be asked to enter this into the relevant section of the submission form.</li> 
        <li>Are all authors aware of and approve the submission of the manuscript, its content, <a href="${guidelinesURL}#authorstatus">authorship</a>, and order of authorship?</li>
        <li>Do all authors agree to abide by established <a href="${policiesURL}#reporting">study guidelines</a> (MIAME, CONSORT, STROBE, etc.)?</li>
  <li>If your article includes human or animal research, have you read and followed these <a href="${policiesURL}#human" title="Guidelines for human and animal research">guidelines</a>, which contain further information on the <a href="http://www.wma.net/en/30publications/10policies/b3/index.html" title="Declaration of Helsinki">Declaration of Helsinki</a>  and "<a href="http://www.mrc.ac.uk/Utilities/Documentrecord/index.htm?d=MRC003440">The use of non-human primates in research</a>"? For research involving vertebrates please note, as part of the ethics statement, the guidelines followed and the committee that approved of the methods employed.</li>
  <li>Have you confirmed that anyone named in the acknowledgments section agrees to being so named?</li>
        <li>Have you prepared a <a href="${guidelinesURL}#coverletter">cover letter</a> explaining why you consider this manuscript suitable for publication?</li>
        <li>Are related manuscripts by any of the authors submitted or in press elsewhere? If so, are you prepared to provide a copy of each to accompany your submission?</li>
        <li>Have you identified at least four potential reviewers whose e-mail addresses you can provide? Have you considered colleagues who may have a conflict of interest?</li>
        <li>Do you have the following information for all authors: </li>
                <ul>
                <li>First Name, Middle Names/Initials, Last Name</li>
                <li>Work Affiliations</li>
                <li>E-mail Address</li>
                <li>Any Competing Interests</li>
                <li>Funding Information</li>
                <li>Author Contributions</li>
        </ul>
</ul>

<h2>Requirements for manuscripts and supporting files</h2>

<ul>
        <li>Article file in DOC or RTF format, prepared per the <a href="${guidelinesURL}#textfiles">Author Guidelines</a>. If you prepared your article using LaTeX, you should upload the file in PDF format for use during the editorial/review process.  If the article is accepted for publication, your .tex files will be required as a compressed file (e.g. .tar, .rar). Please consult our <a href="latex${guidelinesURL}" title="Go to LaTeX guidelines">LaTeX Guidelines</a> for a list of what will be required.  </li>


         <li><a href="${guidelinesURL}#title">Title</a> (no more than 150 characters) and Short Title (no more than 50 characters)</li>
        
               <li><a href="${guidelinesURL}#abstract">Abstract</a> of no more than 300 words</li>
<li><a href="${guidelinesURL}#authorsummary">Author Summary</a> (no more than 200 words)</li>
        <li>Deposition of all appropriate <a href="${guidelinesURL}#accessionnumbers">datasets, images, and information</a> in the relevant repositories or submission of undeposited data as supporting information files</li>
        <li><a href="${guidelinesURL}#accessionnumbers">Accession numbers</a> for genes, proteins, mutants, diseases, etc. in parentheses after first use throughout the manuscript file </li>
        <li>Standard <a href="${guidelinesURL}#nomenclature">nomenclature</a> used throughout the manuscript file
        <li>Non-standard <a href="${guidelinesURL}#abbreviations">abbreviations</a> defined upon use in the text
        <li>All figures and tables called out in the manuscript in proper order</li>
        <li>Use of PLOS style for <a href="${guidelinesURL}#references">references</a></li>
        <li><a href="${guidelinesURL}#tables">Tables</a> at the end of the manuscript files in DOC or RTF format</li> 
        <li>Original, high resolution figure files (> 300 dpi) uploaded as separate files in EPS or TIFF format. If any of your figures are under copyright, please notify the journal office.  (Please read the <a href="figure${guidelinesURL}" title="View the Figures Submissions Guidelines">Guidelines for Figure Preparation</a> before submitting figures.) </li>
        <li>Any <a href="${guidelinesURL}#supportinginfo">Supporting Information</a> files should fall into one of the following categories: Dataset, Figure, Table, Text, Protocol, Audio, or Video. The numbered title and caption for each supporting information file should be entered into the appropriate fields in the online submission system. </li>
                <li>We recommend that you upload all your files in one step by creating a single .zip file, which the submission system will automatically unpack.</li>
</ul>

<p>Please use our <a href="${jms_link}" title="Submit your manuscript online">manuscript submission system</a> and contact ${email} if you have any questions.</p>

<!-- end : main contents -->
