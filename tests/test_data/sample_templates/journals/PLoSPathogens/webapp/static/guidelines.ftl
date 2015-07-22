<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSPathogens/web#$
  $Id: guidelines.ftl 15116 2013-06-14 05:35:45Z mbaehr $
  
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


   
   <h1><em>${journal_name}</em> Guidelines for Authors</h1>
   
   <h2>Contents:</h2>
   
   <ol>
   <li><a href="#about">About <em>${journal_name}</em></a></li>
   <li><a href="#openaccess">Open Access</a></li>
   <li><a href="#publicationcharges">Publication Charges</a></li>
   <li><a href="#criteria">Criteria for Publication</a></li>
   
   <li><a href="#editorial">Overview of the Editorial Process</a>
     <ol>
     <li><a href="#appeals">Appeals of Decisions</a></li></ol>
     
   <li><a href="#presubs">Presubmission Inquiries</a></li>
   
   <li><a href="#preparation">Preparation of Research Articles</a>
   <ol>
   <li><a href="#organization">Organization of the Manuscript</a></li>
   <li><a href="#nomenclature">Nomenclature</a></li>
   <li><a href="#accessionnumbers">Accession Numbers</a></li>
   <li><a href="#abbreviations">Abbreviations</a></li>
   </ol></li>
   
   
   <li><a href="#submission">Materials Required for Manuscript Submission</a>
   <ol>
   <li><a href="#coverletter">Cover Letter</a></li>
   <li><a href="#authorstatus">Author Status</a></li>
   <li><a href="#financialdisclosure">Financial Disclosure</a></li>
   <li><a href="#competing">Competing Interests</a></li>
   <li><a href="#electronicformats">Electronic Formats</a>
   <ol>
   <li><a href="#textfiles">Manuscript and Tables File</a></li>
   <li><a href="#figurefiles">Figure Files</a></li>
   <li><a href="#supportinginfo">Multimedia Files and Supporting Information</a></li>
   </ol></li>
   <li><a href="#readytosubmit">Ready to Submit Your Manuscript?</a></li>
   </ol></li>
   <li><a href="#other">Reviews, Opinions, Editorials, and Pearls</a></li>
   <li><a href="#production">Overview of the Production Process</a></li>
   </ol>
   
   <a name="about"></a>
   <h2>1. About <em>PLOS Pathogens</em></h2>
   <p>Bacteria, fungi, parasites, prions and viruses cause a variety of diseases that have important medical, agricultural, and economic consequences. Moreover, the study of microbes continues to provide novel insights into such fundamental processes as the molecular basis of cellular and organismal function. <em>PLOS Pathogens</em> reflects the full breadth of research in these areas by publishing outstanding original articles that significantly advance the understanding of pathogens and how they interact with their host organisms. <em>PLOS Pathogens</em> provides immediate free access to all content, ensuring that authors reach the widest possible audience as soon as a manuscript is published. Topics include (but are not limited to) adaptive and innate immune defenses as well as pathogen countermeasures, emerging pathogens, evolution, genomics and gene regulation, model host organisms, pathogen-cell biology, pathogenesis, prions, proteomics and signal transduction, rational vaccine design, structural biology, and virulence factors. For further information, please see the journal <a href="information" title="Go to Journal Information">scope</a>.</p>
   
   <a name="openaccess"></a>
   <h2>2. Open Access</h2>
   ${open_access}
   
   <a name="publicationcharges"></a>
   <h2>3. Publication Charges</h2>
   ${publication_charges}
   
   <a name="criteria"></a>
   <h2>4. Criteria for Publication</h2>
   <p>To be considered for publication in <em>${journal_name}</em>, any given manuscript must satisfy the following criteria:</p>
   <ul>
   <li>Originality</li>
   <li>High importance to researchers in the field</li>
   <li>High importance and broad interest to the community of researchers studying pathogens and pathogen-host interactions</li>
   <li>Rigorous methodology</li>
   <li>Substantial evidence for its conclusions</li>
   </ul>
   
   <a name="editorial"></a>
   <h2>5. Overview of the Editorial Process</h2>
   
   <p>Our aim is to provide all authors with an efficient, courteous, and constructive editorial process. To achieve its required level of quality, <em>${journal_name}</em> is highly selective in the manuscripts that it publishes; rejections rates are high. To ensure the fairest and most objective decision-making, the editorial process is run as a partnership between the <em>${journal_name}</em> <a href="eic">Editor-in-Chief</a>, a Deputy Editor, a team of Section Editors (SEs), and a group of academic experts who act as <a href="edboard">Associate Editors</a> (AEs). These individuals are leaders in their fields and represent the full breadth of pathogen-related research.</p>
   
   <p>Submitted manuscripts are first reviewed by a group of relevant SEs, who may decide to reject the paper or send it on to an AE for further review. The AE is most often a member of the <em>${journal_name}</em> Editorial Board, but occasionally a guest of the Board is invited to serve in this capacity. The AE evaluates the paper and decides whether it describes a sufficient body of work to support a major advance in a particular field. If so, the paper is sent out for external peer review, at which stage the technical and scientific merits of the work are carefully considered. Once the reviews have been received and considered by the editors, a decision letter to the corresponding author is drafted and sent.</p>
   
   
   <p>The decision will be within one of the following categories:
   <ul>
   <li>Reject</li>
   <li>Major revision</li>
   <li>Minor revision</li>
   <li>Accept</li>
   </ul>
   </p>
   

 <a name="appeals"></a>
 <h3>Appeals of Decisions</h3>
