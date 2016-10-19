<div id="pagebdy-wrap">
  <div id="pagebdy">

    <div class="layout-625_300 cf">
      <div class="col-1">

        <div id="headlines">
          <div class="tab-block">

            <div class="nav tab-nav">
              <ul>
                <li><a href="#tab-01" data-loadurl="/recentArticles.action">most recent</a></li>
                <li><a href="#tab-02" data-loadurl="/mostViewed.action">most viewed</a></li>
                <li><a href="#tab-03" data-loadurl="/mostCommented.action">featured discussions</a></li>
              </ul>
            </div>

            <div class="tab-content">
              <div class="tab-pane" id="tab-01">
                <h3>Most Recent</h3>
                <#include "article/recentArticles.ftl">
              </div>
              <div class="tab-pane" id="tab-02">
                <h3>Most Viewed</h3>
              </div>
              <div class="tab-pane" id="tab-03">
                <h3>Featured Discussions</h3>
              </div>
            </div>

          </div>
        </div><!-- headlines -->

        
         
          
        
        
        <div class="promoted-block">
        
        <div class="promoted cf">
            <div class="type">Editorial</div>
          <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1003262"/>
          
            <@s.url namespace="/article" includeParams="none" id="article2URL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1003044"/>
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/NEW_PLOSlogo.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
                How Can <em>PLOS Computational Biology</em> Help the Biological Sciences?</a></h3>
                
                <p>As her first year as Editor-in-Chief of <em>PLOS Computational Biology</em> comes to an end, <a href="http://www.ploscompbiol.org/static/eic">Ruth Nussinov</a> takes a moment in this Editorial to reflect on the journal, reassess the needs of the community, and, more broadly, the direction of computational biology within the framework of the biological sciences.
</p>
              </div>
            </div>
          </div>

        <div class="promoted cf">
            <div class="type">Software</div>
          <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1003234"/>
          
            <@s.url namespace="/article" includeParams="none" id="article2URL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1003044"/>
            <div class="cf">
              <div class="img">
                <a href="http://www.ploscollections.org/software" title="Read Open-Access Article">
                  <img src="images/home/Software.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
                ToPS: A Framework to Manipulate Probabilistic Models of Sequence Data</a></h3>
                
                <p>In this <a href="http://www.ploscollections.org/software">Software</a> Article, the authors present ToPs (Toolkit for Probabilistic models of Sequences), a framework for the implementation of discrete probabilistic models for sequence data. They describe here the basic characteristics of ToPs and provide two examples of how to use it in practical problems.
</p>
              </div>
            </div>
          </div>
       
          
         <div class="promoted cf">
         <div class="type">Featured Research</div>

        
         
          <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1003247"/>
    <@s.url namespace="/article" includeParams="none" id="article2URL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1002972"/>
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/pcbi.1003247.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
A Horizontal Alignment Tool for Numerical Trend Discovery in Sequence Data: Application to Protein Hydropathy</a></h3>
                <p>Trend discovery is a key way to generate understanding from large amounts of data. Here, the authors present a tool to discover significantly similar trends shared between two numerical data sets. They believe that their tool may be applicable to a range of scientific, engineering, social or economic problems.</p>
                <p>This is a <em>PLOS Computational Biology</em> Methods Article. To find out more about Methods Articles, please read this <a href="http://www.ploscompbiol.org/article/info:doi/10.1371/journal.pcbi.1002972">Editorial</a>.</p>
                </div></div> <hr/>

<@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1003240"/>
    <@s.url namespace="/article" includeParams="none" id="article2URL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1002972"/>
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/pcbi.1003240.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
A Genome-Scale Integration and Analysis of <em>Lactococcus lactis</em> Translation Data</a></h3>
                <p>In this study, Racle et al. analyze protein synthesis rate and control at the genome-wide scale in the bacterium <em>Lactococcus lactis</em>. Their work provides a better understanding of translational regulation in bacteria and demonstrates how protein synthesis control is closely related to cellular metabolic states.</p>
                
       </div></div><hr/>
        
         <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1003249"/>
    <@s.url namespace="/article" includeParams="none" id="article2URL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pcbi.1002972"/>
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/pcbi.1003249.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
Ligand Clouds around Protein Clouds: A Scenario of Ligand Binding with Intrinsically Disordered Proteins</a></h3>
                <p>Intrinsically disordered proteins are widely associated with human diseases and may serve as potential drug design targets. Here, Jin et al. conducted extensive simulations to explore how small inhibitors molecules bind to the oncoprotein, c-Myc, providing insights that may help improve rational drug design.
