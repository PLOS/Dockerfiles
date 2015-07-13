<#-- Max number of categories to display on the side bar and related article tab -->
<#assign max_categories = 8>

<div class="sidebar">

  <div class="article-actions cf">
    <#if hasPDF == true>
      <div class="download">
        <span class="btn"><a href="${articlePDFURL}" title="Download" target="_blank">Download PDF</a></span>
      </div>
      <div class="btn-reveal dropdown">
        <div class="dropdown-icon">
          <span class="btn">&nbsp;</span>
        </div>
    <#else>
      <div class="btn-reveal dropdown">
        <div class="download">
          <span class="btn">Download</span>
        </div>
    </#if>

        <div class="content">
          <ul class="bullet">
            <li><a href="${articleCitationURL}" title="Download citations">Citation</a></li>
            <li><a href="${articleXMLURL}" title="Download article XML">XML</a></li>
          </ul>
        </div>
      </div> <!-- end btn-reveal dropdown-->


    <div class="btn-reveal flt-l">
        <span class="btn">Print</span>
        <div class="content">
            <ul class="bullet">
                <li id="print-article"><a href="#" onclick="if(typeof(_gaq) != 'undefined'){ _gaq.push(['_trackEvent','Article', 'Print', 'Click']); } window.print(); return false;" title="Print Article">Print article</a></li>
            <#if article.ezReprintLink??>
                <li>
                  <a href="${article.ezReprintLink}" title="Odyssey Press">EzReprint</a>
                </li>
            <#else>
                <li>
                  <a href="http://www.authorbilling.com/client.php?ID=1806" title="Order Reprints">Order Reprints</a>
                  <img src="/images/icon.reprint.gif" width="29" height="12" alt="New">
                </li>
            </#if>
            </ul>
        </div>
    </div>

    <div class="btn-reveal flt-r">
        <span class="btn">Share</span>
        <div class="content">
            <ul class="social">
            <#--
            some notes about social media buttons:

            1) the current document's URL passed to the 'url' query parameter
            of the service needs to be escaped by freemarker via the '?url'
            string method. (the same goes for the title, though titles are
            usually determined by the service, so we (usually) avoid passing
            them.)

            2) we're avoiding using external scripts where possible to reduce
            external dependencies, which directly and negatively affect page
            load time.

            -JSB/DP

            -->

            <#-- reddit, as per <http://www.reddit.com/buttons/> but modified to not use JS for encoding -->
                <li><a href="http://www.reddit.com/submit?url=${article.docURL?url}" target="_blank" title="Submit to Reddit"><img src="/images/icon.reddit.16.png" width="16" height="16" alt="Reddit">Reddit</a></li>

            <#-- google plus, as per <https://developers.google.com/+/plugins/share/#sharelink>  -->
                <li><a href="https://plus.google.com/share?url=${article.docURL?url}" target="_blank" title="Share on Google+"><img src="/images/icon.gplus.16.png" width="16" height="16" alt="Google+">Google+</a></li>

            <#-- stumbleupon, as per previous implementation. no current public
            documentation can be found on their site or elsewhere. -->
                <li><a href="http://www.stumbleupon.com/submit?url=${article.jDocURL?url}" target="_blank" title="Add to StumbleUpon"><img src="/images/icon.stumble.16.png" width="16" height="16" alt="StumbleUpon">StumbleUpon</a></li>

            <#-- facebook, as per previous implementation which uses the now
            deprecated share.php (which redirects to /sharer/sharer.php) -->
                <li><a href="http://www.facebook.com/share.php?u=${article.docURL?url}&amp;t=${article.noHTMLDocTitle?url}" target="_blank" title="Share on Facebook"><img src="/images/icon.fb.16.png" width="16" height="16" alt="Facebook">Facebook</a></li>

            <#-- linkedin. copy / pasted implementation from another site -->
                <li><a href="http://www.linkedin.com/shareArticle?url=${article.docURL?url}&title=${article.noHTMLDocTitle?url}&summary=${"Checkout this article I found at PLOS"?url}" target="_blank" title="Add to LinkedIn"><img src="/images/icon.linkedin.16.png" width="16" height="16" alt="Mendeley">LinkedIn</a></li>

            <#-- citeulike, as per <http://www.citeulike.org/bookmarklets.adp>
            and <http://wiki.citeulike.org/index.php/Organizing_your_library#Any_other_posting_tricks.3F> -->
                <li><a href="http://www.citeulike.org/posturl?url=${article.docURL?url}&amp;title=${article.noHTMLDocTitle?url}" target="_blank" title="Add to CiteULike"><img src="/images/icon.cul.16.png" width="16" height="16" alt="CiteULike">CiteULike</a></li>

            <#-- mendeley, as per previous implementation. no current public
            documentation can be found on their site or elsewhere. -->
                <li><a href="http://www.mendeley.com/import/?url=${article.docURL?url}" target="_blank" title="Add to Mendeley"><img src="/images/icon.mendeley.16.png" width="16" height="16" alt="Mendeley">Mendeley</a></li>

            <#-- PubChase, as per <https://developer.plos.org/jira/browse/AMEC-1999>,
             no public documentation can be found on their site or elsewhere -->
                <li><a href="https://www.pubchase.com/library?add_aid=${article.shortDOI?url}&amp;source=plos" target="_blank" title="Add to PubChase"><img src="/images/icon.pc.16.png" width="16" height="16" alt="PubChase">PubChase</a></li>


            <#-- twitter, as per previous implementation <http://www.saschakimmel.com/2009/05/how-to-create-a-dynamic-tweet-this-button-with-javascript/>,
            but slightly modified to work without an (evil) document.write call
            and updated to account for new twitter URL auto-shortening. in
            theory, this could/should be done in freemarker instead of via JS
            but, alas, my freemarker skills are not mad enuff. -JSB/DP -->
                <script type="text/javascript">
                    // replace tweet with one that's pre-shortened to 140 chars
                    function truncateTweetText() {
                        var twtTitle = '${article.noHTMLDocTitle?replace("\'", "\\\'")}';
                        var twtUrl = '${article.docURL?replace("\'", "\\\'")}';
                        // all URLs posted to twitter get auto-shortened to 20 chars.
                        var maxLength = 140 - (20 + 1);
                        // truncate the title to include space for twtTag and ellipsis (here, 10 = tag length + space + ellipsis)
                        if (twtTitle.length > maxLength) { twtTitle = twtTitle.substr(0, (maxLength - 10)) + '...'; }
                        // set the href to use the shortened tweet
                        $('#twitter-share-link').prop('href', 'http://twitter.com/intent/tweet?text=' + encodeURIComponent('${freemarker_config.getHashTag(journalContext)}: ' + twtTitle + ' ' + twtUrl));
                    }
                </script>
                <li><a href="http://twitter.com/intent/tweet?text=${freemarker_config.getHashTag(journalContext) + ': '?url + article.noHTMLDocTitle?url + ' ' + article.docURL?url}" onclick="truncateTweetText();" target="_blank" title="Share on Twitter" id="twitter-share-link"><img src="/images/icon.twtr.16.png" width="16" height="16" alt="Twitter">Twitter</a></li>

            <@s.url id="emailArticleURL" namespace="/article" action="emailArticle" articleURI="${articleInfoX.doi}" />
                <li><a href="${emailArticleURL}" title="Email this article"><img src="/images/icon.email.16.png" width="16" height="16" alt="Email">Email</a></li>
            </ul>
        </div>
    </div><!--end btn-reveal flt-r-->
