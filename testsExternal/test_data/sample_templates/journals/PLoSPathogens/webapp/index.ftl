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
        </div>
        <!-- headlines -->

        <div class="promoted-block">
        
         <div class="promoted cf">
          <div class="type">Featured Pearls</div>
             <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.ppat.1003462"/>
             
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/Pearls-new.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
               <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
                Bed Bugs and Infectious Disease: A Case for the Arboviruses 
                </a></h3>
                
                <p>Like other blood-feeding arthropods such as mosquitoes, ticks, or fleas, bed bugs could, in principle, also transmit human pathogens. Despite over 100 years of investigation, this has not been seen so far. However, as Zach Adelman and colleagues argue in their Pearl, the conclusion that bed bugs are annoying but not dangerous because they don't transmit infectious agents may be premature.</p>        
</div>
          </div> 
          <hr/>
            <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" 
            articleURI="info:doi/10.1371/journal.ppat.1003447"/>
             
            <div class="cf">
              <div class="img"></div>
               <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
                Relevance of Trehalose in Pathogenicity: Some General Rules, Yet Many Exceptions
                </a></h3>
                
                <p>We mammals don't have it, but trehalose is present in many organisms, including plants, invertebrates, fungi and prokaryotes. Besides serving as a storage carbohydrate, the sugar molecule can function as a stress protectant. As Patrick van Dyck and colleagues discuss in their Pearl, trehalose and its biosynthetic enzymes are recently also gaining notoriety as potent virulence factors in a number of different pathogens.</p>
                </div></div></div>
      
              <div class="promoted cf">
            <div class="type">Featured Research</div>
            <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.ppat.1003555"/>
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/ppat.1003555.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
                Quantitative Models of the Dose-Response and Time Course of Inhalational Anthrax in Humans
                </a></h3>
                
                <p>Anthrax poses a potential community health risk due to accidental or intentional aerosol release. Adi Gundlapalli, Damon Toth and colleagues have developed a quantitative dose-response model for inhalational anthrax that estimates the magnitude and timeline of potential public health consequences should a release occur and recommends a course of antibiotics to those potentially exposed.</p>
              </div>
            </div>
            <hr/>
            
            <@s.url namespace="/article" includeParams="none" id="articleURL" action="fetchArticle" articleURI="info:doi/10.1371/journal.ppat.1003543"/>
            <div class="cf">
              <div class="img">
                <a href="${articleURL}" title="Read Open-Access Article">
                  <img src="images/home/ppat.1003543.jpg" width="277" height="180" alt="article image">
                </a>
              </div>
              <div class="txt">
                <h3><a href="${articleURL}" title="Read Open-Access Article">
                The Role of Selection in Shaping Diversity of Natural <em>M. tuberculosis</em> Populations
                </a></h3>
                
                <p>Mycobacterium tuberculosum is estimated to have infected one third of the world's population. To understand the reasons, Caitlin Pepperell and colleagues analyzed complete DNA sequences from a global sample. They report evidence of both neutral and selective influences on the pathogen's genetic diversity, as well as of a 25-fold expansion of global populations coincident with explosive growth in human populations in the middle ages.</p>

              </div>
            </div>
          </div>

          <div class="promoted cf">
            <div class="type">Other PLOS Content</div>
             
             <div class="txt">
              <p><a href="http://www.plosntds.org/"><em>PLOS Neglected Tropical Diseases</em> </a></p>
              <ul>
                <li><a href="http://dx.plos.org/10.1371/journal.pntd.0002227">
                   Addressing Ethical, Social, and Cultural Issues in Global Health Research
                   </a></li>
              </ul>
          </div>
              <hr/>
            
             <div class="txt">
              <p><a href="http://www.plosgenetics.org/"><em>PLOS Genetics</em></a></p>
              <ul>
                <li><a href="http://dx.plos.org/10.1371/journal.pgen.1003621">
                Genetic Mapping of Specific Interactions between <em>Aedes aegypti</em> Mosquitoes and Dengue Viruses
                </a></li>
              </ul>
            </div>
            <hr/>
          
          <div class="txt">
              <p><a href="http://www.plosmedicine.org/"><em>PLOS Medicine</em> </a></p>
              <ul>
                <li><a href="http://dx.plos.org/10.1371/journal.pmed.1001494">
                Switching HIV Treatment in Adults Based on CD4 Count Versus Viral Load Monitoring: A Randomized, Non-Inferiority Trial in Thailand
                </a></li>
              </ul>
            </div></div></div></div>