</p>
</div></div>
              
           </div>
           

          <div class="promoted cf">
            <div class="type">Other PLOS Content</div>
            <div class="txt">
            <p><a href="http://www.plosbiology.org/"><em>PLOS Biology</em></a></p>
              <ul>
                <li><a href="http://www.plosbiology.org/article/info:doi/10.1371/journal.pbio.1001642">The Extraordinary Evolutionary History of the Reticuloendotheliosis Viruses 
   </a></li>
              </ul>
                        </div>
          </div>

        </div>
      </div><!-- col-1 -->

      <div class="col-2">

        <div id="issue" class="block">
          <div class="kicker">A Peer-Reviewed, Open Access Journal</div>
          <h3><a href="${browseIssueURL}">Current Issue</a></h3>
          <div class="img">
            <a href="${browseIssueURL}">
              <img src="/images/home/cbio.v09.i09.jpg" width="280" height="280" alt="issue cover image">
            </a>
          </div>
          <div class="txt">
            <p><strong><em><a href="/static/information">PLOS Computational Biology</a></em></strong> is a
              peer-reviewed, open-access journal featuring works of exceptional significance that further our 
              understanding of living systems at all scales through the application of computational methods. It is 
              an official journal of the <strong><a href="http://www.iscb.org/">International Society for
                Computational Biology</a></strong>.</p>
          </div>
        </div>

        <!-- begin : stay-connected block -->
        <div id="connect" class="nav">
          <ul class="lnk-social cf">
            <li class="lnk-email ir"><a href="/user/secure/profile/alerts/journal" title="E-mail Alerts">E-mail Alerts</a></li>
            <li class="lnk-rss ir"><a href="/article/feed" title="RSS">RSS</a></li>
            <li class="lnk-twtr ir"><a href="http://twitter.com/ploscompbiol" title="PLOS Computational Biology on Twitter" target=_blank>PLOS on Twitter</a></li>
            <li class="lnk-fb ir"><a href="http://www.facebook.com/plos.org" title="PLOS on Facebook" target=_blank>PLOS on Facebook</a></li>
            <li class="lnk-in ir"><a href="http://www.linkedin.com/groups?mostPopular=&gid=3484244" title="PLOS on LinkedIn" target=_blank>PLOS on LinkedIn</a></li>
            <li class="lnk-join ir"><a href="http://blogs.plos.org/" title="PLOS Blogs">PLOS Blogs</a></li>
          </ul>
        </div><!-- end : stay-connected block -->

        <div class="publish">
          <h2>Publish with PLOS</h2>
          <div class="body cf">
            <div class="item">
              <a href="${cklistURL}">Submission Instructions</a>
            </div>
            <div class="item">
              <a href="http://www.editorialmanager.com/pcompbiol/default.asp">Submit your manuscript</a>
            </div>
          </div>
        </div>

        <#assign source = 'CBI'>
        <#assign Rectangle = 353>  <!-- Ad Space : Rectangle -->

        <div class="ad">
          <div class="title">Advertisement</div>
          <@iFrameAd zone=Rectangle id="a45be456" width="300" height="250" />
        </div>

        <!-- begin : plos-blog block -->
        <div id="blog">
          <h3>From our Blogs</h3>
          <#include "blog.ftl">
          <h4><a href="http://blogs.plos.org/biologue/" title="PLOS Biologue">PLOS Biologue</a> <a href="http://blogs.plos.org/biologue/feed/"><img src="images/icon.rss.16.png" alt="RSS"></a></h4>
          <@blogFeed type="biologue"/><!--List 3 most recent posts from Biologue blog-->
          <h4><a href="http://blogs.plos.org/" title="PLOS Blogs">The PLOS Blogs</a> <a href="http://blogs.plos.org/plos/feed/"><img src="images/icon.rss.16.png" alt="RSS"></a></h4>
          <@blogFeed type="plos"/><!--ADD 3 items from external PLOS Bloggers and retain 2 items from PLOS.org blog-->
        </div><!-- end : plos-blog block -->

        <!-- begin : iscb block -->
        <div id="iscb" class="block">
          <h3><a href="http://www.iscb.org"></a><img src="/images/home/iscb-logo.gif" alt="ISCB"></h3>
          <ul class="articles">
          <li>
              <a href="/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1003241">The Regional Student Group Program of the ISCB Student Council: Stories from the Road</a>
            </li>
          <li>
              <a href="/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1003242">ISCB Computational Biology Wikipedia Competition</a>
            </li>
          <li>
              <a href="/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1003199">International Society for Computational Biology Welcomes Its Newest Class of Fellows</a>
          </li> 
          <li>
          <a href="/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1003076">Rocky Mountain Conference on Bioinformatics Celebrates 10 years </a>
          </li>
            
            
            
            
                      </ul>
        </div>
        <!-- end : iscb block -->

      </div><!-- col-2 -->
    </div><!-- layout-625_300 -->

    <!-- begin : marketing advocacy blocks -->
    <div id="adWrap" class="cf">
      <@iFrameAd zone=391 id="a81d52a6" width="320" height="150" />
      <@iFrameAd zone=405 id="a8a13713" width="320" height="150" />
      <@iFrameAd zone=407 id="afe1526d" width="320" height="150" />
    </div>
    <!-- end : marketing advocacy blocks -->

  </div><!-- pagebdy -->
</div><!-- pagebdy-wrap -->