</div><!-- end article-actions-->

<#include "../article/crossmark.ftl">

<#if articleInfoX?? && articleInfoX.relatedArticles?size gt 0>
<div class="block">
    <div class="header">
        <h3>Related PLOS Articles</h3>
    </div>
  <#list articleInfoX.relatedArticles as ra>
      <p><a href = ${"\"/article/" + ra.uri + "\""} title="Read Open-Access Article"><@articleFormat>${ra.title}</@articleFormat></a></p>
  </#list>
</div>
</#if>

<#if article.collections??>
<div class="block">
    <div class="header">
        <h3>Included in the Following Collection</h3>
    </div>
    <p>${article.collections}</p>
</div>
</#if>

<#if articleInfoX.orderedCategories?? && articleType.heading != "Correction" && articleType.heading != "Expression of Concern" && articleType.heading != "Retraction" >
<div class="block" id="subject-area-sidebar-block">
    <div class="header">
        <h3>Subject Areas</h3><div title="More information" id="subject-area-sidebar-block-help-icon"><img align="right"
                                                                                                           alt="info" src="/images/button_info.png"/><div id="subject-area-sidebar-block-help"><img align="right"
                                                                                                                                                                                                    src="/images/button_info.png"/><p>
        <b>We want your feedback.</b> Do these subject areas make sense for this article? If not, click the flag
        next to the incorrect subject area and we will review it. Thanks for your help!
    </p></div></div>
    </div>


    <ul id="subject-area-sidebar-list">
    <#--
      This bit of logic is a bit odd and perhaps should be moved to another tier due to it's complexity
      For speed of retrieval, we store categories like so in the database:

       19563 | /Biology and life sciences/Biochemistry/Proteins/Structural proteins                                                        |
       40317 | /Biology and life sciences/Computational biology/Genome analysis/Genomic databases                                          |
       40319 | /Biology and life sciences/Genetics/Genomics/Genome analysis/Genomic databases                                              |
       32801 | /Biology and life sciences/Genetics/Genomics/Microbial genomics/Bacterial genomics                                          |
       17227 | /Biology and life sciences/Microbiology/Bacteriology/Bacterial genomics                                                     |
       32805 | /Biology and life sciences/Microbiology/Microbial genomics/Bacterial genomics                                               |
       21885 | /Biology and life sciences/Microbiology/Virology/Viral replication/Viral packaging                                          |
       17961 | /Biology and life sciences/Neuroscience/Cognitive science/Artificial intelligence/Artificial neural networks                |
       42611 | /Biology and life sciences/Organisms/Viruses/Bacteriophages                                                                 |
       33271 | /Computer and information sciences/Artificial intelligence/Artificial neural networks                                       |
       42659 | /Research and analysis methods/Database and informatics methods/Biological databases/Genomic databases                      |
       42886 | /Research and analysis methods/Database and informatics methods/Biological databases/Sequence databases                     |
       32187 | /Research and analysis methods/Molecular biology techniques/Sequencing techniques/Sequence analysis/Sequence databases      |
       19657 | /Research and analysis methods/Molecular biology techniques/Sequencing techniques/Sequence analysis/Sequence motif analysis

      Notice Bacterial genomics, it appears 3 times with a differing path.  But logically, this is the same subject area with
      differing paths leading to it.  Which one we select below may be non deterministic.  But I have to display a unique
      set of subject areas.  Hence when the user performs an action of flagging, I'm only flagging one of the above terms
      Though all three may be associated with an article.  When reporting on this data, it's imperative we don't group by ID, but the
      last term in the path.
    -->
      <#assign categoryNames = [] />
      <#assign finalCategories = [] />
      <#list articleInfoX.orderedCategories as categoryModel>
        <#if (finalCategories?size) gt max_categories>
          <#break>
        </#if>
        <#if categoryModel.subCategory?has_content>
          <#assign categoryName = categoryModel.subCategory />
        <#else>
          <#assign categoryName = categoryModel.mainCategory />
        </#if>

        <#if !categoryNames?seq_contains(categoryName)>
          <#assign categoryNames = categoryNames + [categoryName] />
          <#assign finalCategories = finalCategories + [categoryModel] />
        </#if>
      </#list>
      <#list finalCategories as categoryModel>
          <li>
            <@s.url id="advancedSearchURL" unformattedQuery="subject:\"${categoryNames[categoryModel_index]}\"" namespace="/search" action="advancedSearch" />
              <a href="${advancedSearchURL}" title="Search for articles in the subject area:'${categoryNames[categoryModel_index]}'"><div class="flagText">${categoryNames[categoryModel_index]}</div></a>
              <div data-categoryid="${categoryModel.categoryID?c}" data-articleid="${articleInfoX.id?c}"
                   data-categoryname="${categoryNames[categoryModel_index]}"
                   class="flagImage<#if categoryModel.flagged> flagged</#if>" title="<#if !categoryModel.flagged>Flag '${categoryNames[categoryModel_index]}' as inappropriate<#else>Remove inappropriate flag from '${categoryNames[categoryModel_index]}'</#if>"></div>
          </li>
      </#list>
    </ul>
</div>
</#if>

<div class="ad">
    <div class="title">Advertisement</div>
<#include "../includes/article_rightbanner.ftl">
</div>

<div id="twitter-alm-timeline" class="twitter-alm-timeline"></div>

<#if commentary?has_content>
<div class="block sidebar-comments">
    <div class="header">
        <h3>Comments</h3>
    </div>
  <#list commentary as comment>
    <@s.url action="listThread" namespace="/annotation" root="${comment.ID?c}" id="commentUrl"/>
      <p><a href="${commentUrl}">${comment.title}</a><br>Posted by ${comment.creatorDisplayName}</p>
    <#if comment_index == 2>
      <#break>
    </#if>
  </#list>
</div>
</#if>

</div><!-- sidebar -->