<p><em>PLOS Pathogens</em> encourages input from the community regarding editorial and publishing policies. However, appeals against manuscript decisions must be a) limited to the specific manuscript in question, b) made only by the corresponding author, and c) sent by e-mail to <strong>plospathogens [at] plos.org</strong>. Telephone calls or other informal appeals are discouraged and will not be considered. Appeals will <em>only</em> be considered when a reviewer or editor is thought to have made a significant factual error or when his/her objectivity is compromised by a documented competing interest, <em>and</em> when a reversal based on either of these grounds would change the original decision. The journal staff will ask for confirmation of the reason(s) in the first instance. If the authors proceed, the original editor(s) will usually be asked to consider the appeal. Additional editorial board members may also be consulted. Each appeal is treated on its merits and the journal cannot make any guarantees about the turnaround time or outcome. Appeals of decisions made before review will only be considered in exceptional circumstances. Appeals of decisions noted as final will not be considered.</p>
   
   <a name="presubs"></a>
   <h2>6. Presubmission Inquiries</h2>
     <p>When authors are unsure whether their work satisfies the basic 
    requirements for publication in <em>PLOS Pathogens</em>, we are 
    happy to consider presubmission inquiries. If you would like to 
    submit an informal presubmission inquiry to see if a manuscript 
    is appropriate in principle, please login or register for a new 
    account within our <a href="http://www.editorialmanager.com/ppathogens">online 
    submission system</a>, choosing 'Submit Presubmission Inquiry' 
    from the list of Author Tasks. Required for all Presubmission 
    Inquiries are contact information, a cover letter, and an 
    abstract.</p> 
   
    <p>Responses to these inquiries are normally provided within one 
    week. Responses may take longer if consultation between members 
    of the editorial board is required. If you are invited to 
    <a href="http://www.editorialmanager.com/ppathogens">submit your 
    manuscript</a>, we will do our best to provide an expeditious 
    initial assessment of the complete manuscript for suitability and 
    then, if warranted, external peer review.</p> 
   
    <p>To be of most use to authors and editors, presubmission 
    enquiries should consist of the following:</p> 
   
    <p><strong>A) A COVER LETTER</strong> of approximately 600 words 
    that provides brief answers to the following questions:</p> 
   
    <ol> 
      <li>What is the scientific question you are addressing?</li> 
   
      <li>What is the key finding that answers this question?</li> 
   
      <li>What is the nature of the evidence you provide in support 
      of your conclusion?</li> 
   
      <li>What are the three most recently published papers that are 
      relevant to this question?</li> 
   
      <li>What significance do your results have for the field?</li> 
   
      <li>What significance do your results have for the broader 
      community in the area of Pathogens and/or Pathogenesis?</li> 
   
      <li>What other novel findings do you present?</li> 
   
      <li>Is there additional information that we should take into 
      account?</li> 
    </ol> 
   
    <p><strong>B) A REFERENCED ABSTRACT</strong> <strong>of 
    approximately 300 words.</strong> For the purpose of the 
    presubmission enquiry submission form, the referenced abstract should include up to 10 key 
    references that put your work into context. <strong>Please do not 
    submit your entire manuscript.</strong> The abstract should be 
    structured as follows:</p> 
   
    <h4>Background</h4> 
          <p>This section should describe clearly the 
    rationale for the study being done and the previous work relevant 
    to the study. It should end with a statement of the specific 
    question or hypothesis being addressed.</p> 
   
    <h4>Methodology/Principal Findings</h4> 
          <p>Mention the techniques 
    used without going into extensive methodological detail, and 
    outline the most important results. Include sample sizes for key 
    experiments as appropriate. Please also outline any limitations 
    of the study that may have a bearing on the results.</p> 
   
    <h4>Conclusions/Significance</h4> 
          <p>Provide the take-home message 
    of your article as clearly as possible. You may also include a 
    brief, more general interpretation of the results and / or 
    specific recommendations for future research. Please note, 
    however, that the editors will pay most attention to the direct 
    conclusions of the work being presented, rather than some 
    possible future avenues being opened.</p>   
   
   
   <a name="preparation"></a>
   <h2>7. Preparation of Research Articles</h2>
   <p><em>${journal_name}</em> publishes original research that clearly demonstrates novelty, importance to a particular field, biological significance, and conclusions that are justified by the study.</p>
   
   <p>Our aim is to make the editorial process rigorous and consistent, and to offer the best possible support to our authors throughout this process. Authors are encouraged to decide how best to present their ideas, results, and conclusions. The writing style should be concise and accessible. Editors may make suggestions for how to achieve this, as well as suggestions for cuts or additions that could be made to the article to strengthen the argument.</p>
   
   <p>Although we encourage submissions from around the globe, we require that manuscripts be submitted in English. As a step towards overcoming language barriers, we encourage authors fluent in other languages to provide copies of their full articles or abstracts in other languages. Translations should be submitted as supporting information and listed, together with other supporting information files, at the end of the article text.</p>
   
   
   <a name="organization"></a>
   <h3>Organization of the Manuscript</h3>
   
   <p>Most Research Articles published in <em>${journal_name}</em> are organized into the following sections: <a href="#title">Title</a>, <a href="#authors">Authors</a>, <a href="#affiliations">Affiliations</a>, <a href="#abstract">Abstract</a>, <a href="#authorsummary">Author Summary</a>, <a href="#introduction">Introduction</a>, <a href="#results">Results</a>, <a href="#discussion">Discussion</a>, <a href="#materials_methods">Materials and Methods</a>, <a href="#acknowledgments">Acknowledgments</a>, <a href="#references">References</a>, <a href="#figurelegends">Figure Legends</a>, and <a href="#tables">Tables</a>. Uniformity in format facilitates the experience of readers and users of the journal. To provide flexibility, however, authors are also able to include the Materials and Methods section before the Results section or before the Discussion section. Please also note that the Results and Discussion can be combined into one Results/Discussion section. All manuscripts must contain line numbers. Although we have no firm length restrictions for the entire manuscript, we urge authors to present and discuss their findings concisely.</p>
   
   
   <a name="title"></a>
   <h4>Title (150 characters or less, including spaces)</h4>
   
   <p>The title should be specific to the project, yet concise. It should be comprehensible to readers outside your field. Avoid specialist abbreviations, if possible. Titles should be presented in title case, meaning that all words except for prepositions, articles, and conjunctions should be capitalized. Please ensure the title in the manuscript is the same as that entered into our submission form. Please also provide, in the submission form only, a brief Short Title (or "running head") of no more than 50 characters.</p>
   
   <p>Example title: <br />
   Detection of Specific Sequences among DNA Fragments Separated by Gel Electrophoresis</p>
   
   
   <a name="authors"></a><a name="affiliations"></a>
   <h4>Authors and Affiliations</h4>
   
   ${authors_and_affiliations}
   
   <a name="abstract"></a>
   <h4>Abstract</h4>
   <p>The abstract of the paper should be succinct; it must not exceed 300 words. Authors should mention the techniques used without going into methodological detail and should summarize the most important results. While the abstract is conceptually divided into three sections (Background, Methodology/Principal Findings, and Conclusions/Significance), please do not apply these distinct headings to the abstract within the article file. Please do not include any citations and avoid specialist abbreviations.</p>
   
   <a name="authorsummary"></a>
   <h4>Author Summary</h4>
   <p>We ask that all authors of research articles include a 150&ndash;200 word non-technical summary of the work as part of the manuscript to immediately follow the abstract. This text is subject to editorial change, should be written in the first-person voice, and should be distinct from the scientific abstract. Aim to highlight where your work fits within a broader context; present the significance or possible implications of your work simply and objectively; and avoid the use of acronyms and complex terminology wherever possible. The goal is to make your findings accessible to a wide audience that includes both scientists and non-scientists. Authors may benefit from consulting with a science writer or press officer to ensure they effectively communicate their findings to a general audience. Examples are available at:<p>
   <p><a href="http://pathogens.plosjournals.org/perlserv/?request=get-document&doi=10.1371/journal.ppat.0030132#special">Mosquitoes Inoculate High Doses of West Nile Virus as They Probe and Feed on Live Hosts</a></p>
   
   <a name="introduction"></a>
   <h4>Introduction</h4>
   
   <p>The introduction should put the focus of the manuscript into a broader context. As you compose the introduction, think of readers who are not experts in this field. Include a brief review of the key literature. If there are relevant controversies or disagreements in the field, they should be mentioned so that a non-expert reader can delve into these issues further. The introduction should conclude with a brief statement of the overall aim of the experiments and a comment about whether that aim was achieved.</p>
   
   <a name="results"></a>
   <h4>Results</h4>
   <p>The results section should provide details of all of the experiments that are required to support the conclusions of the paper. There is no specific word limit for this section, but details of experiments that are peripheral to the main thrust of the article and that detract from the focus of the article should not be included. The section may be divided into subsections, each with a concise subheading. Large datasets, including raw data, should be submitted as supporting files; these are published online alongside the accepted article. The results section should be written in the past tense.</p>
   
   <a name="discussion"></a>
   <h4>Discussion</h4>
   <p>The discussion should spell out the major conclusions of the work along with some explanation or speculation on the significance of these conclusions. How do the conclusions affect the existing assumptions and models in the field? How can future research build on these observations? What are the key experiments that must be done? The discussion should be concise and tightly argued. The results and discussion may be combined into one section, if desired.</p>
   
   <a name="materials_methods"></a>
   <h4>Materials and Methods</h4>
   <p>This section should provide enough detail for reproduction of the findings. Protocols for new methods should be included, but well-established protocols may simply be referenced. While we do encourage authors to submit all appendices, detailed protocols, or details of the algorithms for newer or less well-established methods, please do so as Supporting Information files. These are not included in the typeset manuscript, but are downloadable and fully searchable from the HTML version of the article. </p>
   
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
   
   
   
   
   <a name="submission"></a>
   <h2>8. Materials Required for Manuscript Submission</h2>
   
   ${cj_materials}
   
   
   
   <a name="other"></a>
   <h2>9. Reviews, Opinions, Editorials, and Pearls</h2>
   <p>The front section of <em>${journal_name}</em> is a forum for the publication of articles of broad interest to the community of researchers studying pathogens and pathogen-host interactions. Articles in the magazine section will mostly be commissioned, but we welcome your ideas for articles. If you would like to write a Review or Opinion please first submit a <a href="#presubs">presubmission inquiry</a>. There are no publication charges associated with these articles.</p>
   
   <p>Reviews: These are peer-reviewed articles on rapidly advancing or topical areas in pathogen research and of broad interest to the entire pathogens community. Generally such pieces will canvass briefly any existing literature on a particular topic and speculate on future directions of this course of study. These articles should be no more than 3000 words with 5 figures and a maximum of 100 references. </p>
   
   <p>Opinions: The Opinions section is intended to provide a place for the expression of views on topical, emerging or controversial issues ranging from experimental science to those involving science and public-health policy, education and training. It is also a forum in which colleagues can respond, with room for speculation, to previously stated opinions or observations. A successful Opinion piece will make a compelling case for a particular point of view, but will do so, mindful of existing controversies or alternative views, and will make an effort to integrate these into the discussion. While primary data are typically not included in these submissions, if the author chooses to include data, it should be subjected to rigorous review as would any research article. These articles should be no more than 1000 words with 3 figures and a maximum of 100 references.</p>
   
   <p>Editorials: Written by the journal's editors, these occasional pieces can cover announcements, highlights of journal content, position statements, and journal updates.</p>
   <p>Pearls: The goal of a "Pearl" is to describe within a short space a small number of significant and interesting facts about a topic in the world of pathogens. While articles are meant to be current, the audience is meant to be broad. Thus, an article should be readable by scientists working on a completely different pathogen, and they should avoid details relevant only to insiders in a field. Rather they should summarize succinctly the key exciting and important facts on a topic at a level that would allow it to be used in a graduate course. Pearls should be no more than 1500 words with 1-2 figures/tables and a maximum of 20 references.</p>
   <p>Pearls may take one of the two following formats:</p>
   <ol>
   <li>"Five facts about X" In this format, authors list significant facts about a topic and then summarize the evidence for them.</li>
   <li>"Q&A" In this format, each paragraph involves a question followed by an answer – a more conversational style that may suit some topics better.</li>
   </ol>
   
   <a name="production"></a>
   <h2>10. Overview of the Production Process</h2>
   
   ${cj_production_process}

   <!-- end : main contents -->
