<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSCompBiol/weba#$
  $Id: information.ftl 15116 2013-06-14 05:35:45Z mbaehr $
  
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

<#-- begin : main content -->

<h1>About <em>${journal_name}</em></h1>

<p><em>PLOS Computational Biology</em> (eISSN 1553-7358, ISSN 1553-734X) is an open-access, peer-reviewed journal
  published monthly by <a href="http://www.plos.org">PLOS</a> as an official journal of the <a
    href="http://www.iscb.org">International Society for Computational Biology</a> (ISCB). </p>

<p><em>PLOS Computational Biology</em> is run by an international <a href="edboard">Editorial Board</a>, headed
  by the Editor-in-Chief, <a href="eic#rnussinov">Ruth Nussinov</a> (National Cancer Institute and Tel Aviv
  University, Frederick, MD, USA and Tel Aviv, Israel).</p>

<h2>Journal Scope</h2>

<p><em>PLOS Computational Biology</em> features works of exceptional significance that further our understanding of
  living systems at all scales—from molecules and cells, to patient populations and ecosystems—through the application
  of computational methods. Readers include life and computational scientists, who can take the important findings
  presented here to the next level of discovery.</p>

<p>Research articles must be declared as belonging to one of the following categories: General, Methods or Software.
  Software articles form a specific sub-category. More information about Software articles can be found in <a
    href="guidelines#software">Section 8 of the Author Guidelines</a>.</p>

<p>Research articles should model aspects of biological systems, demonstrate both methodological and scientific novelty,
  and provide profound new biological insights. Research articles with limited novelty may be more appropriate for <a
    href="http://www.plosone.org/" title="PLOS ONE"><em>PLOS ONE</em></a>.</p>

<p>Generally, reliability and significance of biological discovery through computation should be validated and enriched
  by experimental studies. Inclusion of experimental validation is not required for publication, but should be
  referenced where possible. Inclusion of experimental validation of a modest biological discovery through computation
  does not render a manuscript suitable for <em>PLOS Computational Biology</em>.</p>

<p>Research articles specifically designated as Methods papers should describe outstanding methods of exceptional
  importance that <b>have been shown, or have the promise to provide new biological insights</b>. The method must
  already be widely adopted, or have the promise of wide adoption by a broad community of users. Enhancements to
  existing published methods will only be considered if those enhancements bring exceptional new capabilities.</p>

<p>For all submissions, authors must clearly provide detail, data, and software to ensure readers' ability to reproduce
  the models, methods, and results.</p>

<p>Methods articles and Software articles require <a href="guidelines#presubs" title="Presubmission Inquiry">presubmission
  inquiries</a>. Presubmission inquiries for general research articles are encouraged, but not essential.</p>


<h2>Journal Contents</h2>

<p>Outstanding primary <strong>research articles</strong> on all aspects of computational biology applied to different
  and integrated biological scales, from molecules and cells to patient populations and ecosystems.</p>

<p>Invited and submitted <strong>reviews</strong> and <strong>perspectives</strong> on topics of broad interest to the
  readership. Historical reviews and high-quality <strong>tutorials</strong> (including multimedia presentations)
  teaching important concepts in the field of computational biology. <strong>Software articles</strong> describing
  outstanding open source software of exceptional importance that has been shown to provide new biological insights.</p>

<p><strong>Announcements</strong> of activities of the International Society for Computational Biology (ISCB) and other
  information of interest to scientists in this and related fields.</p>

<p>Please refer to our <a href="guidelines">Author Guidelines</a> when you are preparing your manuscript for
  submission. If you are unsure whether your paper is suitable for <em>PLOS Computational Biology</em>, you can send a
  <a href="guidelines#presubs" title="Presubmission Inquiry">Presubmission Inquiry</a>.</p>

<h2>Open Access</h2>

${open_access}

<h2>Publications Charges</h2>

${publication_charges}


<a name="if" id="if"></a>
<h2>Measuring Impact</h2>
<p>At PLOS, we believe that articles in all journals should be assessed on their own merits rather than on the basis of
  the journal in which they were published.  PLOS journals have therefore initiated a program to provide a growing set
  of measures and indicators of impact at the article level that will include citation metrics, usage statistics,
  blogosphere coverage, social bookmarks, community rating and expert assessment. The long-term vision is to bring the
  views and activities of entire communities to bear, using the wealth of opportunities offered online, to provide new,
  meaningful and efficient mechanisms for research assessment. For more information on article-level metrics see the <a
    href="http://blogs.plos.org/plos/2009/07/plos-journals-measuring-impact-where-it-matters/" title="Read PLOS blog">PLOS
    blog</a>.</p>

<h2>About the International Society for Computational Biology</h2>

<p>The International Society for Computational Biology is a scholarly society dedicated to advancing the scientific
  understanding of living systems through computation. Founded in 1997, the ISCB communicates the significance of our
  science to the larger scientific community, governments, and the public at large. The ISCB serves a global membership
  by impacting government and scientific policies, providing high quality publications and meetings, and through
  distribution of valuable information about training, education, employment and relevant news from related fields. For
  more information about the ISCB, visit <a href="http://www.iscb.org" title="www.iscb.org">www.iscb.org</a>.</p>

<h2>About PLOS</h2>

${about_plos}

<#-- end : main contents -->
