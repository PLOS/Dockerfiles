<#include "journal_include.ftl">
<#include "/static/cj_shared_blocks.ftl">

<!-- begin : main content -->
<div id="content" class="static">

<h1><em>${journal_name}</em> Guidelines for Authors</h1>

<h2>Contents:</h2>
<ol>
  <li><a href="#about">About <em>${journal_name}</em></a></li>
  <li><a href="#openaccess">Open Access</a></li>
  <li><a href="#publicationcharges">Publication Charges</a></li>
  <li><a href="#criteria">Criteria for Publication</a></li>
  <li><a href="#editorial">Overview of the Editorial Process</a></li>
  <li><a href="#presubs">Presubmission Inquiries</a></li>
  <li><a href="#preparation">Preparation of Research Articles</a>
    <ol>
      <li><a href="#organization">Organization of the Manuscript</a></li>
      <li><a href="#nomenclature">Nomenclature</a></li>
      <li><a href="#accessionnumbers">Accession Numbers</a></li>
      <li><a href="#abbreviations">Abbreviations</a></li>
    </ol>
  </li>
  <li><a href="#software">Software Articles</a></li>
  <li><a href="#submission">Materials Required for Manuscript Submission</a>
    <ol>
      <li><a href="#coverletter">Cover Letter</a></li>
      <li><a href="#authorstatus">Author Status</a></li>
      <li><a href="#financialdisclosure">Financial Disclosure</a></li>
      <li><a href="#competing">Competing Interests</a></li>
      <li><a href="#electronicformats">Electronic Formats</a>
        <ol>
          <li><a href="#textfiles">Manuscript and Tables File</a></li>
          <li><a href="#latex">LaTeX files</a></li>
          <li><a href="#tables">Tables</a></li>
          <li><a href="#strikingimages">Striking Images</a></li>
          <li><a href="#figurefiles">Figure Files</a></li>
          <li><a href="#supportinginfo">Multimedia Files and Supporting Information</a></li>
        </ol>
      </li>
      <li><a href="#readytosubmit">Ready to Submit Your Manuscript?</a></li>
    </ol>
  </li>
  <li><a href="#other">Other Types of Articles</a></li>
  <li><a href="#production">Overview of the Production Process</a></li>
  <li><a href="#embargoes">Blogs, Wikis, Embargoes, and the Media</a></li>
</ol>

<a name="about" id="about"></a>

<h2>1. About <em>PLOS Computational Biology</em></h2>

<p><em>PLOS Computational Biology</em> features works of exceptional significance that further our understanding of
  living systems at all scales—from molecules and cells, to patient populations and ecosystems—through the application
  of computational methods. Readers include life and computational scientists, who can take the important findings
  presented here to the next level of discovery.</p>

<p>Research articles must be declared as belonging to one of the following categories: General, Methods or Software.
  Software articles form a specific sub-category. More information about Software articles can be found in <a
    href="guidelines#software">Section 8</a>.</p>

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

<a name="openaccess"></a>

<h2>2. Open Access</h2>
${open_access}

<a name="publicationcharges"></a>

<h2>3. Publication Charges</h2>
${publication_charges}

<a name="criteria" id="criteria"></a>

<h2>4. Criteria for Publication</h2>

<p>To be considered for publication in <em>PLOS Computational Biology</em>, any given manuscript must satisfy the
  following criteria:</p>
<ul>
  <li>Originality</li>
  <li>Innovation</li>
  <li>High importance to researchers in the field</li>
  <li>Significant biological and/or methodological insight</li>
  <li>Rigorous methodology</li>
  <li>Substantial evidence for its conclusions</li>
</ul>

<a name="editorial"></a>

<h2>5. Overview of the Editorial Process</h2>

