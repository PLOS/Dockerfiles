<#macro iFrameAd zone id height width>
  <iframe id='${id}' name='${id}'
    src='http://ads.plos.org/www/delivery/afr.php?zoneid=${zone}&amp;cb=<@randomNumber maxValue=10000/>'
    frameborder='0' scrolling='no' width='${width}' height='${height}'>
    <a href='http://ads.plos.org/www/delivery/ck.php?n=${id}&amp;cb=<@randomNumber maxValue=10000/>'
      target='_top'><img src='http://ads.plos.org/www/delivery/avw.php?zoneid=${zone}&amp;cb=<@randomNumber maxValue=10000/>&amp;n=${id}'
      border='0' alt=''/>
    </a>
  </iframe>
</#macro>
