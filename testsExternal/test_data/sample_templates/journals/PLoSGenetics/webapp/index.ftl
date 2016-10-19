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
            <div class="type">Perspective</div>
            <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pgen.1003829"/>
           <@s.url namespace="/article" includeParams="none" id="article2URL" action="fetchArticle"
           articleURI="info:doi/10.1371/journal.pgen.1003788"/>
           
          
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/pgen.1003829.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
              Nucleosome Assembly Proteins Get SET to Defeat the Guardian of Chromosome Cohesion</a></h3>
                
                <p>Cohesion between sister chromosomes is a critical mechanism used by eukaryotic cells to accomplish accurate chromosome segregation. Jonathan Higgins and Mary Herbert provide a <a href="${articleURL}">Perspective</a> on the work of <a href="http://www.plosgenetics.org/doi/pgen.1003719">Yuri Moshkin and colleagues</a>, who shed new light on how cohesion processes are regulated.</p>
              </div>
            </div>
          </div>

          <div class="promoted cf">
            <div class="type">Featured Research</div>
            <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pgen.1003782"/>
            <div class="cf">
              <div class="img">
              <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/pgen.1003782.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
                The Spore Differentiation Pathway in the Enteric Pathogen <em>Clostridium difficile</em></a></h3>
               
                <p>Together with the accompanying work of <a href="http://www.plosgenetics.org/doi/pgen.1003756">Saujet and colleagues</a>, this study provides the first comprehensive description of spore morphogenesis in relation to cell type-specific gene expression in a Clostridial species that is also an important human pathogen.</p>
              </div>
            </div>
            <hr/>
            
            <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pgen.1003848"/>
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/pgen.1003848.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
                A Mutation in the <em>SUV39H2</em> Gene in Labrador Retrievers with Hereditary Nasal Parakeratosis (HNPK) Provides Insights into the Epigenetics of Keratinocyte Differentiation</a></h3>
                
                <p>These results provide the most likely causative mutation for a hereditary disease in dogs that can now be eradicated by selective breeding.</p>

              </div>
            </div>
            <hr/>
            
             <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.pgen.1003853"/>
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/pgen.1003853.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
              Genetic Architecture of Skewed X Inactivation in the Laboratory Mouse</a></h3>
                
                <p>Although mammalian females have two X chromosomes in each cell, only one is functional, while gene expression from the other is silenced. These authors took advantage of new mouse genotype and whole genome sequencing data to pinpoint the locus controlling which X chromosome is inactivated.</p>
              </div>
            </div>
           
          </div>

          <div class="promoted cf">
            <div class="type">Other PLOS Content</div>
            <div class="txt">
              <p>Browse Articles in the Genetics and Genomics Subject Area</p>
              <a href="${freemarker_config.journalUrls.PLoSBiology}/search/advanced?unformattedQuery=*%3A*&filterJournals=PLoSBiology&filterSubjects=Genetics"><em>PLOS Biology</em>;</a>
              <a href="${freemarker_config.journalUrls.PLoSMedicine}/search/advanced?unformattedQuery=*%3A*&filterJournals=PLoSMedicine&filterSubjects=Genetics"><em>PLOS Medicine</em>;</a>
              <a href="${freemarker_config.journalUrls.PLoSCompBiol}/search/advanced?unformattedQuery=*%3A*&filterJournals=PLoSCompBiol&filterSubjects=Genetics"><em>PLOS Computational Biology</em>;</a>
              <a href="${freemarker_config.journalUrls.PLoSGenetics}/search/advanced?unformattedQuery=*%3A*&filterJournals=PLoSGenetics&filterSubjects=Genetics"><em>PLOS Genetics</em>;</a>
              <a href="${freemarker_config.journalUrls.PLoSPathogens}/search/advanced?unformattedQuery=*%3A*&filterJournals=PLoSPathogens&filterSubjects=Genetics"><em>PLOS Pathogens</em>;</a>
              <a href="${freemarker_config.journalUrls.PLoSONE}/search/advanced?unformattedQuery=*%3A*&filterJournals=PLoSONE&filterSubjects=Genetics"><em>PLOS ONE</em>;</a>
              <a href="${freemarker_config.journalUrls.PLoSNTD}/search/advanced?unformattedQuery=*%3A*&filterJournals=PLoSNTD&filterSubjects=Genetics"><em>PLOS Neglected Tropical Diseases</em></a>
            </div>
            <hr/>
            <div class="txt">
              <p>Browse Article Collections</p>
              <a href="http://www.ploscollections.org/static/pbioCollections"><em>PLOS Biology</em>;</a> <a href="http://www.ploscollections.org/static/pmedCollections"><em>PLOS Medicine</em>;</a> <a href="http://www.ploscollections.org/static/pcbiCollections"><em>PLOS Computational Biology</em>;</a> <a href="http://www.ploscollections.org/static/pgenCollections"><em>PLOS Genetics</em>;</a>
              <a href="http://www.ploscollections.org/static/ppatCollections"><em>PLOS Pathogens</em>;</a> <a href="http://www.ploscollections.org/static/poneCollections"><em>PLOS ONE</em>;</a> <a href="http://www.ploscollections.org/static/pntdCollections"><em>PLOS Neglected Tropical Diseases</em></a>
            </div>
          </div>

        </div>
      </div><!-- col-1 -->

      <div class="col-2">

        <div id="issue" class="block">
          <div class="kicker">A Peer-Reviewed, Open Access Journal</div>
          <h3><a href="${browseIssueURL}">Current Issue</a></h3>
          <div class="img">
            <a href="${browseIssueURL}"><img src="/images/home/pgen.v09.i09.jpg" width="280" height="280" alt="issue cover image"></a>
          </div>
          <div class="txt">
            <p><strong><em><a href="/static/information">PLOS Genetics</a></em></strong> is a peer-reviewed,
              <strong><a href="/static/license">open-access</a></strong> journal that reflects the full
              breadth and interdisciplinary nature of <strong><a href="http://en.wikipedia.org/wiki/Genetics">genetics</a></strong> and <strong><a href="http://en.wikipedia.org/wiki/Genomics">genomics</a></strong> research by publishing
              outstanding original contributions in all areas of biology.</p>
          </div>
        </div>

        <!-- begin : stay-connected block -->
        <div id="connect" class="nav">
          <ul class="lnk-social cf">
            <li class="lnk-email ir"><a href="/user/secure/profile/alerts/journal" title="E-mail Alerts">E-mail Alerts</a></li>
            <li class="lnk-rss ir"><a href="/article/feed" title="RSS">RSS</a></li>
            <li class="lnk-twtr ir"><a href="http://twitter.com/plosgenetics" title="PLOS Genetics on Twitter" target=_blank>PLOS on Twitter</a></li>
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
              <a href="http://www.editorialmanager.com/pgenetics/default.asp">Submit your manuscript</a>
            </div>
          </div>
        </div>

        <#assign source = 'GEN'>
        <#assign Rectangle = 351>   <!-- Ad Space : Rectangle -->

        <div class="ad">
          <div class="title">Advertisement</div>
          <@iFrameAd zone=Rectangle id="aa33ac4a" width="300" height="250" />
        </div>

        <!-- begin : plos-blog block -->
        <div id="blog">
          <h3>From our Blogs</h3>
          <#include "blog.ftl">
          <h4><a href="http://blogs.plos.org/biologue/" title="PLOS Biologue">PLOS Biologue</a> <a href="http://blogs.plos.org/biologue/feed/"><img src="images/icon.rss.16.png" alt="RSS"></a></h4>
          <@blogFeed type="biologue"/><!--List 3 most recent posts from Biologue blog-->
          <h4><a href="http://blogs.plos.org/" title="PLOS Blogs">The PLOS Blogs</a> <a href="http://blogs.plos.org/plos/feed/"><img src="images/icon.rss.16.png" alt="RSS"></a></h4>
          <@blogFeed type="plos"/><!--ADD 3 items from external PLOS Bloggers and retain 2 items from PLOS.org blog-->

           <h3>From the Web</h3>
             <ul class ="articles">
             <li><a href="http://search.eurekalert.org/e3/query.html?qt=%22PLOS+Genetics%22+OR+%2Bjournal%3A%22PLOS+Genetics%22&amp;charset=iso-8859-1&amp;qc=ev3rel&amp;rf=1&amp;col=ev3rel">EurekAlert!</a></li>
              
              <li><a href="http://www.dmoz.org/Science/Biology/Genetics/">Open Directory Project</a>
              </li>
              <li><a href="http://commons.wikimedia.org/wiki/Category:Genetics">Wikimedia Commons</li></a>
           
        </div>
        
        <!-- end : plos-blog block -->


        
      </div><!-- col-2 -->
    </div><!-- layout-625_300 -->

    <!-- begin : marketing advocacy blocks -->
    <div id="adWrap" class="cf">
      <@iFrameAd zone=393 id="ac01ab80" width="320" height="150"  />
      <@iFrameAd zone=411 id="af6cac12" width="320" height="150"  />
      <@iFrameAd zone=413 id="ac8e7960" width="320" height="150"  />
    </div>
    <!-- end : marketing advocacy blocks -->

  </div><!-- pagebdy -->
</div><!-- pagebdy-wrap -->