<p>Our aim is to provide all authors with an efficient, courteous, and constructive editorial process. To achieve its
  required level of quality, <em>${journal_name}</em> is highly selective in the manuscripts that it publishes;
  rejection rates are high. To ensure the fairest and most objective decision-making, the editorial process is run as a
  partnership between the <em>PLOS Computational Biology</em> <a href="eic">Editor-in-Chief</a> (EIC), a team of Deputy
  Editors, and a group of academic experts who serve as <a href="edboard">Associate Editors</a> (AEs). These individuals
  are leaders in their fields and represent the full breadth of expertise in computational biology.</p>

<p>Submitted manuscripts are first reviewed by the EIC or one of the Deputy Editors, who may decide to reject the paper
  or send it on to an AE for further review. The AE is most often a member of the <em>${journal_name}</em> Editorial
  Board, but occasionally a guest of the Board is invited to serve in this capacity. The AE evaluates the paper and
  decides whether it describes a sufficient body of work to support a major advance in a particular field. If so, the
  paper is sent out for external peer review, at which stage the technical and scientific merits of the work are
  carefully considered. Once the reviews have been received and considered by the editors, a decision letter to the
  corresponding author is drafted and sent.</p>


<p>The decision will be within one of the following categories:
<ul>
  <li>Reject</li>
  <li>Major revision</li>
  <li>Minor revision</li>
  <li>Accept</li>
</ul>
</p>

<h3>Appeals of Decisions</h3>

<p><em>PLOS Computational Biology</em> encourages input from all community members regarding editorial and publishing
  policy. However, appeals of manuscript decisions should be a) limited to the specific manuscript in question, b) made
  only by the corresponding author, and c) sent by e-mail to <strong>ploscompbiol [at] plos.org</strong>. Telephone or
  other informal appeals will not be considered. Editors involved in considering an appeal will include the Associate
  Editor, Editor-in-Chief and Deputy Editor; additional editorial board members may also be consulted. The editors will
  try to handle an appeal expeditiously; however, each appeal is unique and the journal cannot guarantee the turnaround
  time or the outcome. Appeals of decisions made before review will only be considered in exceptional circumstances.</p>

<a name="presubs"></a>

<h2>6. Presubmission Inquiries</h2>

${cj_presubmission}

<a name="preparation"></a>

<h2>7. Preparation of Research Articles</h2>

<p><em>${journal_name}</em> publishes original research that clearly demonstrates novelty, importance to a particular
  field, biological significance, and conclusions that are justified by the study.</p>

<p>Our aim is to make the editorial process rigorous and consistent, and to offer the best possible support to our
  authors throughout this process. Authors are encouraged to decide how best to present their ideas, results, and
  conclusions. The writing style should be concise and accessible. Editors may make suggestions for how to achieve this,
  as well as suggestions for cuts or additions that could be made to the article to strengthen the argument.</p>

<p>Although we encourage submissions from around the globe, we require that manuscripts be submitted in English. As a
  step towards overcoming language barriers, we encourage authors fluent in other languages to provide copies of their
  full articles or abstracts in other languages. Translations should be submitted as supporting information and listed,
  together with other supporting information files, at the end of the article text.</p>


<a name="organization"></a>

<h3>Organization of the Manuscript</h3>

<p>Articles published in <em>${journal_name}</em> are organized into the following sections: <a href="#title">Title</a>,
  <a href="#authors">Authors</a>, <a href="#affiliations">Affiliations</a>, <a href="#abstract">Abstract</a>, <a
    href="#authorsummary">Author Summary</a>, <a href="#introduction">Introduction</a>, <a href="#results">Results</a>,
  <a href="#discussion">Discussion</a>, <a href="#materials_methods">Materials and Methods</a>, <a
    href="#acknowledgments">Acknowledgments</a>, <a href="#references">References</a>, <a href="#figurelegends">Figure
    Legends</a>, and <a href="#tables">Tables</a>. Uniformity in format facilitates the experience of readers and users
  of the journal. To provide flexibility, however, authors are also able to include the Materials and Methods section
  before the Results section or before the Discussion section. Please also note that the Results and Discussion can be
  combined into one Results/Discussion section. Although we have no firm length restrictions for the entire manuscript,
  we urge authors to present and discuss their findings concisely.</p>