<!-- col-1 -->

      <div class="col-2">

        <div id="issue" class="block">
          <div class="kicker">A Peer-Reviewed, Open Access Journal</div>
          <h3><a href="${browseIssueURL}">Current Issue</a></h3>
          <div class="img">
            <a href="${browseIssueURL}">
              <img src="/images/home/path.v09.i07.jpg" width="280" height="280" alt="issue cover image">
            </a>
          </div>
          <div class="txt">
            <p><strong><em><a href="/static/information">PLOS Pathogens</a></em></strong> is an <strong><a href="/static/license">open-access</a></strong> journal that publishes important
              new ideas on bacteria, fungi, parasites, prions, and viruses that contribute to our understanding of the biology of pathogens and pathogen-host interactions.</p>
          </div>
        </div>

        <!-- begin : stay-connected block -->
        <div id="connect" class="nav">
          <ul class="lnk-social cf">
            <li class="lnk-email ir"><a href="/user/secure/profile/alerts/journal" title="E-mail Alerts">E-mail Alerts</a></li>
            <li class="lnk-rss ir"><a href="/article/feed" title="RSS">RSS</a></li>
            <li class="lnk-twtr ir"><a href="http://twitter.com/plospathogens" title="PLOS Pathogen on Twitter" target=_blank>PLOS on Twitter</a></li>
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
              <a href=" http://www.editorialmanager.com/ppathogens/default.asp">Submit your manuscript</a>
            </div>
          </div>
        </div>

        <#assign source = 'PAT'>
        <#assign Rectangle = 355>       <!-- Ad Space : Rectangle -->

        <div class="ad">
          <div class="title">Advertisement</div>
          <@iFrameAd zone=Rectangle id="aa0e47c5" width="300" height="250" />
        </div>

        <!-- begin : plos-blog block -->
        <div id="blog">
          <h3>From our Blogs</h3>
          <h4><a href="http://blogs.plos.org/speakingofmedicine" title="PLOS Blogs">Speaking of Medicine</a> <a href="http://blogs.plos.org/speakingofmedicine/feed/"><img src="images/icon.rss.16.png" alt="RSS"></a></h4>
          <#include "blog.ftl">
          <@blogFeed type="som"/><!--List 3 most recent posts from Speaking of Medicine blog-->
          <h4><a href="http://blogs.plos.org/" title="PLOS Blogs">The PLOS Blogs</a> <a href="http://blogs.plos.org/plos/feed/"><img src="images/icon.rss.16.png" alt="RSS"></a></h4>
          <#include "blog.ftl">
          <@blogFeed type="plos"/><!--ADD 3 items from external PLOS Bloggers and retain 2 items from PLOS.org blog-->
        </div><!-- end : plos-blog block -->

        <!-- begin twitter -->
        <div id="homepageTwitterStream">
          <a class="twitter-timeline" data-dnt="true"
             href="https://twitter.com/search?q=%40plospathogens+OR+%23plospathogens+OR+%5C%22PLOS+Pathogens%5C%22+OR+%5C%22plospathogens%5C%22+lang%3Aen"
             data-widget-id="357271816168955904"
             data-chrome="nofooter">Tweets about PLOS Pathogens</a>

          <script>
            !function (d, s, id) {
               var js, fjs = d.getElementsByTagName(s)[0],
                 p = /^http:/.test(d.location) ? 'http' : 'https';

                if (!d.getElementById(id)) {
                  js = d.createElement(s);
                  js.id = id;
                  js.src = p + "://platform.twitter.com/widgets.js";
                  fjs.parentNode.insertBefore(js, fjs);
                }
            }(document, "script", "twitter-wjs");

            //Wait for a response from twitter, and then render the content
            function displayOnComplete() {
              if($(".twitter-timeline-rendered").height() >= 10) {
                clearInterval(twitter_interval_handle);
                $(".twitter-timeline-rendered").fadeIn("slow");
              }
            }

            var twitter_interval_handle = setInterval(displayOnComplete, 100);
          </script>
        </div>
        <!-- end twitter -->
      </div><!-- col-2 -->
    </div><!-- layout-625_300 -->

    <!-- begin : marketing advocacy blocks -->
    <div id="adWrap" class="cf">
      <@iFrameAd zone=395 id="abc6f855" width="320" height="150" />
      <@iFrameAd zone=431 id="a67a849d" width="320" height="150" />
      <@iFrameAd zone=433 id="a1b2d3c2" width="320" height="150" />
    </div>
    <!-- end : marketing advocacy blocks -->
  </div><!-- pagebdy -->
</div><!-- pagebdy-wrap -->
