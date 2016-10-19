<div id="pagebdy-wrap">
  <div id="pagebdy" class="relative">

    <div class="filter-bar">
      <ul>
        <li class="first"><a href="#news" class="active news">In the News</a></li>
        <li><a href="#recent" class="recent">Recent</a></li>
        <li><a href="#popular" class="popular">Most Viewed</a></li>
      </ul>
    </div><!-- /.filter-bar -->

    <div class="subject-cover">

      <div class="articles-list cf news">
        <#include "article/inthenews.ftl">
      </div><!-- /.articles-list -->


      <div class="articles-list cf recent">
        <#include "article/recentArticles.ftl">
      </div><!-- /.articles-list -->


      <div class="articles-list cf popular">
        <#include "article/mostViewed.ftl">
      </div><!-- /.articles-list -->

      <!-- begin twitter -->
      <div id="homepageTwitterStream">
        <a class="twitter-timeline" data-dnt="true"
           href="https://twitter.com/search?q=%40plosone+OR+%23plosone+OR+%5C%22PLOS+One%5C%22+OR+%5C%22plosone%5C%22+lang%3Aen"
           data-widget-id="357290350571827201"
           data-chrome="nofooter"></a>

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

      <#assign source = 'ONE'>
      <#assign Rectangle = 357>     <!-- Ad Space : Rectangle -->

      <div class="ad ad-alt ad-position">
        <@iFrameAd zone=Rectangle id="a81f67a3" width="300" height="250" />
        <div class="title">Advertisement</div>
      </div><!-- /.ad -->

      <div class="connect-with-us">
        <h2>Connect with Us</h2>
        <ul class="lnk-social cf">
          <li class="lnk-email ir"><a title="E-mail Alerts" href="/user/secure/editProfile.action?tabId=alerts">E-mail Alerts</a></li>
          <li class="lnk-rss ir"><a title="RSS" href="/taxonomy">RSS</a></li>
          <li class="lnk-twtr ir"><a target="_blank" title="PLOS ONE on Twitter" href="http://twitter.com/plosone">PLOS ONE on Twitter</a></li>
          <li class="lnk-fb ir"><a target="_blank" title="PLOS on Facebook" href="http://www.facebook.com/plos.org">PLOS on Facebook</a></li>
          <li class="lnk-join ir"><a href="http://blogs.plos.org/" title="PLOS Blogs">PLOS Blogs</a></li>
        </ul>
      </div><!-- /.connect-with-us -->

    </div><!-- /.subject-cover -->

    <div class="collections cf">

      <div class="col">
      <@iFrameAd zone=951 id="a2be8d1e" width="237" height="150"/>
      </div><!-- /.col -->

      <div class="col">
        <@iFrameAd zone=953 id="aca4f92c" width="237" height="150"/>
      </div><!-- /.col -->

      <div class="col">
        <@iFrameAd zone=955 id="a98570e1" width="237" height="150"/>
      </div><!-- /.col -->

      <div class="col col-last">
        <h2>Publish with PLOS ONE</h2>
        <h3><a href="${manuscriptURL}">Submission Instructions</a></h3>
        <h3 class="last"><a href="http://www.editorialmanager.com/pone/default.asp" target=_blank>Submit your
            Manuscript</a></h3>
      </div><!-- /.col -->

    </div><!-- /.collections -->

  </div><!-- pagebdy -->
</div><!-- pagebdy-wrap -->
<!--page-wrap closing tag is in global_footer.ftl-->

<div id="sticky-footer">
  <div class="wrapper cf">
    <#assign footerZoneId = 949>
    <h3><@iFrameAd zone=footerZoneId id="a29de95e" width="700" height="25"/></h3>
    <h4><a href="http://www.editorialmanager.com/pone/default.asp" target=_blank>Submit your Manuscript</a></h4>
    <a href="#" class="close"></a>
  </div><!-- /.wrapper -->
</div><!-- /#sticky-footer -->