<a name="title"></a>
<h4>Title (150 characters or less)</h4>

<p>The title should be specific to the project, yet concise. It should be comprehensible to readers outside your field.
  Avoid specialist abbreviations, if possible. Titles should be presented in title case, meaning that all words except
  for prepositions, articles, and conjunctions should be capitalized. Please also provide a brief Short Title (or &quot;running
  head&quot;) of no more than 50 characters.</p>

<p>Example title: <br/>
  Detection of Specific Sequences among DNA Fragments Separated by Gel Electrophoresis. </p>


<a name="authors"></a><a name="affiliations"></a>
<h4>Authors and Affiliations</h4>

${authors_and_affiliations}

<a name="abstract"></a>
<h4>Abstract</h4>

<p>The abstract of the paper should be succinct; it must not exceed 300 words. Authors should mention the techniques
  used without going into methodological detail and should summarize the most important results. While the abstract is
  conceptually divided into three sections (Background, Methodology/Principal Findings, and Conclusions/Significance),
  please do not apply these distinct headings to the abstract within the article file. Please do not include any
  citations and avoid specialist abbreviations.</p>

<a name="authorsummary"></a>
<h4>Author Summary</h4>

<p>We ask that all authors of research articles include a 150&ndash;200 word non-technical summary of the work as part
  of the manuscript to immediately follow the abstract. This text is subject to editorial change, should be written in
  the first-person voice, and should be distinct from the scientific abstract. Aim to highlight where your work fits
  within a broader context; present the significance or possible implications of your work simply and objectively; and
  avoid the use of acronyms and complex terminology wherever possible. The goal is to make your findings accessible to a
  wide audience that includes both scientists and non-scientists. Authors may benefit from consulting with a science
  writer or press officer to ensure they effectively communicate their findings to a general audience. Examples are
  available at:

<p>

<p><a href="http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.0030168#special">Systems Analysis of
  Chaperone Networks in the Malarial Parasite <em>Plasmodium falciparum</em></a></p>

<p><a href="http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.0030119#special">Protein&ndash;Protein
  Interaction Hotspots Carved into Sequences</a></p>

<p><a href="http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.0030161#special">Elucidating the
  Altered Transcriptional Programs in Breast Cancer using Independent Component Analysis</em></a></p>

<a name="introduction"></a>
<h4>Introduction</h4>

<p>The introduction should put the focus of the manuscript into a broader context. As you compose the introduction,
  think of readers who are not experts in this field. Include a brief review of the key literature. If there are
  relevant controversies or disagreements in the field, they should be mentioned so that a non-expert reader can delve
  into these issues further. The introduction should conclude with a brief statement of the overall aim of the
  experiments and a comment about whether that aim was achieved.</p>

<a name="results"></a>
<h4>Results</h4>

<p>The results section should provide details of all of the experiments that are required to support the conclusions of
  the paper. There is no specific word limit for this section, but details of experiments that are peripheral to the
  main thrust of the article and that detract from the focus of the article should not be included. The section may be
  divided into subsections, each with a concise subheading. Large datasets, including raw data, should be submitted as
  supporting files; these are published online alongside the accepted article. The results section should be written in
  the past tense.</p>

<a name="discussion"></a>
<h4>Discussion</h4>

<p>The discussion should spell out the major conclusions of the work along with some explanation or speculation on the
  significance of these conclusions. How do the conclusions affect the existing assumptions and models in the field? How
  can future research build on these observations? What are the key experiments that must be done? The discussion should
  be concise and tightly argued. The results and discussion may be combined into one section, if desired.</p>

<a name="materials_methods"></a>
<h4>Materials and Methods (also called "Methods" or "Models")</h4>

<p>This section should provide enough detail for reproduction of the findings. Protocols for new methods should be
  included, but well-established protocols may simply be referenced. While we do encourage authors to submit all
  appendices, detailed protocols, or details of the algorithms for newer or less well-established methods, please do so
  as Supporting Information files. These are not included in the typeset manuscript, but are downloadable and fully
  searchable from the HTML version of the article. </p>

