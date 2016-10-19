<#include "/includes/search.ftl">

<div id="nav-main" class="nav">
  <ul>
    <li id="mn-01"><a href="javascript:void(0);">Browse</a>
      <div class="submenu">
        <div class="menu">
          <ul>
            <li><a href="${browseIssueURL}">Current Issue</a></li>
            <li><a href="${browseVolumeURL}">Journal Archive</a></li>
            <li><a href="${freemarker_config.journalUrls.PLoSCollections}/static/ppatCollections">Collections</a></li>
          </ul>
        </div>
      </div>
    </li>
    <li id="mn-02" ><a href="javascript:void(0);">Publish</a>
      <div class="submenu" style="width: 980px; margin-left: -471px; padding-bottom: 0">

        <div class="dropdown mega menu">
          <ul class="multi-col" id="publish-dropdown-list">

            <li class="menu-section-header " id="submissions">
              <span class="menu-section-header-title">Submissions</span>

              <ul class="menu-section " id="submissions-dropdown-list">
                <li><a href="${gettingstartedURL}">Getting Started</a></li>
                 <li><a href="${presubmissioninquiriesURL}">Presubmission Inquiries</a></li>
                <li><a href="${submissionguidelinesURL}">Submission Guidelines</a></li>

                <li><a href="${figuresURL}">Figures</a></li>

                <li><a href="${tablesURL}">Tables</a></li>

                <li><a href="${supportingInformationURL}">Supporting Information</a></li>

                <li><a href="${latexURL}">LaTeX</a></li>
                <li><a href="${otherarticletypesURL}">Other Article Types</a></li>

                <li><a href="${revisingyourmanuscriptURL}">Revising Your Manuscript</a></li>

                <li><a href="${submitnowURL}">Submit Now</a></li>

              </ul>

            </li>


            <li class="menu-section-header " id="policies">
              <span class="menu-section-header-title">Policies</span>

              <ul class="menu-section " id="policies-dropdown-list">
                <li><a href="${bestpracticesinresearchreportingURL}">Best Practices in Research Reporting</a></li>

                <li><a href="${humansubjectsresearchURL}">Human Subjects Research</a></li>

                <li><a href="${animalresearchURL}">Animal Research</a></li>

                <li><a href="${competinginterestsURL}">Competing Interests</a></li>

                <li><a href="${disclosureoffundingsourcesURL}">Disclosure of Funding Sources</a></li>

                <li><a href="${contentlicenseURL}">Content License</a></li>

                <li><a href="${dataavailabilityURL}">Data Availability</a></li>

                <li><a href="${materialsandsoftwaresharingURL}">Materials and Software Sharing</a></li>

                <li><a href="${ethicalpublishingpracticeURL}">Ethical Publishing Practice</a></li>

              </ul>

            </li>


            <li class="menu-section-header " id="manuscript-review-and-publication">
              <span class="menu-section-header-title">Manuscript Review and Publication</span>

              <ul class="menu-section " id="manuscript-review-and-publication-dropdown-list">

                <li><a href="${editorialandpeerreviewprocessURL}">Editorial and Peer Review Process</a></li>

                <li><a href="${reviewerGuidelinesURL}">Reviewer Guidelines</a></li>

                <li><a href="${acceptedmanuscriptsURL}">Accepted Manuscripts</a></li>

                <li><a href="${correctionsandretractionsURL}">Corrections and Retractions</a></li>

                <li><a href="${commentsURL}">Comments</a></li>

                <li><a href="${articlelevelmetricsURL}">Article-Level Metrics</a></li>

              </ul>

            </li>
          </ul>
          <div class="calloutcontainer">


            <h3 class="callout-headline">Submit Your Manuscript</h3>

            <div class="action-contain">
              <p class="callout-content">
               <em>PLOS Pathogens</em> publishes Open Access research and commentary that significantly advance the understanding of
pathogens and how they interact with host organisms.
              </p>
              <p class="button-contain">
                <a class="button btn-style" href="${submitnowURL}">
                 Learn More
               </a>
       
           </p>
         </div>  
       </div>
     </div>

   </div>
 </li>

 <li id="mn-03"><a href="javascript:void(0);">About Us</a>
  <div class="submenu" style="width:248px; margin-left:-30px;">
    <div class="menu">
      <ul>
        <li><a href="${journalinformationURL}">Journal Information</a></li>
        <li><a href="${edboardURL}">Editorial Board</a></li>
        <li><a href="${publishinginformationURL}">Publishing Information</a></li>
        <li><a href="${publicationfeesURL}">Publication Fees</a></li>
        <li><a href="${pressandmediaURL}">Press and Media</a></li>
        <li><a href="${contactURL}">Contact</a></li>
      </ul>
    </div>
  </div>
</li>
  </ul>
</div>