<a name="acknowledgments"></a>
<h4>Acknowledgments</h4>

${cj_acknowledgements}


<a name="references"></a>
<h4>References</h4>

${references}

<a name="figurelegends"></a>
<h4>Figure Legends</h4>
${figure_legends}

<a name="tables"></a>
<h4>Tables</h4>
${cj_tables}

<a name="nomenclature"></a>

<h3>Nomenclature</h3>
${nomenclature}

<a name="accessionnumbers"></a>

<h3>Accession Numbers</h3>

${cj_accession_numbers}





<a name="abbreviations"></a>

<h3>Abbreviations</h3>

${cj_abbreviations}


<a name="software"></a>

<h2>8. Software Articles</h2>

<p><em>PLOS Computational Biology</em> publishes articles describing outstanding open source software of exceptional
  importance that <strong>has been shown to provide new biological insights</strong>, either as a part of the software
  article, or published elsewhere. The software must already be widely adopted, or have the promise of wide adoption by
  a broad community of users. Enhancements to existing published open source software will only be considered if those
  enhancements bring exceptional new capabilities. The software must be downloadable anonymously in source code form and
  licensed under an <a href="http://www.opensource.org/licenses/alphabetical">Open Source Initiative (OSI) compliant
    license.</a> The source code must be accompanied with documentation on building and installing the software from
  source, as well as for using the software, including instructions on how a user can test the software on supplied test
  data. Software articles require a <a href="#presubs">presubmission inquiry</a> that includes explanations on how the
  above criteria are met.</p>

<h3>Instructions for Authors:</h3>

<p><strong>Format:</strong> Articles should be concise (less than 3500 words, not including supplementary material) and
  be organized as follows:</p>
<ul>
  <li>Title which includes the name of the software.</li>
  <li>Authors and affiliations.</li>
  <li>Abstract – Fundamental task(s) which the software accomplishes, examples of biological insights from the use of
    the software, details of availability, including where to download the most recent source code, the license, any
    operating system dependencies, and support mailing lists.
  </li>
  <li>Introduction – A description of the problem addressed by the software and of its novelty and exceptional nature in
    addressing that problem.
  </li>
  <li>Design and Implementation – Details of the algorithms used by the software, how those algorithms have been
    instantiated, including dependencies. Details of the supplied test data and how to install and run the software
    should be detailed in the supplementary material.
  </li>
  <li>Results – Examples of biological problems solved using the software, including results obtained with the deposited
    test data and associated parameters.
  </li>
  <li>Availability and Future Directions – Where the software has been deposited. Any future work planned to be carried
    out by the authors, how others might extend the software.
  </li>
</ul>

<p>A prerequisite for publication is that the results described in the paper must be reproducible when peer reviewers or
  editors choose to run the software on the deposited dataset using the parameters provided.</p>

<p>There is no minimal set of hardware platforms or operating systems that the software is required to run on provided
  they do not limit broad adoption of the software. Similarly, open-source software may depend on proprietary ancillary
  software, or external closed-source APIs, to run or to build. Such a dependency does not render software ineligible if
  it is otherwise open-source, but the dependency may be considered when judging the limits to broad adoption.</p>

<p>Authors are required to deposit the following with the journal upon submission for archival and review purposes. </p>
<ol>
  <li>Source Code, accompanied with the <a href="http://www.opensource.org/licenses/alphabetical">OSI-compliant
    license</a>.
  </li>
  <li>Binaries (optional).</li>
  <li>Documentation. This must include instructions for building and installing the software from source, and any
    dependencies on both proprietary and freely available prerequisites. For software libraries, instructions for using
    the API are also required.
  </li>
  <li>Test data and instructions. The test dataset(s) must enable complete demonstration of the capabilities of the
    software, and may either be available from a publicly accessible data archive via a provided URI, or may be
    specifically created and made available with the software. The results of running the software on the test data
    should be reproducible, and any external dependencies (such as external databases that may change) must be
    documented.
  </li>
</ol>

<p>The archived software and associated test data, parameters and documentation are the copy of record that matches the
  associated published article.
  They must be deposited as supplemental information file of less than 100MB (ideally as .7z or .rar). This ensures that
  a version of the software is always available to the community. Recognizing that software is subject to on-going
  development we strongly encourage authors to deposit and manage their source code revisions in an established software
  version control repository (<a href="http://en.wikipedia.org/wiki/List_of_free_software_project_directories">see
    Wikipedia for a list</a>, and a <a
    href="http://en.wikipedia.org/wiki/Comparison_of_open_source_software_hosting_facilities">feature comparison
    matrix</a>). We further encourage software projects to provide active support and interact with their user
  communities via public mailing lists. Authors should provide links to the location of the software, mailing lists etc.
  as part of the article.</p>

<p>Once a positive response to a presubmission inquiry has been obtained, software articles and software should be
  submitted as a Research Article type and include a comment that this is a software article and should follow the <a
    href="guidelines">Author Guidelines</a> for manuscript, figure and table file formats. In addition, software
  articles should further follow the guidelines for software articles. For papers written in LaTeX, the <a
    href="latexGuidelines">LaTeX Guidelines</a> for formatting the paper should be followed.</p>


<a name="submission"></a>

<h2>9. Materials Required for Manuscript Submission</h2>

<h3>Cover Letter</h3> 
<p>It is important that you include a cover letter with your manuscript. Please explain why this manuscript is suitable for publication in <em>${journal_name}</em>; why will your paper inspire the other members of your field, and how will it drive research forward? You are free to recommend a suitable Associate Editor to handle your submission; however, the editors reserve the right to contact an alternative&mdash;either from the board or a guest editor&mdash;if it is considered more appropriate. Please note that the cover letter will be available to the editors and to external peer reviewers as necessary, so be careful not to reveal anything of a confidential nature.</p>

<a name="authorstatus"></a>
<h3>Author Status</h3>
<p>It is the responsibility of the corresponding author to ensure that all authors are aware of and approve the submission of the manuscript, its content, authorship, and order of authorship. Confirmation of this action is required at submission of all manuscripts. </p>
<p>The involvement of any professional medical writer in publication must be declared. We encourage authors to consult the <a href="http://www.emwa.org/Mum/EMWAguidelines.pdf" title="View Guidelines">European Medical Writers\' Association Guidelines</a> on the role of medical writers. For all PLOS journals, the corresponding author must submit the manuscript, related files, and all required data and information. From the point of submission through to publication, all communication related to that manuscript will be directed to and received from the corresponding author only.</p>
<p><em>${journal_name}</em> bases its criteria for authorship on those outlined in the <a href="http://www.icmje.org/ethical_1author.html">Uniform Requirements for Manuscripts Submitted to Biomedical Journals</a>, which are summarized below. The contributions of all authors must be described. Contributions that fall short of authorship should be mentioned in the acknowledgments.</p>
<blockquote>
<p>"Authorship credit should be based on
<ol>
<li> substantial contribution to conception and design, or acquisition of data, or analysis and interpretation of data;</li>
<li> drafting the article or revising it critically for important intellectual content; and</li>
<li> final approval of the version to be published</li>
</ol>
Authors should meet conditions 1, 2, and 3.</p>
<p>When a large, multi-center group has conducted the work, the group should identify the individuals who accept direct responsibility for the manuscript (3). These individuals should fully meet the criteria for authorship defined above and editors will ask these individuals to complete journal-specific author and competing interests disclosure forms. When submitting a group author manuscript, the corresponding author should clearly indicate the preferred citation and should clearly identify all individual authors as well as the group name.</p>
<p>Acquisition of funding, collection of data, or general supervision of the research group, alone, does not justify authorship. All persons designated as authors should qualify for authorship, and all those who qualify should be listed. Each author should have participated sufficiently in the work to take public responsibility for appropriate portions of the content."</p>
</blockquote>
<p>PLOS journals follow the <a href="http://publicationethics.org/">COPE guidelines</a> covering changes in authorship. Please note that if any changes to the list of authors of a manuscript are necessary after the initial submission of a manuscript to a PLOS journal but before its publication, the corresponding author may be asked to provide written confirmation that all authors consent to the change(s). The journal also reserves the right to request written confirmation from all authors (including those added, removed, or moved in the author order). Such written consent may be required before the revised submission is sent to the editors. </p>
<a name="financialdisclosure"></a>
<h3>Financial Disclosure</h3>
<p>This section should describe sources of funding that have supported the work. Please include relevant grant numbers and the URL of any funder\'s Web site. Please also include this sentence: "The funders had no role in study design, data collection and analysis, decision to publish, or preparation of the manuscript." If this statement is not correct, you must describe the role of any sponsors or funders, and amend the aforementioned sentence as needed.</p>


<a name="competing"></a>
<h3>Competing Interests</h3>
<p>The submitting author is asked at submission to declare, on behalf of all authors, whether there are any financial, personal, or professional interests that could be construed to have influenced the paper. The information entered here will appear in the published version, so please do not include the same in the manuscript file.</p>
<p>Reviewers are also asked to declare any interests that might interfere with their objective assessment of a manuscript. Any relevant competing interests of authors must be available to editors and reviewers during the review process and will be stated in published articles. Read more about PLOS\'s <a href="competing">Competing Interests Policy</a>.</p>


<a name="electronicformats"></a> 
<h3>Electronic Formats </h3>
<p>Our submission system supports a limited range of formats for text and graphics. The following file formats/types and manuscript information are required before submission. If you are concerned about the suitability of your files, please contact us at ${email}.</p>
<a name="textfiles"></a>
<h4>Manuscript and Table Files</h4>

<p>Articles can be submitted for review in DOC, DOCX, RTF, or PDF. Any articles that have been prepared in LaTeX will be accepted for review, but only in PDF format. After acceptance, only text files (RTF or DOC) of the revised manuscript and tables can be accepted for use in the production process. </p>

<h4>Math Equations and DOCX</h4>

<p>If your manuscript is or will be in DOCX and contains equations, you must follow the instructions below to make sure that your equations are editable when the file enters production.</p>
<p>If you have not yet composed your article, you can ensure that the equations in your DOCX file remain editable in DOC by enabling &ldquo;Compatibility Mode&rdquo; before you begin. To do this, open a new document and save as Word 97-2003 (*.doc). Several features of Word 2007/10 will now be inactive, including the built-in equation editing tool. You can insert equations in one of the two ways listed below.</p>
<p>If you have already composed your article as DOCX and used its built-in equation editing tool, your equations will become images when the file is saved down to DOC. To resolve this problem, re-key your equations in one of the two following ways.
</p>
<ol>
<li>Use MathType to create the equation. MathType is the recommended method for creating equations.</li>
<li>Go to Insert &gt; Object &gt; Microsoft Equation 3.0 and create the equation. </li>
</ol>

<p>If, when saving your final document, you see a message saying &ldquo;Equations will be converted to images,&rdquo; your equations are no longer editable and PLOS will not be able to accept your file.</p>


<a name="latex"></a>
<h4>LaTeX</h4>

<p>Articles prepared in LaTeX may be submitted in PDF format for use during the review process. After acceptance, however, .tex files and formatting information will be required as a zipped file. Please consult our <a href="latexGuidelines">LaTeX Guidelines</a> for a list of what will be required.</p>

<a name="tables"></a>
<h4>Tables</h4>
<p>Tables must conform to our <a href="figureGuidelines">Guidelines for Figure and Table Preparation</a> and placed at the end of the article DOC or RTF file. Accepted LaTeX submissions only should have table files—which must also conform to these guidelines—uploaded individually into the online submission system.</p>

<a name="strikingimages"></a>
<h4>Striking Images</h4>
<p>Authors are encouraged to upload a "striking image" that may be used to represent their paper online in places like the journal homepage or in search results. Striking images should ideally be high resolution, eye-catching, single panel images, and should ideally avoid containing added details such as text, scale bars, and arrows. If no striking image is uploaded, a figure from the paper will be designated as the striking image.</p>

<p>Please keep in mind that PLOS's <a href="http://www.ploscompbiol.org/static/figureGuidelines#ccal">Creative Commons Attribution License</a> applies to striking images. As such, do not submit any figures or photos that have been previously copyrighted unless you have express written permission from the copyright holder to publish under the CCAL license. Note that all published materials in PLOS Computational Biology are freely available online, and any third party is permitted to read, download, copy, distribute, and use these materials in any way, even commercially, with proper attribution.</p>

<p>For license inquiries, e-mail license [at] plos.org.</p>

 <a name="figurefiles"></a>
<h4>Figure Files</h4>
<p>For the article to be accepted for publication, the author will need to supply high-resolution versions of the figures in TIF or EPS format only. When preparing your figures, please ensure that the files conform to our <a href="figureGuidelines">Guidelines for Figure and Table Preparation</a>. Please do <strong>not</strong> upload panels for a single figure separately (for example, Figure 1A, Figure 1B-1D, Figure 1E); each figure file should be a single montage of all panels. Queries can be sent to <strong>figures [at] plos.org.</strong></p>

<p>If you are uploading your files in EPS format, please use the &quot;create outlines&quot; option under the type menu in Illustrator so that all text and fonts appear as intended in print. If you need additional help with figure preparation, please contact <strong>figures [at] plos.org</strong>.</p>

<p>PLOS does not accept vector EPS figures generated using LaTeX. We only accept LaTeX generated figures in TIFF format. Export your LaTeX files as PDFs, and then open them in GIMP or Photoshop and save as TIFF. In general, Figures must be generated in a standalone graphics application such as Adobe Illustrator, InkScape, PyMol, MatLab, SAS, etc. Please see our <a href="figureGuidelines" title="Go to Figure Guidelines">Figure Guidelines</a> for more information.</p>

<p>All figures will be published under a <a href="license" title="View license">Creative Commons Attribution License</a>, which allows them to be freely used, distributed, and built upon as long as proper attribution is given.  Please do not submit any figures that have been previously copyrighted unless you have express written permission from the copyright holder to publish under the CCAL license. </p>

<a name="supportinginfo"></a>
<h4>Multimedia Files and Supporting Information</h4>
<p>We encourage authors to submit essential supporting files and multimedia files along with their manuscripts. All supporting material will be subject to peer review, and should be smaller than 10 MB in size because of the difficulties that some users will experience in loading or downloading files of a greater size.</p>

<p>Supporting files should fall into one of the following categories: Dataset, Figure, Table, Text, Protocol, Audio, or Video. All supporting information should be referred to in the manuscript with a leading capital S (e.g., Figure S4 for the fourth supporting information figure). The numbered title and caption for each supporting information file should be included in the main article file, after the titles and captions for the main figures.</p>

<p>Supporting files will not be included in the typeset PDF, but will be referenced in the text and hosted online.</p>

<p>Supporting files may be submitted in a variety of formats, but should be publication-ready, as these files are not copyedited. Carefully consider whether your supporting information needs to be searchable and/or editable, and choose the most suitable format accordingly. See the <a href="figureGuidelines#multimedia">Figure Guidelines</a> for more detail about our requirements for multimedia files and the file formats we accept.</p>



<a name="readytosubmit"></a>
<h3> Ready to Submit Your Manuscript?</h3>

<p>We have provided a <a href="checklist" title="View submission checklist">Submission Checklist</a> to help you prepare your materials for submission and to make the online submission process as straightforward as possible. Please take the time to look through the list before submitting your article.  </p>

<p>Please login or register at our <a href="${jms_link}" title="Go to Submission site">online submission system</a> to begin the submission process. Files can be uploaded individually or together in a single ZIP file, and are automatically combined into a single PDF file, which must be approved by the author at the end of the submission process.  This merged PDF is for internal and external peer review only. Original source files will be used to prepare accepted articles for publication.</p>'>



<a name="other" id="other"></a>

<h2>10. Other Types of Articles</h2>


<p><em>PLOS Computational Biology</em> publishes a range of articles other than research articles, methods articles and
  software articles. Contributions to the front section of the journal are subject to peer review. No publication
  charges apply. Prospective contributors are encouraged to review contributions in the respective sections of the
  journal before considering a submission.</p>

<p>Editorials &mdash; Editorials are written by <em>PLOS Computational Biology</em> editors. Guest editorials are
  invited by or at the discretion of the Editor-in-Chief. Editorials typically introduce new and changed features to the
  journal, discuss issues of professional development, and highlight developments in the field relevant to the
  readership.</p>

<p>Education articles &mdash; The goal of the <a href="http://collections.plos.org/ploscompbiol/index.php"
                                                 title="View PLOS Computational Biology Education Collection">Education</a>
  section of <em>PLOS Computational Biology</em> is to provide both practical and background information on important
  computational methods and approaches used to investigate interesting biological problems. Contributions to the
  Education section can take several forms, including historical reviews and practical tutorials. Education articles
  should aim for 2000 and should not exceed 2500 words. The articles are generally invited, but unsolicited submissions
  will be considered and proceed at the discretion of the Education Editor.</p>

<p>Reviews &mdash; Reviews reflect rapidly advancing or topical areas in computational biology research that are of
  broad interest to the entire biology community and have not been covered significantly by other journals. A review
  should aim for 3000-6000 words and no more than 100 references and two or three figures or other display items. A
  review should not be a mere summary of the field; it should be a critique with new points of view which are supported
  by existing literature from a variety of authors. Reviews are received both by invitation and as unsolicited
  submissions.</p>

<p>Perspectives &mdash; Perspectives in <em>PLOS Computational Biology</em> typically reflect an author's viewpoint on a
  particular development in science and how, based on current knowledge of the field and the progress in it, this
  development evidences or can lead to change in how science is conducted or interpreted. Perspectives are intended to
  be more prospective than retrospective but require sufficient background to place the points made in context.
  Perspectives are intended to invite debate and further comment as appropriate. The length is ideally around 2000 and
  limited to 2500 words. Suggestions for topics may be forwarded to ${email} and are usually handled by the
  Editor-in-Chief.</p>

<p>Topic Pages &mdash; Topic Pages are intended to increase the coverage of computational biology in Wikipedia. The
  Topic Page becomes a published copy of record of a dynamic version of the article as found in Wikipedia. Further
  information about Topic Pages can be found in the series <a
    href="http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1002446">editorial</a>. Suggestions
  for ideas should be emailed to  ${email}</p>

<p>Messages from ISCB &mdash; As an official journal of the International Society for Computational Biology (ISCB), <em>PLOS
  Computational Biology</em> publishes in this section short informational articles invited by the ISCB Editor as well
  as announcements from the Society.</p>

<a name="production"></a>

<h2>11. Overview of the Production Process</h2>

${cj_production_process}

<a name="embargoes"></a>

<h2>12. Blogs, Wikis, Embargoes, and the Media</h2>

<p>Authors are of course at liberty to present their findings at medical or scientific conferences ahead of publication.
  We recommend, however, that authors not contact the media or respond to such contact unless an article has been
  accepted for publication and an embargo date has been established. Respect for press embargoes will help to ensure
  that your work is reported accurately in the popular media. If a journalist has covered a piece of work ahead of
  publication, this will not affect consideration of the work for publication. See also our <a
    href="http://www.plos.org/journals/embargopolicy.html" title="embargo guidelines for journalists">embargo guidelines
    for journalists</a>.</p>

</div>
<!-- end : main contents -->
